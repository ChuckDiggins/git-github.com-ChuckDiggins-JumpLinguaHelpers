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
            morphStep.comment = "remove verb ending" + verbEnding.rawValue
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
        morphStep.comment = "Add the ending -> " + endingString
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
        morphStep.comment = "Grab this ->" + orthoFrom
        morphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.part1 = ss
        morphStep.part2 = orthoTo
        morphStep.part3 = ""
        morphStep.verbForm = ss + orthoTo
        ss = morphStep.verbForm
        morphStep.comment = "Replace with spell change ->" + orthoTo
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
       
        var ss = inputMorphStruct.finalVerbForm()
        
        
        ss = VerbUtilities().remove2LetterVerbEnding(word: ss)
        morphStep.verbForm = ss
        morphStep.part1 = ss
        morphStep.part2 = verbEnding.getEnding()
        morphStep.comment = "Grab the verb ending ->" + verbEnding.rawValue  //this ain't exactly right
        morphStruct.append(morphStep : morphStep)
        

        //ss is now the verbStem - remove orthoFrom from the end - hopefully
        
        for _ in 0 ..< orthoFrom.count {
            ss.removeLast()
        }
        morphStep = MorphStep()
        morphStep.verbForm = ss
        morphStep.part1 = ss
        morphStep.part2 = orthoFrom
        morphStep.comment = "Grab this ->" + orthoFrom
        morphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.part1 = ss
        morphStep.part2 = orthoTo
        morphStep.verbForm = ss + orthoTo
        ss = morphStep.verbForm
        morphStep.comment = "Replace with spell-changed form ->" + orthoTo
        morphStruct.append(morphStep : morphStep)
        
        let endingString  = getVerbEndingString(verbEnding : verbEnding, tense: tense, person: person)
        
        morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.verbForm = ss + endingString
        morphStep.comment = "add the conjugate ending ->" + endingString
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
        morphStep.comment = "grab this part of the word ->" + from
        morphStruct.append(morphStep : morphStep)
        
//        verbForm = String(verbForm.dropLast(from.count))

        morphStep = MorphStep()
        morphStep.verbForm = verbForm + to
        morphStep.part1 = verbForm
        morphStep.part2 = to
        morphStep.comment = "replace with this ending ->" + to
        morphStruct.append(morphStep : morphStep)
        morphStruct.isStem = true
        return morphStruct
    }
    
    public func replaceEndingForm(inputMorphStruct : MorphStruct, from: String, to: String)->MorphStruct{
        let verbWord = inputMorphStruct.finalVerbForm()
        
        let verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var morphStruct = inputMorphStruct
        
        var ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        let comment = "remove verb ending->" + verbEnding.rawValue
        
        _ = morphStruct.createAndAppendMorphStep(verbForm:ss+"__", isFinalStep: false,comment:comment, preposition:"",
                                                 part1:ss, part2: verbEnding.getEnding(), part3: "" )

        var morphStep = MorphStep()
        morphStep.isIrregular = true
        
        morphStep.part1 = ss
        morphStep.part2 = to
        ss.append(to)
        morphStep.isFinalStep = true
        morphStep.verbForm = ss
        morphStep.comment = "append ending -> " + to
        morphStruct.append(morphStep : morphStep)

        return morphStruct
    }
    
    //ignores the verb model.  This is for conjugating any verb as if it were regular
    
    public func conjugateAsRegularForm(verbStr: String, tense: Tense, person: Person)->String {
        let vu = VerbUtilities()
        let result = vu.analyzeSpanishWordPhrase(testString: verbStr)
        let verbEnding = result.1
        var verbStem = result.0
        verbStem.removeLast()
        verbStem.removeLast()
        
        var endingString = getVerbEndingString(verbEnding: verbEnding, tense: tense, person: person)
        let verbForm = verbStem + endingString
        return verbForm
    }
    
    public func createRegularForm(verbEnding: VerbEnding, inputMorphStruct : MorphStruct, verbWord : String, preposition : String, tense: Tense, person : Person, p3PreteriteVerbForm: String)-> MorphStruct {
        
        var endingString = verbEnding.getEnding()
        
        var morphStruct = inputMorphStruct
        var morphStep : MorphStep
        
        var ss = verbWord
         
        //if imperfectSubjunctive, use the preterite P3 form as the starting point
        if ( tense == .imperfectSubjunctiveRA || tense == .imperfectSubjunctiveSE )
        {
            //start with a new morphStruct
            
            morphStruct = MorphStruct(person: person)
            morphStep = MorphStep()
            morphStep.part1 = p3PreteriteVerbForm
            morphStep.verbForm = p3PreteriteVerbForm
            morphStep.comment = "Start with the preterite P3 form ->" + p3PreteriteVerbForm
            morphStruct.append(morphStep : morphStep)
            
            ss = p3PreteriteVerbForm

            var preteriteEnding = p3PreteriteVerbForm.suffix(4)
            
            ss.removeLast()
            ss.removeLast()
            ss.removeLast()
            ss.removeLast()
            // for er or ir verbs, remove the final i also
            let lastChar = VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 1)
            if ( lastChar == "i" && ( verbEnding == .ER || verbEnding == .IR || verbEnding == .accentIR)){
                ss.removeLast()
                preteriteEnding = p3PreteriteVerbForm.suffix(5)
            }
            let lastChars = VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 2)
            
            morphStep = MorphStep()
             morphStep.verbForm = ss
            morphStep.part1 = ss
            morphStep.part2 = String(preteriteEnding)
            morphStep.comment = "Remove the last 4 letters of the preterite ending"
            morphStruct.append(morphStep : morphStep)
            
            //certain irregular AR verbs are conjugated as ER in this tense
            
            var conjugateAsER = false
            if (p3PreteriteVerbForm == "anduvieron" || p3PreteriteVerbForm == "dieron"){
                conjugateAsER = true
            }
            
            //if last character(s) is y or ñ or ll, we have to drop the i for orthographic purposes
            
            if lastChar == "j" || lastChar == "y" || lastChar == "ñ" || lastChars == "ll" || ss == "d" || conjugateAsER {
                if ( ss == "d" ){ss = "di"}  //special logic for handling dar
                
                endingString = getImperfectSubjConjugation(tense: tense, person: person)
                morphStep = MorphStep()
                morphStep.isFinalStep = true
                morphStep.verbForm = ss + endingString
                morphStep.part1 = ss
                morphStep.part2 = endingString
                morphStep.comment = "Add the ending -> " + endingString
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
            morphStep.comment = "grab the ending ->" + verbEnding.getEnding()
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
        morphStep.comment = "replace with the ending -> " + endingString
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
        default:
            return ""
        }
    }
}


