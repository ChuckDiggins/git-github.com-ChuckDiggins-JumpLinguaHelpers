//
//  RegularFrenchVerb.swift
//  VIperSpanish 2
//
//  Created by chuckd on 5/20/21.
//


import Foundation
import JumpLinguaHelpers

public struct RegularFrenchVerb {
    
    public func createPastParticiple(verb: BFrenchVerb)->String {
        let word = verb.m_verbStem
        switch verb.m_verbEnding {
        case .ER: return word + "é"
        case .IR: return word + "i"
        default: return word + ""
        }
    }
    
    public func createGerund(verb: BFrenchVerb)->String {
        let word = verb.m_verbStem
        switch verb.m_verbEnding {
        case .ER: return word + "ant"
        case .IR: return word + "ant"
        default: return word + "ant"
        }
    }
    
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
            morphStep.comment = "Attach " + verbEnding.rawValue
            morphStep.verbForm = ss + "__"
            morphStruct.append(morphStep : morphStep)
        }
        
        var endingString : String
        switch verbEnding {
        case .ER:
            endingString = getERConjugation(tense: tense, person: passivePerson)
        case .IR:
            endingString = getIRConjugation(tense: tense, person: passivePerson)
        default:
            endingString = "unknown"
        }
        morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.verbForm = ss + endingString
        morphStep.comment = "Attach " + endingString
        morphStruct.append(morphStep : morphStep)
        
        return morphStruct
    }
    
    public func getConjugationEnding (verbWord : String, tense: Tense, person : Person )->String {
        let  verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var endingString : String
        switch verbEnding {
        case .ER:
            endingString = getERConjugation(tense: tense, person: person)
        case .IR, .accentIR, .RE:
            endingString = getIRConjugation(tense: tense, person: person)
        default:
            endingString = "unknown"
        }
        return endingString
    }
    
    public func replaceForm(inputMorphStruct : MorphStruct, person: Person, from: String, to: String)->MorphStruct{
        var verbForm = inputMorphStruct.finalVerbForm()
        
        var morphStruct = MorphStruct(person: person)
        var morphStep = MorphStep()
        morphStep.isIrregular = true
        morphStep.verbForm = verbForm
        morphStep.part2 = verbForm
        morphStep.comment = "Grab this part of the word ->" + from
        morphStruct.append(morphStep : morphStep)
        
        verbForm = String(verbForm.dropLast(from.count))  //drop the from suffix or something as long as it from verbForm
        
        morphStep = MorphStep()
        morphStep.verbForm = verbForm + to
        morphStep.part1 = verbForm
        morphStep.part2 = to
        morphStep.comment = "Replace with this ending ->" + to
        morphStruct.append(morphStep : morphStep)
        
        return morphStruct
    }
    
    public func replaceEndingForm(inputMorphStruct : MorphStruct, from: String, to: String)->MorphStruct{
        let verbWord = inputMorphStruct.finalVerbForm()
        
        let verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var morphStruct = inputMorphStruct
        
        var ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        let comment = "Remove verb ending ->" + verbEnding.rawValue
        
        _ = morphStruct.createAndAppendMorphStep(verbForm:ss+"__", isFinalStep: false,comment:comment, preposition:"",
                                                 part1:ss, part2: verbEnding.getEnding(), part3: "" )
        
        var morphStep = MorphStep()
        morphStep.isIrregular = true
        
        morphStep.part1 = ss
        morphStep.part2 = to
        ss.append(to)
        morphStep.isFinalStep = true
        morphStep.verbForm = ss
        morphStep.comment = "Append verb ending ->" + to
        morphStruct.append(morphStep : morphStep)
        
        return morphStruct
    }
    
    //ignores the verb model.  This is for conjugating any verb as if it were regular
    
    public func conjugateAsRegularFormWithThisVerbEnding(verbEnding: VerbEnding, verbStr: String, tense: Tense, person: Person)->String {
        let vu = VerbUtilities()
        let result = vu.analyzeFrenchWordPhrase(phraseString: verbStr)
        var verbStem = result.0
        let originalVerbEnding = result.1
        //don't remove the verb ending for future and conditional
        if tense != .future && tense != .conditional {
            verbStem.removeLast()
            verbStem.removeLast()
            if originalVerbEnding.rawValue.count == 3 { verbStem.removeLast() }
        }
        let endingString = getVerbEndingString(verbEnding: verbEnding, tense: tense, person: person)
        let verbForm = verbStem + endingString
        return verbForm
    }
    
    public func conjugateAsRegularForm(verbStr: String, tense: Tense, person: Person)->String {
        let vu = VerbUtilities()
        let result = vu.analyzeFrenchWordPhrase(phraseString: verbStr)
        var verbStem = result.0
        let verbEnding = result.1
        //don't remove the verb ending for future and conditional
        if tense != .future && tense != .conditional {     
            verbStem.removeLast()
            verbStem.removeLast()
            if verbEnding.rawValue.count == 3 { verbStem.removeLast() }
        }
        let endingString = getVerbEndingString(verbEnding: verbEnding, tense: tense, person: person)
        let verbForm = verbStem + endingString
        return verbForm
    }
    
    public func createRegularForm(verbEnding: VerbEnding, inputMorphStruct : MorphStruct, verbWord : String,
                           preposition : String, tense: Tense, person : Person, endingType: EndingType )-> MorphStruct {
        
        //var endingString = verbEnding.getEnding()
        
        var morphStruct = inputMorphStruct
        var morphStep : MorphStep
        
        var ss = verbWord
        if verbEnding == .OIR { ss = VerbUtilities().remove3LetterVerbEnding(word: verbWord) }
        else { ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)  }
        
        //remove the verb ending unless the tense is future or conditional
        
        if ( tense != .future && tense != .conditional )
        {
            morphStep = MorphStep()
            morphStep.verbForm = ss
            morphStep.comment = "Remove the ending ->" + verbEnding.getEnding()
            morphStep.part1 = ss
            morphStep.part2 = verbEnding.getEnding()
            morphStep.part3 = ""
            morphStruct.append(morphStep : morphStep)
            
            morphStruct = checkForOrthographicChangesDependingOnVerbEnding(inputMorphStruct : morphStruct, verbEnding: verbEnding, verbStem: ss, tense : tense, person: person)
        }
        return attachRegularVerbEnding(inputMorphStruct : morphStruct, tense: tense, person: person, verbEnding: verbEnding, endingType: endingType)
        
    }
    
    public func checkForOrthographicChangesDependingOnVerbEnding(inputMorphStruct: MorphStruct, verbEnding: VerbEnding, verbStem: String, tense : Tense, person: Person)->MorphStruct{
        
        var morphStruct = inputMorphStruct
        var verbWord = verbStem
        
        var endingString = ""
        
        switch verbEnding {
        case .ER:
            endingString = getERConjugation(tense: tense, person: person)
        case .IR:
            endingString = getIRConjugation(tense: tense, person: person)
        case .RE:
            endingString = getREConjugation(tense: tense, person: person)
        default:
            break
        }
        let nextChar = endingString
        let lastChar = VerbUtilities().getLastNCharactersInString(inputString: verbWord, copyCount: 1)

        var orthoChanged = false
        var orthoFrom = ""
        var orthoTo = ""
        var verbWordMinusCharacter = ""
        if lastChar == "c" && (nextChar == "a" || nextChar == "o" || nextChar == "â" || nextChar == "u" ) {
            verbWord.removeLast()
            verbWordMinusCharacter = verbWord
            verbWord += "ç"
            orthoChanged = true
            orthoFrom = "c"
            orthoTo = "ç"
        }
        if lastChar == "g" && (nextChar == "a" || nextChar == "o" || nextChar == "â" || nextChar == "u" ) {
            verbWord.removeLast()
            verbWordMinusCharacter = verbWord
            verbWord += "ge"
            orthoChanged = true
            orthoFrom = "g"
            orthoTo = "ge"
        }
        
        if ( orthoChanged ){
            var morphStep = MorphStep()
            morphStep.verbForm = verbWord
            morphStep.comment = "Replace letter ->" + orthoFrom + " with " + orthoTo
            morphStep.part1 = verbWordMinusCharacter
            morphStep.part2 = orthoTo
            morphStep.part3 = ""
            morphStruct.append(morphStep : morphStep)
        }
        
        return morphStruct
        
    }
    
    public func attachRegularVerbEnding(inputMorphStruct: MorphStruct, tense: Tense, person: Person, verbEnding: VerbEnding, endingType: EndingType)->MorphStruct{
        var workingMorphStruct = inputMorphStruct
        var endingString = ""
        switch endingType {
        case .none: endingString = getVerbEndingString(verbEnding : verbEnding, tense: tense, person: person)
        case .RE_ENDING: endingString = getREConjugation(tense: tense, person: person)
        case .RE_ENDING1: endingString = getREConjugation1(tense: tense, person: person)
        case .RE_ENDING2: endingString = getREConjugation2(tense: tense, person: person)
        case .RE_ENDING3: endingString = getREConjugation3(tense: tense, person: person)
        case .IR_ENDING: endingString = getIRConjugation(tense: tense, person: person)
        case .IR_ENDING1: endingString = getIRShortConjugation1(tense: tense, person: person)
        case .IR_ENDING2: endingString = getIRShortConjugation2(tense: tense, person: person)
        case .OIR_ENDING1: endingString = getOIRConjugation1(tense: tense, person: person)
        case .OIR_ENDING2: endingString = getOIRConjugation2(tense: tense, person: person)
        case .OIR_ENDING3: endingString = getOIRConjugation3(tense: tense, person: person)
        case .OIR_ENDING4: endingString = getOIRConjugation4(tense: tense, person: person)
        case .CHOIR_ENDING: endingString = getCHOIRConjugation(tense: tense, person: person)
        case .overrideER: endingString = getVerbEndingString(verbEnding: .ER, tense: tense, person: person)
        }
        
        let ss = workingMorphStruct.finalVerbForm()
        var morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.verbForm = ss + endingString
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.comment = "Replace with the ending -> " + endingString
        workingMorphStruct.append(morphStep : morphStep)
        return workingMorphStruct
    }
    
    public func getVerbEndingString(verbEnding : VerbEnding, tense: Tense, person: Person)->String {
        switch verbEnding {
        case .ER:
            return getERConjugation(tense: tense, person: person)
        case .IR:
            return getIRConjugation(tense: tense, person: person)
        case .RE:
            return getREConjugation(tense: tense, person: person)
        case .OIR:
            return getOIRConjugation1(tense: tense, person: person)
        default:
            return "unknown"
        }
    }
    
    public func getREConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "s"
            case .S2: return "s"
            case .S3: return "t"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        case .preterite:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "âmes"
            case .P2: return "âtes"
            case .P3: return "èrent"
            }
        case .imperfect:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "ons"
            case .P2: return "iez"
            case .P3: return "ent"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "asse"
            case .S2: return "asses"
            case .S3: return "ât"
            case .P1: return "assions"
            case .P2: return "assiez"
            case .P3: return "assent"
            }
            
        default:
            return ""
        }
    }
    
    public func getREConjugation2(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "s"
            case .S2: return "s"
            case .S3: return "t"
            case .P1: return "sons"
            case .P2: return "tes"
            case .P3: return "ont"
            }

        default:
            return ""
        }
    }
    
    public func getREConjugation3(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "ît"
            case .P1: return "issons"
            case .P2: return "issiez"
            case .P3: return "issent"
            }

        default:
            return ""
        }
    }
    
    
    public func getREConjugation1(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "s"
            case .S2: return "s"
            case .S3: return ""
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        case .preterite:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "îmes"
            case .P2: return "îtes"
            case .P3: return "irent"
            }
        case .imperfect:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "ent"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "isse"
            case .S2: return "isses"
            case .S3: return "ît"
            case .P1: return "issions"
            case .P2: return "issiez"
            case .P3: return "issent"
            }
        default:
            return ""
        }
    }
    

    public func getERConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        case .preterite:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "âmes"
            case .P2: return "âtes"
            case .P3: return "èrent"
            }
        case .imperfect:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "ent"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "asse"
            case .S2: return "asses"
            case .S3: return "ât"
            case .P1: return "assions"
            case .P2: return "assiez"
            case .P3: return "assent"
            }
            
        default:
            return ""
        }
    }
    
    //pattern 81 - finir
    
    public func getIRConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "issons"
            case .P2: return "issez"
            case .P3: return "issent"
            }
        case .preterite:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "îmes"
            case .P2: return "îtes"
            case .P3: return "irent"
            }
        case .imperfect:
            switch person{
            case .S1: return "issais"
            case .S2: return "issais"
            case .S3: return "issait"
            case .P1: return "issions"
            case .P2: return "issiez"
            case .P3: return "issaient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "isse"
            case .S2: return "isses"
            case .S3: return "isse"
            case .P1: return "issions"
            case .P2: return "issiez"
            case .P3: return "issent"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "isse"
            case .S2: return "isses"
            case .S3: return "ît"
            case .P1: return "issions"
            case .P2: return "issiez"
            case .P3: return "issent"
            }
        default:
            return ""
        }
    }
    
    
    //pattern 84 - tenir
    
    public func getIRShortConjugation1(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "s"
            case .S2: return "s"
            case .S3: return "t"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        case .preterite:
            switch person{
            case .S1: return "s"
            case .S2: return "s"
            case .S3: return "t"
            case .P1: return "mes"
            case .P2: return "tes"
            case .P3: return "rent"
            }
        case .imperfect:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "e"
            case .S2: return "es"
            case .S3: return "e"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "ent"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "sse"
            case .S2: return "sses"
            case .S3: return "t"
            case .P1: return "ssions"
            case .P2: return "ssiez"
            case .P3: return "ssent"
            }
        default:
            return ""
        }
    }
    
    public func getIRShortConjugation2(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "yons"
            case .P2: return "yez"
            case .P3: return "ient"
            }
        case .preterite:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "îmes"
            case .P2: return "îtes"
            case .P3: return "irent"
            }
        case .imperfect:
            switch person{
            case .S1: return "yais"
            case .S2: return "yais"
            case .S3: return "yait"
            case .P1: return "yions"
            case .P2: return "yiez"
            case .P3: return "yaient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "ie"
            case .S2: return "ies"
            case .S3: return "ie"
            case .P1: return "yions"
            case .P2: return "yiez"
            case .P3: return "ient"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "isse"
            case .S2: return "isses"
            case .S3: return "it"
            case .P1: return "issions"
            case .P2: return "issiez"
            case .P3: return "issent"
            }
        default:
            return ""
        }
    }
    
    
    //so far this is short2 except for present tense  - recevoir
    
    public func getOIRConjugation1(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "is"
            case .S2: return "is"
            case .S3: return "it"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        case .preterite:
            switch person{
            case .S1: return "us"
            case .S2: return "us"
            case .S3: return "ut"
            case .P1: return "ûmes"
            case .P2: return "ûtes"
            case .P3: return "urent"
            }
        case .imperfect:
            switch person{
            case .S1: return "yais"
            case .S2: return "yais"
            case .S3: return "yait"
            case .P1: return "yions"
            case .P2: return "yiez"
            case .P3: return "yaient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "ie"
            case .S2: return "ies"
            case .S3: return "ie"
            case .P1: return "yions"
            case .P2: return "yiez"
            case .P3: return "ient"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "usse"
            case .S2: return "usses"
            case .S3: return "ût"
            case .P1: return "ussions"
            case .P2: return "ussiez"
            case .P3: return "ussent"
            }
        default:
            return ""
        }
    }
    
    public func getOIRConjugation2(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "x"
            case .S2: return "x"
            case .S3: return "t"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "vent"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "ille"
            case .S2: return "illes"
            case .S3: return "ille"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "illent"
            }
        default: return ""
        }
    }
    
    public func getOIRConjugation3(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "x"
            case .S2: return "x"
            case .S3: return "t"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "lent"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "ye"
            case .S2: return "yes"
            case .S3: return "ye"
            case .P1: return "yions"
            case .P2: return "yiez"
            case .P3: return "yent"
            }
        default: return ""
        }
    }
    
    public func getOIRConjugation4(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "x"
            case .S2: return "x"
            case .S3: return "t"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ent"
            }
        default: return ""
        }
    }

    public func getCHOIRConjugation(tense: Tense, person : Person)-> String {
        switch(tense){
        case .present:
            switch person{
            case .S1: return "ois"
            case .S2: return "ois"
            case .S3: return "oit"
            case .P1: return "oyons"
            case .P2: return "oyez"
            case .P3: return "oient"
            }
        case .preterite:
            switch person{
            case .S1: return "us"
            case .S2: return "us"
            case .S3: return "ut"
            case .P1: return "ûmes"
            case .P2: return "ûtes"
            case .P3: return "urent"
            }
        case .imperfect:
            switch person{
            case .S1: return "oyais"
            case .S2: return "oyais"
            case .S3: return "oyait"
            case .P1: return "oyions"
            case .P2: return "oyiez"
            case .P3: return "oyaient"
            }
        case .future:
            switch person{
            case .S1: return "ai"
            case .S2: return "as"
            case .S3: return "a"
            case .P1: return "ons"
            case .P2: return "ez"
            case .P3: return "ont"
            }
        case .conditional:
            switch person{
            case .S1: return "ais"
            case .S2: return "ais"
            case .S3: return "ait"
            case .P1: return "ions"
            case .P2: return "iez"
            case .P3: return "aient"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: return "oie"
            case .S2: return "oies"
            case .S3: return "oie"
            case .P1: return "oyions"
            case .P2: return "oyiez"
            case .P3: return "oient"
            }
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1: return "usse"
            case .S2: return "usses"
            case .S3: return "ût"
            case .P1: return "ussions"
            case .P2: return "ussiez"
            case .P3: return "ussent"
            }
            
        default:
            return ""
        }
    }
    
        
}


