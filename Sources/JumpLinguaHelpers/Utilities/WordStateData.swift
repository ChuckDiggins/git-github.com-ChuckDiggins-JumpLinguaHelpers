//
//  WordStateData.swift
//  ContextFree
//
//  Created by Charles Diggins on 6/5/21.
//

import Foundation

public class WordStateData : Hashable, Equatable {
    var title: String = ""
    public func hash(into hasher: inout Hasher){
        hasher.combine(title)
    }
    
    public var word = Word()
    public var processedWord = ""  //this will show the current state of this word
    public var processedSpanishWord = "psw"
    public  var processedFrenchWord = "pfw"
    public var processedEnglishWord = "pew"
    
    public var spanishContraction = "psw"
    public var frenchContraction = "pfw"
    public var englishContraction = "pew"
    
    //states
    public var language = LanguageType.Spanish
    public var tense = Tense.infinitive
    public var person = Person.S1
    public var number = Number.singular
    public var gender = Gender.masculine
    
    //identity
    public var wordType = ContextFreeSymbol.AMB
    public var ambiguousType = AmbiguousType.general
    public var adverbType = AdverbType.manner
    public var articleType = ArticleType.definite
    public var conjunctionType = ConjunctionType.coordinating
    public var determinerType = DeterminerType.definite
    public var adjectiveType = AdjectiveType.any
    public var adjectivePosition = AdjectivePositionType.following
    public var prepositionType = PrepositionType.general
    public var personalPronounType = PronounType.PERSONAL  //ambiguous until set
    public var pronounType = PronounType.none
    public var punctuationType = PunctuationType.none
    
    public var nounType = NounType.any
    public var nounSubjectivity = NounSubjectivity.either
    
    public var verbModality = VerbModality.notModal
    public var verbPassivity = VerbPassivity.active
    public var verbPronominality = VerbPronomality.notPronominal
    public var verbPreference = VerbPreference.any
    public var verbTransitivity = VerbTransitivity.transitive
    public var verbType = VerbType.normal
    public var bescherelleInfo = ""
    
    public static func == (lhs: WordStateData, rhs: WordStateData) -> Bool {
        return lhs.word.word == rhs.word.word
    }
    
    public func getWordType()->ContextFreeSymbol{
        return wordType
    }
    
    public func getWordTypeString()->String{
        return wordType.rawValue
    }
    
    public func setProcessedWord(str: String){
        processedWord = str
    }
    
    public func setProcessedWord(language: LanguageType, str: String){
        switch language{
        case .Spanish:
            processedSpanishWord = str
        case .French:
            processedFrenchWord = str
        case .English:
            processedEnglishWord = str
        default:
            break
        }
     }
     
    public func getProcessedWord()->String{
        return processedWord
    }
    
    public func getProcessedWord(language: LanguageType)->String{
        switch language{
        case .Spanish:
            return processedSpanishWord
        case .French:
            return processedFrenchWord
        case .English:
            return processedEnglishWord
        default:
            return "NA"
        }
    }

}
