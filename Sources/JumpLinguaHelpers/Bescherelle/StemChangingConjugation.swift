//
//  StemChangingConjugation.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 4/1/21.
//

import Foundation



public struct StemChangingConjugation {
    
    public func dropLetters(inputMorphStruct : MorphStruct, verb: BRomanceVerb, tense : Tense, person : Person, stemFrom : String)-> MorphStruct {
        var workingMorphStruct = inputMorphStruct
    
        
        var vu = VerbUtilities()
        var workingVerbForm = verb.getFinalVerbForm(person: person)
        
        if verb.m_verbEnding == .OIR { workingVerbForm = vu.remove3LetterVerbEnding(word: workingVerbForm) }
        else { workingVerbForm = vu.remove2LetterVerbEnding(word: workingVerbForm) }
        
        //should be stripped down to verb stem now
        
        
        let result = vu.replaceSubrangeAndGetBeforeAndAfterStrings(inputString: workingVerbForm, fromString: stemFrom, toString: "")
        workingVerbForm = result.0
        let partBefore = result.1
        let partAfter = result.2
        
        //change the stem
        
        var morph : MorphStep
        morph = MorphStep()
        morph.comment = "Remove -> " + stemFrom
        morph.part1 = partBefore
        morph.part2 = stemFrom
        morph.part3 = partAfter
        morph.verbForm = workingVerbForm
        workingMorphStruct.append(morphStep: morph)
        workingMorphStruct.isStem = true
        
        return workingMorphStruct
    }
    
    //tense should be present or present subjunctive
    //returns a fully conjugated stem-changing form
    public func createStemConjugatedForm(inputMorphStruct : MorphStruct, verb: BRomanceVerb, tense : Tense, person : Person,
                                  stemFrom : String, stemTo : String )-> MorphStruct {
        var workingMorphStruct = inputMorphStruct
        var vu = VerbUtilities()
        var workingVerbForm = verb.getFinalVerbForm(person: person)
        let verbEnding = verb.m_verbEnding
        
        if verb.m_verbEnding == .OIR { workingVerbForm = vu.remove3LetterVerbEnding(word: workingVerbForm) }
        else { workingVerbForm = vu.remove2LetterVerbEnding(word: workingVerbForm) }
        
        //should be stripped down to verb stem now
        
        let result = vu.replaceSubrangeAndGetBeforeAndAfterStrings(inputString: workingVerbForm, fromString: stemFrom, toString: "_")
        workingVerbForm = result.0
        let partBefore = result.1
        let partAfter = result.2
        
        //change the stem
        
        var morph : MorphStep
        morph = MorphStep()
        morph.comment = "Grab the existing stem -> " + stemFrom
        morph.part1 = partBefore
        morph.part2 = stemFrom
        morph.part3 = partAfter + verbEnding.getEnding()
        morph.verbForm = workingVerbForm + verbEnding.getEnding()
        workingMorphStruct.append(morphStep: morph)
        
        workingVerbForm = vu.replaceSubrange(inputString: workingVerbForm, fromString: "_", toString: stemTo)
        morph = MorphStep()
        morph.part1 = partBefore
        morph.part2 = stemTo
        morph.part3 = partAfter + verbEnding.getEnding()
        morph.comment = "Change the stem -> " + stemTo
        morph.verbForm = workingVerbForm + verbEnding.getEnding()
        workingMorphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.part1 = workingVerbForm
        morph.part2 = verbEnding.getEnding()
        morph.part3 = ""
        morph.verbForm = workingVerbForm
        morph.comment = "Grab the ending -> " + verbEnding.getEnding()
        workingMorphStruct.append(morphStep: morph)
        workingMorphStruct.isStem = true
        return workingMorphStruct
    }
    
    public func attachPretStemEnding(inputMorphStruct : MorphStruct, person : Person )-> MorphStruct {
        var workingMorphStruct = inputMorphStruct
        let endingString = getPretStemConjugation(person:person)
        var morphStep = MorphStep()
        
        let ss = inputMorphStruct.finalVerbForm()
        
        morphStep.isPretStem = true
        morphStep.isFinalStep = true
        morphStep.verbForm = ss + endingString
        morphStep.part1 = ss
        morphStep.part2 = endingString
        morphStep.comment = "Append this special preterite ending -> " + endingString
        workingMorphStruct.append(morphStep : morphStep)
        workingMorphStruct.isPretStem = true
        return workingMorphStruct
    }
    
    public func getPretStemConjugation(person :Person)->String {
        switch person{
        case .S1: return "e"
        case .S2: return "iste"
        case .S3: return "o"
        case .P1: return "imos"
        case .P2: return "isteis"
        case .P3: return "ieron"
        }
    }
    
    public func attachPretStem2Ending(inputMorphStruct : MorphStruct, person : Person)->MorphStruct{
        var workingMorphStruct = inputMorphStruct
        var pretStem2 = person.getPretStem2Ending()
        let ss = inputMorphStruct.finalVerbForm()
        
        if ( VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 1) == "ñ" ||
                VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 1) == "y" ||
                VerbUtilities().getLastNCharactersInString(inputString: ss, copyCount: 2) == "ll" ){
            pretStem2 = person.getSoftPretStem2Ending()
        }
        var morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = pretStem2
        morphStep.comment = "Replace with this pretStem2 ending-> \(pretStem2)"
        morphStep.verbForm = ss + pretStem2
        workingMorphStruct.append(morphStep : morphStep)
        workingMorphStruct.isPretStem2 = true
        return workingMorphStruct
    }
    
    public func createPretStem3ConjugatedForm(inputMorphStruct : MorphStruct, verbWord : String, person : Person)->MorphStruct{
        let  verbEnding = VerbUtilities().determineVerbEnding(verbWord : verbWord)
        var workingMorphStruct = inputMorphStruct
        var morphStep = MorphStep()
        
        var ss = verbWord
        
        ss = VerbUtilities().remove2LetterVerbEnding(word: verbWord)
        morphStep.isPretStem3 = true
        morphStep.verbForm = ss
        morphStep.part1 = ss
        morphStep.part2 = verbEnding.getEnding()
        morphStep.comment = "Grab verb ending -> " + verbEnding.rawValue
        workingMorphStruct.append(morphStep : morphStep)
        
        morphStep = MorphStep()
        morphStep.isFinalStep = true
        morphStep.part1 = ss
        morphStep.part2 = person.getPretStem3Ending()
        morphStep.comment = "Replace with this pretStem3 ending-> \(person.getPretStem3Ending())"
        morphStep.verbForm = ss + person.getPretStem3Ending()
        workingMorphStruct.append(morphStep : morphStep)
        workingMorphStruct.isPretStem3 = true
        return workingMorphStruct
    }
    
    
}
