//
//  BescherellePassiveVerbConjugation.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation

public struct PassiveVerbConjugationSpanish {
    public func conjugateThisSimplePassive(verb: BSpanishVerb, tense : Tense, person : Person, count : Number, conjugateEntirePhrase : Bool ) -> MorphStruct {
        
        
        //let workingMorphStruct = createInitialMorphSteps(verb: verb, person: person, conjugateEntirePhrase: conjugateEntirePhrase)
        
        var morphStruct : MorphStruct
        
        //all the same!
        
        switch verb.m_verbEnding {
        case .AR,.ER,.IR, .accentIR, .umlautIR, .OIR, .RE, .none:
            morphStruct =  MorphStruct(person : Person.S1)
        }
        
        return morphStruct
    }
    
    
    public func conjugateThisSimpleSubjunctive(verb: BSpanishVerb, tense : Tense, person : Person, count : Number, conjugateEntirePhrase : Bool ) -> MorphStruct {
        var baseForm = verb.m_verbWord
        var ending = ""
        var morphStep =  MorphStep()
        var workingMorphStruct = MorphStruct(person : person)
        
        switch tense {
        case .presentSubjunctive:
            morphStep.comment = "Start with the verb infinitive" + " " + baseForm
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            baseForm = VerbUtilities().remove2LetterVerbEnding(word: baseForm)
            morphStep.comment = "Remove the verb ending ... " + baseForm + "__"
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            switch verb.m_verbEnding {
            case .AR:
                switch count {
                case .singular: ending = "e"
                case .plural: ending =  "en"
                }
            case .ER,.IR, .accentIR:
                switch count {
                case .singular: ending = "a"
                case .plural: ending =  "an"
                }
            default: ending = ""
            }
            
        case .imperfectSubjunctiveRA:
            morphStep.comment = "Start with the verb infinitive" + " " + baseForm
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            baseForm = VerbUtilities().remove2LetterVerbEnding(word: baseForm)
            morphStep.comment = "Remove the verb ending ... " + baseForm + "__"
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            switch verb.m_verbEnding {
            case .AR:
                switch count {
                case .singular: ending = "ara"
                case .plural: ending =  "aran"
                }
            case .ER,.IR,.accentIR:
                switch count {
                case .singular: ending = "era"
                case .plural: ending =  "eran"
                }
            default: ending = ""
            }
        case .imperfectSubjunctiveSE:
            morphStep.comment = "Start with the verb infinitive" + " " + baseForm
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            baseForm = VerbUtilities().remove2LetterVerbEnding(word: baseForm)
            morphStep.comment = "Remove the verb ending ... " + baseForm + "__"
            morphStep.verbForm = baseForm
            workingMorphStruct.append(morphStep : morphStep)
            
            //remove the final "o"
            switch verb.m_verbEnding {
            case .AR:
                switch count {
                case .singular: ending = "ase"
                case .plural: ending =  "asen"
                }
            case .ER, .IR, .accentIR:
                switch count {
                case .singular: ending = "ese"
                case .plural: ending =  "esen"
                }
            default: ending = ""
            }
        default:
            baseForm = ""
        }
        baseForm += ending
        
        morphStep.isFinalStep = true
        morphStep.comment = "Add subjunctive ending " + ending + " to form " + baseForm
        morphStep.verbForm = baseForm
        workingMorphStruct.append(morphStep : morphStep)
        
        return workingMorphStruct
    }

    //indicative and subjunctive
    
    public  func conjugateThisCompoundVerb(verb : BSpanishVerb, tense : Tense, person : Person, count : Number, conjugateEntirePhrase : Bool ) -> MorphStruct {
        let preposition = ""
        
        var auxiliaryVerb = ""
        var participle = ""
         
        if tense.isProgressive() {
            auxiliaryVerb = ActiveVerbConjugationSpanish().getProgressiveVerb(tense: tense, person: person)
            participle = verb.m_gerund
        } else {
            auxiliaryVerb = ActiveVerbConjugationSpanish().getPerfectVerb(tense: tense, person: person)
            participle = verb.m_pastParticiple
        }

        let pronounString = ""
        var workingMorphStruct = createInitialMorphSteps(verb: verb, person: person, conjugateEntirePhrase: conjugateEntirePhrase)
        var morph = MorphStep()
        
        var ss = participle
        
        morph.comment = "Grab participle " + participle
        morph.verbForm = ss + preposition
        workingMorphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.isFinalStep = true
        
        if tense.isProgressive() {   morph.comment = "Insert correct form of verb estar ..." + auxiliaryVerb }
            else {  morph.comment = "Insert correct form of verb haber ..." + auxiliaryVerb }
            
        ss = pronounString + auxiliaryVerb + " " + participle
        morph.verbForm = ss + preposition
        workingMorphStruct.append(morphStep: morph)

        return workingMorphStruct
    }
    
    
    public func createInitialMorphSteps(verb: BSpanishVerb, person : Person, conjugateEntirePhrase: Bool)->MorphStruct
    {
        var workingMorphStruct = verb.getMorphStruct(person: person)
        let preposition = verb.m_residualPhrase
        var morphStep = MorphStep()
        
        if conjugateEntirePhrase {
            morphStep.comment = "Start with the verb phrase " + " " + verb.getPhrase()
            morphStep.verbForm = verb.m_verbWord
            if verb.hasPreposition() {
                morphStep.verbForm += " " + preposition
            }
            
            workingMorphStruct.append(morphStep : morphStep)
            morphStep.comment = "Start with verb infinitive " + " " + verb.m_verbWord
            morphStep.verbForm = verb.m_verbWord
            workingMorphStruct.append(morphStep : morphStep)

        }
        else {
            morphStep.comment = "Start with verb infinitive " + " " + verb.m_verbWord
            morphStep.verbForm = verb.m_verbWord
            workingMorphStruct.append(morphStep : morphStep)
        }
        return workingMorphStruct
    }

    
}
