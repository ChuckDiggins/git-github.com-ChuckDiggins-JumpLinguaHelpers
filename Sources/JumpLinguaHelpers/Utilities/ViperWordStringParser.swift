//
//  WordStringParser.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/8/21.
//

import Foundation

public class ViperWordStringParser {
    
//    private var spanishWords = SpanishWords()
//    private var frenchWords = FrenchWords()
//    private var englishWords = EnglishWords()
    public var generalWords = GeneralWords()  //general purpose ... will replace spanish, french and english words
    public var m_language : LanguageType
    public var spanVerbModel : RomanceVerbModelConjugation
    public var frenchVerbModel : RomanceVerbModelConjugation
    public var englishVerbModel : EnglishVerbModelConjugation
    
    public init(language: LanguageType, span: RomanceVerbModelConjugation, french: RomanceVerbModelConjugation, english : EnglishVerbModelConjugation){
        m_language = language
        spanVerbModel = span
        frenchVerbModel = french
        englishVerbModel = english
        //createDictionaries()
    }
    
    public func getLanguage()->LanguageType{
        return m_language
    }
    
    public func addPronounToDictionary(wd: Pronoun){
        generalWords.pronounList.append(wd)
    }
    
    public func addVerbToDictionary(verb: Verb){
        generalWords.verbList.append(verb)
    }
    
    
    public func getGeneralWords()->GeneralWords{
        return generalWords
    }
    
//    public func getSpanishWords()->SpanishWords{
//        return spanishWords
//    }
//
//    public func getFrenchWords()->FrenchWords{
//        return frenchWords
//    }
//
//    public func getEnglishWords()->EnglishWords{
//        return englishWords
//    }
//
    
    public func isNewVerb(verb: Verb)->Bool{
        for word in generalWords.verbList {
            if verb.word == word.word {
                return false
            }
        }
        return true
    }

    public func getVerbList()->Array<Word>{
        return generalWords.verbList
    }
    
    public func getVerbCount()->Int{
        return generalWords.verbList.count
    }
    
    public func getWordCounts(){
        print("Adjective count = \(getWordCount(wordType: .adjective))")
        print("Adverb count = \(getWordCount(wordType: .adverb))")
        print("Determiner count = \(getWordCount(wordType: .determiner))")
        print("Conjunction count = \(getWordCount(wordType: .conjunction))")
        print("Noun count = \(getWordCount(wordType: .noun))")
        print("Preposition count = \(getWordCount(wordType: .preposition))")
        print("Pronoun count = \(getWordCount(wordType: .pronoun))")
        print("Verb count = \(getWordCount(wordType: .verb))")
    }
    
    public func getWordCount(wordType: WordType)->Int{
        switch wordType{
        case .adjective: return generalWords.adjectiveList.count
        case .adverb: return generalWords.adverbList.count
        case .conjunction: return generalWords.conjunctionList.count
        case .determiner: return generalWords.determinerList.count
        case .noun: return generalWords.nounList.count
        case .preposition: return generalWords.prepositionList.count
        case .pronoun: return generalWords.pronounList.count
        case .verb: return generalWords.verbList.count
        default: return 0
        }
    }
    
    public func getWordList(wordType: WordType)->Array<Word>{
        switch wordType{
        case .adjective: return generalWords.adjectiveList
        case .adverb: return generalWords.adverbList
        case .conjunction: return generalWords.conjunctionList
        case .determiner: return generalWords.determinerList
        case .noun: return generalWords.nounList
        case .preposition: return generalWords.prepositionList
        case .pronoun: return generalWords.pronounList
        case .verb: return generalWords.verbList
        default: return Array<Word>()
        }
    }
    
    public func getNounList()->Array<Word>{
        return generalWords.nounList
    }
    
    public func getNounCount()->Int{
        return generalWords.nounList.count
    }
    
    public func getAdjectiveList()->Array<Word>{
        return generalWords.adjectiveList
    }
    
    public func getAdjectiveCount()->Int{
        return generalWords.adjectiveList.count
    }
    
    public func getDeterminerList()->Array<Word>{
        return generalWords.determinerList
    }
    
    public func getDeterminerCount()->Int{
        return generalWords.determinerList.count
    }
    
    public func getPrepositionCount()->Int{
        return generalWords.prepositionList.count
    }
    
    /*
    mutating func appendJsonVerbToDictionary()->Int{
        //romanceWords.verbList.append(verb)
        return romanceWords.verbList.count
    }
    */
    
    public func getAgnosticWordFromDictionary(wordType:WordType, index:Int)->Word{
        switch wordType {
        case .determiner: return generalWords.determinerList[index]
        case .adjective: return generalWords.adjectiveList[index]
        case .adverb: return generalWords.adverbList[index]
        case .conjunction: return generalWords.conjunctionList[index]
        case .noun: return generalWords.nounList[index]
        case .verb: return generalWords.verbList[index]
        case .preposition: return generalWords.prepositionList[index]
        case .pronoun: return generalWords.pronounList[index]
        //case .punctuation: return generalWords.punctuationList[index]
        default: return Word()
        }
    }
    
    //create the correct verb on the fly
    public func getVerbFromDictionary(language: LanguageType, index: Int)->Verb{
        var verb = Verb()
        switch language {
        case .Spanish:
            verb = generalWords.verbList[index] as! SpanishVerb
            let bv = BSpanishVerb(verbPhrase: verb.spanish)
            let verbModel = spanVerbModel.getVerbModel(verbWord: bv.m_verbWord)
            bv.setPatterns(verbModel : verbModel)
            verb.setBVerb(bVerb: bv)
        case .French:
            verb = generalWords.verbList[index] as! FrenchVerb
            let bv = BFrenchVerb(verbPhrase: verb.french)
            let verbModel = frenchVerbModel.getVerbModel(verbWord: bv.m_verbWord)
            bv.setPatterns(verbModel : verbModel)
            verb.setBVerb(bVerb: bv)
        case .English:
            verb = generalWords.verbList[index] as! EnglishVerb
            let brv = BEnglishVerb(verbPhrase : verb.english, separable: .separable)
            let verbModel = englishVerbModel.getVerbModel(verbWord: verb.english)
            brv.setModel(verbModel : verbModel)
            verb.setBVerb(bVerb: brv)
        default:
            break
        }
        return verb
    }
}
    
//    public func getVerbA(wordString: String)->SentenceData{
//        var sd = SentenceData()
//
//        switch m_language {
//        case .Spanish:
//            for word in spanishWords.verbList {
//                if wordString == word.word {
//                    sd.word = word
//                    sd.data.wordType = .V
//                    sd.data.tense = .infinitive
//                    return sd
//                }
//                /*
//                else {
//                    let result = unConjugate(verbForm : wordString)
//                    let bVerb = result.1
//                    if !bVerb.m_verbWord.isEmpty {
//                        if ( bVerb.isAuxiliary() ){
//                            sd.data.verbType = .auxiliary
//                        }else if ( bVerb.m_verbWord == "estar" || bVerb.m_verbWord == "haber"){
//                            sd.data.verbType = .auxiliary
//                        }
//                        sd.word = result.0
//                        sd.data.wordType = .verb
//                        sd.data.tense = result.2
//                        sd.data.person = result.3
//                        return sd
//                    }
//                    return sd
//                }
// */
//            }
//        case .French:
//            for word in frenchWords.verbList {
//                if wordString == word.word {
//                    sd.word = word
//                    sd.data.wordType = .V
//                    sd.data.tense = .infinitive
//                    return sd
//                }
//                else {
//                    let verb = word as! RomanceVerb
//
//                    let result = verb.isConjugateForm(word: wordString)
//
//                    if ( result.0 ){
//                        sd.word = word
//                        sd.data.wordType = .V
//                        sd.data.tense = result.1
//                        sd.data.person = result.2
//                        return sd
//                    }
//                }
//            }
//        case .English:
//            for word in englishWords.verbList {
//                let verb = word as! EnglishVerb
//                let result = verb.isConjugateForm(word: wordString)
//                if ( result.0 ){
//                    sd.word = word
//                    sd.data.wordType = .V
//                    sd.data.tense = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//            }
//        case .Italian,.Portuguese, .Agnostic:
//            return sd
//        }
//        return sd
//    }
//
//    public func getPronoun(wordString: String)->SentenceData{
//        var sd = SentenceData()
//
//        switch m_language {
//        case .Spanish:
//
//            for word in spanishWords.pronounList {
//                let pronoun = word as! SpanishPronoun
////                let pronounList = pronoun.isPronoun(word: wordString)
//                var result = pronoun.isSubjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .SUBJECT)
//                    sd.data.wordType = .PersPro
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isReflexivePronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .REFLEXIVE)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isIndirectObjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .INDIRECT_OBJECT)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isDirectObjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .DIRECT_OBJECT)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isPrepositionalPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString,type: .PREPOSITIONAL)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//            }
//        case .French:
//            for word in frenchWords.pronounList {
//                let pronoun = word as! FrenchPronoun
////                let pronounList = pronoun.isPronoun(word: wordString)
//
//                var result = pronoun.isSubjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .SUBJECT)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isReflexivePronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .REFLEXIVE)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isIndirectObjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .INDIRECT_OBJECT)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isDirectObjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .DIRECT_OBJECT)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//                result = pronoun.isPrepositionalPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = Pronoun(word: wordString, type: .PREPOSITIONAL)
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                    return sd
//                }
//            }
//
//        case .English:
//            for word in englishWords.pronounList {
//                let pronoun = word as! EnglishPronoun
//                let result = pronoun.isSubjectPronoun(word: wordString)
//                if result.0 != .none {
//                    sd.word = word
//                    sd.data.wordType = .Pronoun
//                    sd.data.pronounType = result.0
//                    sd.data.gender = result.1
//                    sd.data.person = result.2
//                }
//            }
//        case .Italian,.Portuguese, .Agnostic:
//            return sd
//        }
//        return sd
//
//    }
//}

//extension StringProtocol {
//    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
//        range(of: string, options: options)?.lowerBound
//    }
//    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
//        range(of: string, options: options)?.upperBound
//    }
//    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
//        ranges(of: string, options: options).map(\.lowerBound)
//    }
//    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
//        var result: [Range<Index>] = []
//        var startIndex = self.startIndex
//        while startIndex < endIndex,
//            let range = self[startIndex...]
//                .range(of: string, options: options) {
//                result.append(range)
//                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
//                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
//        }
//        return result
//    }
//}
//

