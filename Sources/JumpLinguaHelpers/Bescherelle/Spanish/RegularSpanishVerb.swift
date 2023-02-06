//
//  VerbFormsRegular.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 11/17/20.
//

import Foundation
import JumpLinguaHelpers

//chuck
public struct RegularSpanishVerb {
    
    public mutating func createPassiveForm(verbEnding : VerbEnding, inputMorphStruct : MorphStruct, verbWord : String, preposition : String, tense: Tense, person : Person)-> MorphStruct {
        
        var morphStruct = inputMorphStruct
        var morphStep : MorphStep
        
        let passivePerson = Person.allCases[person.getIndex()]
        
        
        var ss = verbWord
        
        if ( tense == .present || tense == .preterite || tense == .imperfect )
        {
        morphStep = MorphStep()
        ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        morphStep.part1 = ss
        morphStep.part2 = verbEnding.rawValue
        morphStep.comment = getMorphComment(.removeEnding, verbEnding.rawValue)
        morphStep.verbForm = ss + "__"
        morphStruct.append(morphStep : morphStep)
        }
        
        var endingString : String
        switch verbEnding {
        case .AR:
            endingString = getARConjugation(tense: tense, person: passivePerson)
        case .ER:
            endingString = getERConjugation(tense: tense, person: passivePerson)
        case .IR:
            endingString = getIRConjugation(tense: tense, person: passivePerson)
        case .accentIR:
            endingString = getIRConjugation(tense: tense, person: passivePerson)
        default:
            endingString = "unknown"
        }
        morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.verbForm = ss + endingString
        morphStep.comment = getMorphComment(.appendEnding, endingString)
        morphStruct.append(morphStep : morphStep)
        
        return morphStruct
    }
    
    public func getConjugationEnding (verbWord : String, tense: Tense, person : Person )->String {
        let  verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var endingString : String
        switch verbEnding {
        case .AR:
            endingString = getARConjugation(tense: tense, person: person)
        case .ER:
            endingString = getERConjugation(tense: tense, person: person)
        case .IR, .accentIR, .RE:
            endingString = getIRConjugation(tense: tense, person: person)
        default:
            endingString = "unknown"
        }
        return endingString
    }
    
    public func createImperativeS2Form(inputMorphStruct : MorphStruct, changeFrom : String, changeTo : String)-> MorphStruct {
        var morphStruct = inputMorphStruct
        var morphStep = MorphStep()
        
        var ss = inputMorphStruct.finalVerbForm()
        for _ in 0 ..< changeFrom.count {
            ss.removeLast()
        }
        morphStep = MorphStep()
        morphStep.verbForm = ss + changeFrom
        morphStep.part1 = ss
        morphStep.part2 = changeFrom
        morphStep.part3 = ""
        morphStep.comment = getMorphComment(.grabThis, changeFrom)
        morphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.part1 = ss
        morphStep.part2 = changeTo
        morphStep.part3 = ""
        morphStep.verbForm = ss + changeTo
        ss = morphStep.verbForm
        morphStep.comment = getMorphComment(.replaceWith, changeTo)
        morphStruct.append(morphStep : morphStep)
        morphStruct.isOrtho = true
        return morphStruct
    }
    
    public func createStemOrthoForm(verbEnding: VerbEnding, inputMorphStruct : MorphStruct, verbWord : String, preposition : String, tense: Tense, person : Person, orthoFrom : String, orthoTo : String)-> MorphStruct {
        var morphStruct = inputMorphStruct
        var morphStep = MorphStep()
        
        if ( tense == .present || tense == .presentSubjunctive ){
            morphStep.setTrue(flag: .orthoPresent)
        }
        
        var ss = inputMorphStruct.finalVerbForm()
        
        /*
         morphStep.index = ss.count-1
         morphStep.morphType = .removeVerbEnding
         morphStep.verbForm = ss
         morphStep.part1 = ss
         morphStep.part2 = verbEnding.getEnding()
         morphStep.comment = "Grab the verb ending ->" + verbEnding.rawValue  //this ain't exactly right
         morphStruct.append(morphStep : morphStep)
         */
        
        
        //ss is now the verbStem - remove orthoFrom from the end - hopefully
        
        for _ in 0 ..< orthoFrom.count {
            ss.removeLast()
        }
        morphStep = MorphStep()
        morphStep.verbForm = ss + orthoFrom
        morphStep.part1 = ss
        morphStep.part2 = orthoFrom
        morphStep.part3 = ""
        morphStep.comment = getMorphComment(.grabThis, orthoFrom)
        morphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.part1 = ss
        morphStep.part2 = orthoTo
        morphStep.part3 = ""
        morphStep.verbForm = ss + orthoTo
        ss = morphStep.verbForm
        morphStep.comment = getMorphComment(.replaceWithOrthoForm, orthoTo)
        morphStruct.append(morphStep : morphStep)
        morphStruct.isOrtho = true
        return morphStruct
    }
    
    
    public func createRegularOrthoForm(verbEnding: VerbEnding, inputMorphStruct : MorphStruct, verbWord : String, preposition : String, tense: Tense, person : Person,
                                       orthoFrom : String, orthoTo : String)-> MorphStruct {
        let  verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var morphStruct = inputMorphStruct
        var morphStep = MorphStep()
        
        if ( tense == .present || tense == .presentSubjunctive ){
            morphStep.setTrue(flag: .orthoPresent)
        }
        
        if ( tense == .preterite ){
            morphStep.setTrue(flag: .orthoPreterite)
        }
        
        let vu = VerbUtilities()
        
        //final verb form can come to this point in two separate ways
        
        var ss = inputMorphStruct.finalVerbForm()
        let phraseVerbEnding = vu.phraseEndsInVerbEnding(testString: ss)
        if phraseVerbEnding != .none {
            ss = VerbUtilities().remove2LetterVerbEnding(word: ss)
            morphStep.verbForm = ss
            morphStep.part1 = ss
            morphStep.part2 = verbEnding.getEnding()
            morphStep.comment = getMorphComment(.grabEnding, verbEnding.rawValue)//this ain't exactly right
            morphStruct.append(morphStep : morphStep)
        }
        else {
            let result = vu.analyzeSpanishWordPhrase(testString: ss)
            switch result.1 {
            case .AR, .ER, .IR, .accentIR:
                ss = VerbUtilities().remove2LetterVerbEnding(word: ss)
                morphStep.verbForm = ss
                morphStep.part1 = ss
                morphStep.part2 = verbEnding.getEnding()
                morphStep.comment = getMorphComment(.grabEnding, verbEnding.rawValue)//this ain't exactly right
                morphStruct.append(morphStep : morphStep)
            default:
                break
            }
        }
        
        //ss is now the verbStem - remove orthoFrom from the end - hopefully
        
        for _ in 0 ..< orthoFrom.count {
            ss.removeLast()
        }
        morphStep = MorphStep()
        morphStep.verbForm = ss
        morphStep.part1 = ss
        morphStep.part2 = orthoFrom
        morphStep.comment = getMorphComment(.grabThis, orthoFrom)
        morphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.part1 = ss
        morphStep.part2 = orthoTo
        morphStep.verbForm = ss + orthoTo
        ss = morphStep.verbForm
        morphStep.comment = getMorphComment(.replaceWithOrthoForm, orthoTo)
        morphStruct.append(morphStep : morphStep)
        
        let endingString  = getVerbEndingString(verbEnding : verbEnding, tense: tense, person: person)
        
        morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.verbForm = ss + endingString
        morphStep.comment = getMorphComment(.appendEnding, endingString)
        morphStruct.append(morphStep : morphStep)
        morphStruct.isOrtho = true
        
        return morphStruct
    }
    
    
    public func replaceForm(inputMorphStruct : MorphStruct, person: Person, from: String, to: String)->MorphStruct{
        
        var morphStruct = inputMorphStruct
        
        var verbForm = inputMorphStruct.finalVerbForm()
        
        verbForm = String(verbForm.dropLast(from.count)) //drop the from suffix or something as long as it from verbForm
        
        var morphStep = MorphStep()
        morphStep.isIrregular = true
        morphStep.verbForm = verbForm
        morphStep.part1 = verbForm
        morphStep.part2 = from
        morphStep.comment = getMorphComment(.grabThis, from)
        morphStruct.append(morphStep : morphStep)
        
        //        verbForm = String(verbForm.dropLast(from.count))
        
        morphStep = MorphStep()
        morphStep.verbForm = verbForm + to
        morphStep.part1 = verbForm
        morphStep.part2 = to
        morphStep.comment = getMorphComment(.replaceWith, to)
        morphStruct.append(morphStep : morphStep)
        morphStruct.isStem = true
        return morphStruct
    }
    
    public func replaceEndingForm(inputMorphStruct : MorphStruct, from: String, to: String)->MorphStruct{
        let verbWord = inputMorphStruct.finalVerbForm()
        
        let verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var morphStruct = inputMorphStruct
        
        var ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        let comment = getMorphComment(.removeEnding, verbEnding.rawValue)
        
        _ = morphStruct.createAndAppendMorphStep(verbForm:ss+"__", isFinalStep: false,comment:comment, preposition:"",
                                                 part1:ss, part2: verbEnding.getEnding(), part3: "" )
        
        var morphStep = MorphStep()
        morphStep.isIrregular = true
        
        morphStep.part1 = ss
        morphStep.part2 = to
        ss.append(to)
        morphStep.isFinalStep = true
        morphStep.verbForm = ss
        morphStep.comment = getMorphComment(.appendEnding, to)
        morphStruct.append(morphStep : morphStep)
        
        return morphStruct
    }
    
    //ignores the verb model.  This is for conjugating any verb as if it were regular
    
    public func conjugateAsRegularVerbWithThisVerbEnding(verbEnding: VerbEnding, verbStr: String, tense: Tense, person: Person)->String{
        let vu = VerbUtilities()
        let result = vu.analyzeSpanishWordPhrase(testString: verbStr)
        var verbStem = result.0
        //don't remove the verb ending for future and conditional
        if tense != .future && tense != .conditional {
            verbStem.removeLast()
            verbStem.removeLast()
        }
        let endingString = getVerbEndingString(verbEnding: verbEnding, tense: tense, person: person)
        let verbForm = verbStem + endingString
        return verbForm
    }
    
    public func conjugateAsRegularForm(verb: Verb, tense: Tense, person: Person)->String {
        if tense == .imperative && person == .S1 { return ""}
        let vu = VerbUtilities()
        let spVerb = SpanishVerb(word: verb.word, type: .normal)
        spVerb.spanish = verb.word
        let result = vu.analyzeSpanishWordPhrase(testString: verb.word)
        let verbEnding = result.1
        var verbStem = result.0
        var verbForm = ""
        if tense.isPerfectIndicative() {
            let perfectVerbHaber = ActiveVerbConjugationSpanish().getPerfectVerb(tense: tense, person: person)
            let pp = verb.bVerb.getPastParticiple()
            verbForm = perfectVerbHaber + " " + pp
        } else if tense.isProgressive(){
            let perfectVerbEstar = ActiveVerbConjugationSpanish().getProgressiveVerb(tense: tense, person: person)
            let pp = verb.bVerb.getPresentParticiple()
            verbForm = perfectVerbEstar + " " + pp
        } else {
            //don't remove the verb ending for future and conditional
            if tense != .future && tense != .conditional {
                verbStem.removeLast()
                verbStem.removeLast()
            }
            let endingString = getVerbEndingString(verbEnding: verbEnding, tense: tense, person: person)
            verbForm = verbStem + endingString
        }
        return verbForm
    }
    
    public func createRegularForm(verbEnding: VerbEnding, inputMorphStruct : MorphStruct, verbWord : String, preposition : String, tense: Tense, person : Person, p3PreteriteVerbFormInput: String)-> MorphStruct {
        
        var endingString = verbEnding.getEnding()
        var reflexivePronoun = ""
        var morphStruct = inputMorphStruct
        var morphStep : MorphStep
        var p3PreteriteVerbForm = p3PreteriteVerbFormInput
        var ss = verbWord
        
        //if imperfectSubjunctive, use the preterite P3 form as the starting point
        if ( tense == .imperfectSubjunctiveRA || tense == .imperfectSubjunctiveSE )
        {
        if morphStruct.isReflexive(){
            reflexivePronoun = morphStruct.getReflexivePronoun()
            p3PreteriteVerbForm = String(p3PreteriteVerbForm.dropFirst(3))  //drops the existing "se "
        }
        morphStep = MorphStep()
        morphStep.part1 = reflexivePronoun
        morphStep.part2 = p3PreteriteVerbForm
        morphStep.verbForm = morphStep.part1 + morphStep.part2
        morphStep.comment = getMorphComment(.startWithPretP3, p3PreteriteVerbForm)
        morphStruct.append(morphStep : morphStep)
        
        ss = morphStep.verbForm  //should contain the reflexive pronoun, if any
        
        var preteriteEnding = p3PreteriteVerbForm.suffix(4)
        ss.removeLast()
        ss.removeLast()
        ss.removeLast()
        ss.removeLast()
        
        // for er or ir verbs, remove the final i also
        var lastChar = VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 1)
        let lastChars = VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 2)
        //don't want to remove the last "i" for verbs ending in "ciar"
        
        if ( lastChar == "i" ) {
            if verbEnding == .ER || verbEnding == .IR || verbEnding == .accentIR {
                ss.removeLast()
                preteriteEnding = p3PreteriteVerbForm.suffix(5)
            }
        }
        //now get the new last letter
        
//        lastChar = VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 1)
        morphStep = MorphStep()
        morphStep.verbForm = ss
        morphStep.part1 = ss
        morphStep.part2 = String(preteriteEnding)
        
        morphStep.comment = getMorphComment(.removeEnding, morphStep.part2)
        morphStruct.append(morphStep : morphStep)
        
        //certain irregular AR verbs are conjugated as ER in this tense
        
        var conjugateAsER = false
        if (p3PreteriteVerbForm == "anduvieron" || p3PreteriteVerbForm == "dieron"){
            conjugateAsER = true
        }
        
        //if last character(s) is y or ñ or ll, we have to drop the i for orthographic purposes
        
        if  ss == "d" || conjugateAsER {
            if ( ss == "d" ){ss = "di"}  //special logic for handling dar
            
            endingString = getImperfectSubjConjugation(tense: tense, person: person)
            morphStep = MorphStep()
            morphStep.isFinalStep = true
            morphStep.verbForm = ss + endingString
            morphStep.part1 = ss
            morphStep.part2 = endingString
            morphStep.comment = getMorphComment(.appendEnding, endingString)
            morphStruct.append(morphStep : morphStep)
            return morphStruct
        }
        if lastChar == "y" || lastChar == "ñ" || lastChars == "ll" || lastChar == "j"  {
            endingString = getOrthoImperfectSubjConjugation(tense: tense, person: person, verbEnding: verbEnding)
            morphStep = MorphStep()
            morphStep.isFinalStep = true
            morphStep.verbForm = ss + endingString
            morphStep.part1 = ss
            morphStep.part2 = endingString
            morphStep.comment = getMorphComment(.appendEnding, endingString)
            morphStruct.append(morphStep : morphStep)
            return morphStruct
        }
        }
        
        //remove the verb ending unless the tense is future or conditional
        
        else if ( tense != .future && tense != .conditional )
        {
        ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        morphStep = MorphStep()
        morphStep.verbForm = ss
        morphStep.comment = getMorphComment(.grabEnding, verbEnding.getEnding())
        morphStep.part1 = ss
        morphStep.part2 = verbEnding.getEnding()
        morphStep.part3 = ""
        morphStruct.append(morphStep : morphStep)
        
        }
        return attachRegularVerbEnding(morphStruct : morphStruct, tense: tense, person: person, verbEnding: verbEnding)
        
    }
    
    public func attachRegularVerbEnding(morphStruct: MorphStruct, tense: Tense, person: Person, verbEnding: VerbEnding)->MorphStruct{
        var workingMorphStruct = morphStruct
        var endingString : String
        
        switch verbEnding {
        case .AR:
            endingString = getARConjugation(tense: tense, person: person)
        case .ER:
            endingString = getERConjugation(tense: tense, person: person)
        case .IR, .accentIR, .RE:
            endingString = getIRConjugation(tense: tense, person: person)
        default:
            endingString = "unknown"
        }
        
        let ss = workingMorphStruct.finalVerbForm()
        
        var morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.verbForm = ss + endingString
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.comment = getMorphComment(.replaceWith, endingString)
        workingMorphStruct.append(morphStep : morphStep)
        
        return workingMorphStruct
    }
    
    public func getVerbEndingString(verbEnding : VerbEnding, tense: Tense, person: Person)->String {
        switch verbEnding {
        case .AR:
            return getARConjugation(tense: tense, person: person)
        case .ER:
            return getERConjugation(tense: tense, person: person)
        case .IR,.accentIR,.RE:
            return getIRConjugation(tense: tense, person: person)
        default:
            return "unknown"
        }
    }
    
    public func getOrthoImperfectSubjConjugation(tense: Tense, person : Person, verbEnding: VerbEnding)->String {
        switch verbEnding{
        case .AR:
            switch(tense){
            case .imperfectSubjunctiveRA:
                switch person{
                case .S1: return "ara"
                case .S2: return "aras"
                case .S3: return "ara"
                case .P1: return "áramos"
                case .P2: return "arais"
                case .P3: return "aran"
                }
            case .imperfectSubjunctiveSE:
                switch person{
                case .S1: return "ase"
                case .S2: return "ases"
                case .S3: return "ase"
                case .P1: return "ásemos"
                case .P2: return "aseis"
                case .P3: return "asen"
                }
            default:
                return ""
            }
        case .ER:
            switch(tense){
            case .imperfectSubjunctiveRA:
                switch person{
                case .S1: return "era"
                case .S2: return "eras"
                case .S3: return "era"
                case .P1: return "éramos"
                case .P2: return "erais"
                case .P3: return "eran"
                }
            case .imperfectSubjunctiveSE:
                switch person{
                case .S1: return "ese"
                case .S2: return "eses"
                case .S3: return "ese"
                case .P1: return "ésemos"
                case .P2: return "eseis"
                case .P3: return "esen"
                }
            default:
                return ""
            }
            
        case .IR,.accentIR, .umlautIR:
            switch(tense){
            case .imperfectSubjunctiveRA:
                switch person{
                case .S1: return "era"
                case .S2: return "eras"
                case .S3: return "era"
                case .P1: return "éramos"
                case .P2: return "erais"
                case .P3: return "eran"
                }
            case .imperfectSubjunctiveSE:
                switch person{
                case .S1: return "ese"
                case .S2: return "eses"
                case .S3: return "ese"
                case .P1: return "ésemos"
                case .P2: return "eseis"
                case .P3: return "esen"
                }
            default:
                return ""
            }
        default: return ""
        }
    }
    
    public func getImperfectSubjConjugation(tense: Tense, person : Person)->String {
        switch(tense){
        case .imperfectSubjunctiveRA:
            switch person{
            case .S1: return "era"
            case .S2: return "eras"
            case .S3: return "era"
            case .P1: return "éramos"
            case .P2: return "erais"
            case .P3: return "eran"
            }
        case .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "ese"
            case .S2: return "eses"
            case .S3: return "ese"
            case .P1: return "ésemos"
            case .P2: return "eseis"
            case .P3: return "esen"
            }
        default:
            return ""
        }
    }
    
    public func getARConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "o"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "amos"
            case .P2: return "áis"
            case .P3: return "an"
            }
        case .preterite:
            switch person{
            case .S1: return "é"
            case .S2: return "aste"
            case .S3: return "ó"
            case .P1: return "amos"
            case .P2: return "asteis"
            case .P3: return "aron"
            }
        case .imperfect:
            switch person{
            case .S1: return "aba"
            case .S2: return "abas"
            case .S3: return "aba"
            case .P1: return "ábamos"
            case .P2: return "abais"
            case .P3: return "aban"
            }
        case .future:
            switch person{
            case .S1: return "é"
            case .S2: return "ás"
            case .S3: return "á"
            case .P1: return "emos"
            case .P2: return "éis"
            case .P3: return "án"
            }
        case .conditional:
            switch person{
            case .S1: return "ía"
            case .S2: return "ías"
            case .S3: return "ía"
            case .P1: return "íamos"
            case .P2: return "íais"
            case .P3: return "ían"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "emos"
            case .P2: return "éis"
            case .P3: return "en"
            }
        case .imperfectSubjunctiveRA:
            switch person{
            case .S1: return "ara"
            case .S2: return "aras"
            case .S3: return "ara"
            case .P1: return "áramos"
            case .P2: return "arais"
            case .P3: return "aran"
            }
        case .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "ase"
            case .S2: return "ases"
            case .S3: return "ase"
            case .P1: return "ásemos"
            case .P2: return "aseis"
            case .P3: return "asen"
            }
        case .imperative:
            switch person{
            case .S1: return ""
            case .S2: return "a"
            case .S3: return "e"
            case .P1: return "emos"
            case .P2: return "ad"
            case .P3: return "en"
            }
        default:
            return ""
        }
    }
    
    public func getERConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "o"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "emos"
            case .P2: return "éis"
            case .P3: return "en"
            }
        case .preterite:
            switch person{
            case .S1: return "í"
            case .S2: return "iste"
            case .S3: return "ió"
            case .P1: return "imos"
            case .P2: return "isteis"
            case .P3: return "ieron"
            }
        case .imperfect:
            switch person{
            case .S1: return "ía"
            case .S2: return "ías"
            case .S3: return "ía"
            case .P1: return "íamos"
            case .P2: return "íais"
            case .P3: return "ían"
            }
        case .future:
            switch person{
            case .S1: return "é"
            case .S2: return "ás"
            case .S3: return "á"
            case .P1: return "emos"
            case .P2: return "éis"
            case .P3: return "án"
            }
        case .conditional:
            switch person{
            case .S1: return "ía"
            case .S2: return "ías"
            case .S3: return "ía"
            case .P1: return "íamos"
            case .P2: return "íais"
            case .P3: return "ían"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "a"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "amos"
            case .P2: return "áis"
            case .P3: return "an"
            }
        case .imperfectSubjunctiveRA:
            switch person{
            case .S1: return "iera"
            case .S2: return "ieras"
            case .S3: return "iera"
            case .P1: return "iéramos"
            case .P2: return "ierais"
            case .P3: return "ieran"
            }
        case .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "iese"
            case .S2: return "ieses"
            case .S3: return "iese"
            case .P1: return "iésemos"
            case .P2: return "ieseis"
            case .P3: return "iesen"
            }
        case .imperative:
            switch person{
            case .S1: return ""
            case .S2: return "e"
            case .S3: return "a"
            case .P1: return "amos"
            case .P2: return "ed"
            case .P3: return "an"
            }
        default:
            return ""
        }
    }
    
    
    public func getIRConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "o"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "imos"
            case .P2: return "ís"
            case .P3: return "en"
            }
        case .preterite:
            switch person{
            case .S1: return "í"
            case .S2: return "iste"
            case .S3: return "ió"
            case .P1: return "imos"
            case .P2: return "isteis"
            case .P3: return "ieron"
            }
        case .imperfect:
            switch person{
            case .S1: return "ía"
            case .S2: return "ías"
            case .S3: return "ía"
            case .P1: return "íamos"
            case .P2: return "íais"
            case .P3: return "ían"
            }
        case .future:
            switch person{
            case .S1: return "é"
            case .S2: return "ás"
            case .S3: return "á"
            case .P1: return "emos"
            case .P2: return "éis"
            case .P3: return "án"
            }
        case .conditional:
            switch person{
            case .S1: return "ía"
            case .S2: return "ías"
            case .S3: return "ía"
            case .P1: return "íamos"
            case .P2: return "íais"
            case .P3: return "ían"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "a"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "amos"
            case .P2: return "áis"
            case .P3: return "an"
            }
        case .imperfectSubjunctiveRA:
            switch person{
            case .S1: return "iera"
            case .S2: return "ieras"
            case .S3: return "iera"
            case .P1: return "iéramos"
            case .P2: return "ierais"
            case .P3: return "ieran"
            }
        case .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "iese"
            case .S2: return "ieses"
            case .S3: return "iese"
            case .P1: return "iésemos"
            case .P2: return "ieseis"
            case .P3: return "iesen"
            }
        case .imperative:
            switch person{
            case .S1: return ""
            case .S2: return "e"
            case .S3: return "a"
            case .P1: return "amos"
            case .P2: return "id"
            case .P3: return "an"
            }
        default:
            return ""
        }
    }
}


