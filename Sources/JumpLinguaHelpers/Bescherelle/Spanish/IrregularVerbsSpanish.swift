//
//  VerbFormsIrregularSpecial.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 2/20/21.
//

import Foundation

//these are standalone irregular forms
public enum SpecialSpanishVerbModel {
    case DAR
    case ESTAR
    case HABER
    case HACER
    case REIR
    case SABER
    case SONREIR
    case IR
    case OIR
    case SER
    case VER
    case TRAER
    case none
}

public struct IrregularVerbsSpanish {
    public init(){}
    public func getIrregularFormSpecial(inputMorphStruct : MorphStruct, verb : BSpanishVerb, preposition : String,
                                        specialVerbModel : SpecialSpanishVerbModel,
                                        tense : Tense, person : Person)->MorphStruct{
        
        
        let morphStruct = inputMorphStruct
        
        
        switch (specialVerbModel){
            
        case .DAR:
            return getFormDar(inputMorphStruct : morphStruct, tense : tense, person : person)
        case .HABER:
            return getFormHaber(inputMorphStruct : morphStruct, tense : tense, person : person)
        case .HACER:
            return getFormHacer(inputMorphStruct : morphStruct, tense : tense, person : person)
        case .ESTAR:
            return getFormEstar(inputMorphStruct : morphStruct, tense : tense, person : person)
        case .IR:
            return getFormIr(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .OIR:
            return getFormOir(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .REIR:
            return getFormReir(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .SABER:
            return getFormSaber(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .SER:
            return getFormSer(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .SONREIR:  //temp - hopefully handled by Reir
            return getFormReir(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .VER:
            return getFormVer(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .TRAER:
            return getFormTraer(inputMorphStruct : morphStruct,  tense : tense, person : person)
        case .none:
            return morphStruct
        }
        
    }
    
    
    /*
     é
     É
     á
     ó
     í
     üú
     ñ
     ç
     ß
     */
    
    public func getFormTraer (inputMorphStruct : MorphStruct,  tense: Tense, person: Person ) -> MorphStruct {
        let vu = VerbUtilities()
        let infinitive = "traer"
        let result = vu.analyzeSpanishWordPhrase(testString: infinitive)
        let verbEnding = result.1
        var morphStruct = inputMorphStruct
        
        //this step was missing from morph struct (1/8/23)
        
        var  morph = MorphStep()
        var verbForm = inputMorphStruct.finalVerbForm()
        let verbFormPrefix = verbForm.dropLast(infinitive.count)
        
        //if this is reflexive, then the only thing left will be the personal pronoun, else there will be nothing left
        //        morph.verbForm = String(verbFormPrefix) + infinitive
        //        morph.part1 = morph.verbForm
        //        morph.comment = getMorphComment(.startWith, morph.verbForm)
        //        morphStruct.append(morphStep: morph)
        
        let infinitiveStem = String(infinitive.dropLast(2))
        //        morph = MorphStep()
        
        
        
        
        switch (tense){
            //        case .present:
            //            switch person{
            //            case .P3:
            //                morph = MorphStep()
            //                morph.part1 = verbForm
            //                morph.part2 = "igo"
            //                morph.verbForm = morph.part1 + morph.part2
            //                morph.comment = getMorphComment(.appendEnding, "igo")
            //                morph.isFinalStep = true
            //                morphStruct.append(morphStep: morph)
            //            default: break
            //            }
        case .preterite:
            morph.isIrregular = true
            morph.verbForm = verbFormPrefix + infinitiveStem
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.removeEnding, verbEnding.rawValue)
            morphStruct.append(morphStep: morph)
            verbForm =  morph.verbForm
            
            morph = MorphStep()
            morph.part1 = verbForm
            morph.part2 = "j"
            morph.verbForm = morph.part1 + morph.part2
            morph.comment = getMorphComment(.appendEnding, "j")
            morphStruct.append(morphStep: morph)
            
            //so at this point verbForm should be "traj"
            
            verbForm = morph.verbForm
            morph = MorphStep()
            morph.part1 = verbForm
            morph.isFinalStep = true
            switch person{
            case .P3:
                morph.part2 = "eron"
                morph.verbForm = morph.part1 + morph.part2
                morph.comment = getMorphComment(.appendPreteriteEnding, morph.part2)
                morphStruct.append(morphStep: morph)
            default: break
            }
        default:
            break
        }
        return morphStruct
    }
    
    public func getFormDar (inputMorphStruct : MorphStruct,  tense: Tense, person: Person ) -> MorphStruct {
        let vu = VerbUtilities()
        let infinitive = "dar"
        var ending = ""
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        
        //this step was missing from morph struct (1/8/23)
        
        morph = MorphStep()
        morph.isIrregular = true
        
        var verbFormPrefix = inputMorphStruct.finalVerbForm()
        //if this is a derivative word, such as deshacer, then create the prefix
        
        
        if verbFormPrefix.count > infinitive.count {
            verbFormPrefix = vu.removeLastLetters(verbWord: verbFormPrefix, letterCount: infinitive.count)  //remove the infinitive
            morph.verbForm = verbFormPrefix
            morph.comment = getMorphComment(.removeInfinitive, infinitive)
            morphStruct.append(morphStep: morph)
        } else {
            verbFormPrefix = ""
        }
        
        var verbForm = inputMorphStruct.finalVerbForm()
        if tense != .future && tense != .conditional {
            verbForm = verbFormPrefix + "d"
            morph.verbForm = verbForm
            morph.comment = getMorphComment(.removeEnding, "ar")
            morphStruct.append(morphStep: morph)
        }
        
        morph = MorphStep()
        morph.isIrregular = true
        morph.isFinalStep = true
        
        let ss = verbForm
        switch (tense){
        case .present:
            switch person{
            case .S1: ending = "oy"
            case .S2: ending = "as"
            case .S3: ending = "a"
            case .P1: ending = "amos"
            case .P2: ending = "ais"
            case .P3: ending = "an"
            }
        case .preterite:
            switch person{
            case .S1: ending = "i"
            case .S2: ending = "iste"
            case .S3: ending = "io"
            case .P1: ending = "imos"
            case .P2: ending = "isteis"
            case .P3: ending = "ieron"
            }
        case .imperfect:
            switch person{
            case .S1: ending = "aba"
            case .S2: ending = "abas"
            case .S3: ending = "aba"
            case .P1: ending = "ábamos"
            case .P2: ending = "abais"
            case .P3: ending = "aban"
            }
        case .future:
            switch person{
            case .S1: ending = "é"
            case .S2: ending = "ás"
            case .S3: ending = "á"
            case .P1: ending = "emos"
            case .P2: ending = "éis"
            case .P3: ending = "án"
            }
        case .conditional:
            switch person{
            case .S1: ending = "ía"
            case .S2: ending = "ías"
            case .S3: ending = "ía"
            case .P1: ending = "íamos"
            case .P2: ending = "íais"
            case .P3: ending = "ían"
            }
        case .presentSubjunctive:
            switch person{
            case .S1: ending = "é"
            case .S2: ending = "es"
            case .S3: ending = "é"
            case .P1: ending = "emos"
            case .P2: ending = "eis"
            case .P3: ending = "en"
            }
        case .imperfectSubjunctiveRA:
            switch person{
            case .S1: ending = "iera"
            case .S2: ending = "ieras"
            case .S3: ending = "iera"
            case .P1: ending = "ieramos"
            case .P2: ending = "ierais"
            case .P3: ending = "ieran"
            }
        case .imperfectSubjunctiveSE:
            switch person{
            case .S1: ending = "iese"
            case .S2: ending = "ieses"
            case .S3: ending = "iese"
            case .P1: ending = "iesemos"
            case .P2: ending = "ieseis"
            case .P3: ending = "iesen"
            }
            
        case .imperative:
            switch person{
            case .S1: ending = ""
            case .S2: ending = "da"
            case .S3: ending = "é"
            case .P1: ending = "emos"
            case .P2: ending = "ad"
            case .P3: ending = "en"
            }
            
        default:
            break
        }
        
        if tense == .imperative && person == .S1 {
            morph.verbForm = ""
            morph.part1 = ""
            morph.comment = "No command form for person: yo"
            morphStruct.append(morphStep: morph)
        } else {
            morph.verbForm = ss + ending
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.appendEnding, morph.verbForm )
            morphStruct.append(morphStep: morph)
        }
        return morphStruct
    }
    
    
    public func getFormEstar (inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct {
        var workingMorphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "estoy"
                morph.part1 = "estoy"
                morph.comment = getMorphComment(.replaceWithIrregular, "estoy")
                workingMorphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "estás"
                morph.part1 = "estás"
                morph.comment = getMorphComment(.replaceWithIrregular, "estás")
                workingMorphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "está"
                morph.part1 = "está"
                morph.comment = getMorphComment(.replaceWithIrregular, "está")
                workingMorphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "están"
                morph.part1 = "están"
                morph.comment = getMorphComment(.replaceWithIrregular, "están")
                workingMorphStruct.append(morphStep: morph)
            default: break
            }
        case .preterite:
            morph.verbForm = "estuv_"
            morph.part1 = "estuv_"
            morph.comment = getMorphComment(.replaceWithIrregular, "estuv_")
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuv"
            switch person{
            case .S1: ending = "e"
            case .S2: ending = "iste"
            case .S3: ending =  "o"
            case .P1: ending = "imos"
            case .P2: ending = "isteis"
            case .P3: ending = "ieron"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morph.isFinalStep = true
            workingMorphStruct.append(morphStep: morph)
            
        case .presentSubjunctive:
            morph.verbForm = "est_"
            morph.part1 = "est_"
            morph.comment = getMorphComment(.replaceWithIrregular, "est_")
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "est"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "é"
            case .S2: ending = "és"
            case .S3: ending =  "é"
            case .P1: ending = "emos"
            case .P2: ending = "éis"
            case .P3: ending = "én"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            workingMorphStruct.append(morphStep: morph)
            
        case .imperfectSubjunctiveRA:
            
            morph.verbForm = "estuvieron"
            morph.comment = getMorphComment(.startWith, "ellos-form estuvieron" )
            morph.part1 = "estuvieron"
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            let mStr = "estuvi____"
            morph.part1 = mStr
            morph.verbForm = mStr
            morph.comment = getMorphComment(.removeEnding, "eron" )
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuvi"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "era"
            case .S2: ending = "eras"
            case .S3: ending =  "era"
            case .P1: ending = "éramos"
            case .P2: ending = "erais"
            case .P3: ending = "eran"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            workingMorphStruct.append(morphStep: morph)
            
        case .imperfectSubjunctiveSE:
            morph.verbForm = "estuvieron"
            morph.comment = getMorphComment(.startWith, "ellos-form estuvieron" )
            morph.part1 = "estuvieron"
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            let mStr = "estuvi____"
            morph.part1 = mStr
            morph.verbForm = mStr
            morph.comment = getMorphComment(.removeEnding, "eron" )
            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuvi"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "ese"
            case .S2: ending = "eses"
            case .S3: ending = "ese"
            case .P1: ending = "ésemos"
            case .P2: ending = "eseis"
            case .P3: ending = "esen"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            workingMorphStruct.append(morphStep: morph)
        default:
            break
        }
        return workingMorphStruct
    }//getFormEstar
    
    public func getFormHacer(inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct
    {
    let vu = VerbUtilities()
    let infinitive = "hacer"
    var morphStruct = inputMorphStruct
    var morph : MorphStep
    
    //this step was missing from morph struct (1/8/23)
    
    morph = MorphStep()
    morph.isIrregular = true
    
    var verbFormPrefix = inputMorphStruct.finalVerbForm()
    //if this is a derivative word, such as deshacer, then create the prefix
    
    if verbFormPrefix.count > infinitive.count {
        verbFormPrefix = vu.removeLastLetters(verbWord: verbFormPrefix, letterCount: infinitive.count)  //remove the infinitive
        morph.verbForm = verbFormPrefix
        morph.comment = getMorphComment(.removeInfinitive, infinitive)
        morphStruct.append(morphStep: morph)
    } else {
        verbFormPrefix = ""
    }
    
    var ending : String
    var ss = ""
    morph = MorphStep()
    morph.isIrregular = true
    switch (tense){
    case .present:
        switch person{
        case .S1:
            ss = verbFormPrefix + "hago"
            morph.isFinalStep = true
            morph.part1 = ss
            morph.comment = getMorphComment(.replaceWith, "hago")
            morph.verbForm = ss
            morphStruct.append(morphStep: morph)
            return morphStruct
        default:
            return morphStruct
        }
    case  .preterite:
        morph.verbForm = verbFormPrefix + "hac_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "hic_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = verbFormPrefix + "hic"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "e"
        case .S2:  ending = "iste"
        case .S3:
            morph.verbForm = verbFormPrefix + "hiz"
            morph.comment = getMorphComment(.replaceWithIrregularStem, "hiz_")
            morph.isFinalStep = true
            ending = "o"
        case .P1:  ending = "imos"
        case .P2:  ending = "isteis"
        case .P3:  ending = "ieron"
        }
        morph.verbForm = morph.verbForm + ending
        morph.comment = "Add the ending -> " + ending
        morphStruct.append(morphStep: morph)
        
    case .conditional :
        morph.verbForm = verbFormPrefix + "har_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "har_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = verbFormPrefix + "har"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "ía"
        case .S2:  ending = "ías"
        case .S3:  ending = "ía"
        case .P1:  ending = "íamos"
        case .P2:  ending = "íais"
        case .P3:  ending = "ían"
        }
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .future :
        morph.verbForm = verbFormPrefix + "har_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "har_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "har"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "é"
        case .S2:  ending = "ás"
        case .S3:  ending = "á"
        case .P1:  ending = "emos"
        case .P2:  ending = "éis"
        case .P3:  ending = "án"
        }
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .presentSubjunctive:
        morph.verbForm = verbFormPrefix + "hag_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "hag_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = verbFormPrefix + "hag"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "a"
        case .S2:  ending =  "as"
        case .S3:  ending =  "a"
        case .P1:  ending = "amos"
        case .P2:  ending =  "áis"
        case .P3:  ending =  "an"
        }
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    default:
        return morphStruct
    }
    return morphStruct
    
    }
    
    public func getFormSaber(inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct
    {
    var morphStruct = inputMorphStruct
    var morph : MorphStep
    var ending : String
    var ss = ""
    morph = MorphStep()
    morph.isIrregular = true
    switch (tense){
    case .present:
        switch person{
        case .S1:
            ss = "sé"
            morph.isFinalStep = true
            morph.comment = "Replace with " + morph.verbForm
            morph.verbForm = ss
            morph.part1 = ss
            morphStruct.append(morphStep: morph)
            return morphStruct
        default:
            return morphStruct
        }
        
    case  .preterite:
        morph.verbForm = "sup_"
        morph.part1 = "sup_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "sup_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "sup"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "e"
        case .S2:  ending =  "iste"
        case .S3:  ending = "o"
        case .P1:  ending = "imos"
        case .P2:  ending = "isteis"
        case .P3:  ending = "ieron"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .conditional :
        morph.verbForm = "sabr_"
        morph.part1 = "sabr_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "sabr_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "sabr"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "ía"
        case .S2:  ending = "ías"
        case .S3:  ending = "ía"
        case .P1:  ending = "íamos"
        case .P2:  ending = "íais"
        case .P3:  ending = "ían"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .future :
        morph.verbForm = "sabr_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "sabr_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "sabr"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "é"
        case .S2:  ending = "ás"
        case .S3:  ending = "á"
        case .P1:  ending = "emos"
        case .P2:  ending = "éis"
        case .P3:  ending = "án"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .presentSubjunctive:
        morph.verbForm = "sep_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "sep_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "sep"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "a"
        case .S2:  ending =  "as"
        case .S3:  ending =  "a"
        case .P1:  ending = "amos"
        case .P2:  ending =  "áis"
        case .P3:  ending =  "an"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
        
    default:
        return morphStruct
    }
    
    return morphStruct
    }//getFormSaber
    
    public func getFormHaber(inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct
    {
    var morphStruct = inputMorphStruct
    var morph : MorphStep
    var ending : String
    var ss = ""
    morph = MorphStep()
    morph.isIrregular = true
    switch (tense){
    case .present:
        //            morph = MorphStep()
        morph.isFinalStep = true
        switch person{
        case .S1:  ss = "he"
        case .S2:  ss =  "has"
        case .S3:  ss =  "ha"
        case .P1:  ss =  "hemos"
        case .P2:  ss =  "habéis"
        case .P3:  ss =  "han"
        }
        morph.part1 = ss
        morph.comment = getMorphComment(.replaceWithIrregular, ss)
        morph.verbForm = ss
        morphStruct.append(morphStep: morph)
        
    case  .preterite:
        morph.verbForm = "hub_"
        morph.part1 = "hub_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "hub_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "hub"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "e"
        case .S2:  ending =  "iste"
        case .S3:  ending = "o"
        case .P1:  ending = "imos"
        case .P2:  ending = "isteis"
        case .P3:  ending = "ieron"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .presentSubjunctive:
        morph.verbForm = "hay_"
        morph.part1 = "hay_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "hay_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "hay"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "a"
        case .S2:  ending =  "as"
        case .S3:  ending =  "a"
        case .P1:  ending = "amos"
        case .P2:  ending =  "áis"
        case .P3:  ending =  "an"
        }
        morph.part1 = morph.verbForm
        morph.part2 = ending
        morph.verbForm = morph.verbForm + ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
        
    default:
        return morphStruct
    }
    
    return morphStruct
    }//getFormHaber
    
    
    public  func getFormSer(inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct
    {
    var morphStruct = inputMorphStruct
    var morph : MorphStep
    var ending : String
    var ss = ""
    morph = MorphStep()
    morph.isIrregular = true
    switch (tense){
    case .present:
        switch person{
        case .S1:  ss = "soy"
        case .S2:  ss =  "eres"
        case .S3:  ss =  "es"
        case .P1:  ss =  "somos"
        case .P2:  ss =  "sois"
        case .P3:  ss =  "son"
        }
        morph.isFinalStep = true
        morph.verbForm = ss
        morph.part1 = ss
        morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm)
        morphStruct.append(morphStep: morph)
        
    case .imperfect :
        ss = "er_"
        morph.part1 = "er_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "er_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "er"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "a"
        case .S2:  ending = "as"
        case .S3:  ending = "a"
        case .P1:  ending = "amos"
        case .P2:  ending = "ais"
        case .P3:  ending = "an"
        }
        morph.verbForm = morph.verbForm + ending
        morph.part1 = "er"
        morph.part2 = ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case  .preterite:
        morph.verbForm = "fu_"
        morph.part1 = "fu_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "fu_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "fu"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "i"
        case .S2:  ending =  "iste"
        case .S3:  ending = "e"
        case .P1:  ending = "imos"
        case .P2:  ending = "isteis"
        case .P3:  ending = "eron"
        }
        morph.verbForm = morph.verbForm + ending
        morph.part1 = "fu"
        morph.part2 = ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case .presentSubjunctive:
        morph.verbForm = "se_"
        morph.part1 = "se_"
        morph.comment = getMorphComment(.replaceWithIrregularStem, "se_")
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "se"
        morph.isFinalStep = true
        switch person{
        case .S1:  ending = "a"
        case .S2:  ending =  "as"
        case .S3:  ending =  "a"
        case .P1:  ending = "amos"
        case .P2:  ending =  "áis"
        case .P3:  ending =  "an"
        }
        morph.verbForm = morph.verbForm + ending
        morph.part1 = "se"
        morph.part2 = ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
        //        case .imperative:
        //            morph.isFinalStep = true
        //            switch person{
        //            case .S1:
        //                morph.verbForm = ""
        //                morph.comment = "No first person, singular imperative"
        //                morphStruct.append(morphStep: morph)
        //            case .S2:
        //                morph.verbForm = "sé"
        //                morph.comment = "Use special irregular form 'sé'"
        //                morphStruct.append(morphStep: morph)
        //            case .S3:
        //                morph.verbForm = "sea"
        //                morph.comment = "Use the 3rd person, present subjunctive form 'sea'"
        //                morphStruct.append(morphStep: morph)
        //            case .P1:
        //                morph.verbForm = "seamos"
        //                morph.comment = "Use the 1st person, present subjunctive form 'seamos'"
        //                morphStruct.append(morphStep: morph)
        //            case .P2:
        //                morph.verbForm = "sed"
        //                morph.comment = "Remove verb ending 'er', replace with 'ed'"
        //                morphStruct.append(morphStep: morph)
        //            case .P3:
        //                morph.verbForm = "sean"
        //                morph.comment = "Use the 3rd person, present subjunctive form 'sean'"
        //                morphStruct.append(morphStep: morph)
        //            }
    case .imperfectSubjunctiveRA:
        morph.verbForm = "fu___"
        morphStruct.append(morphStep: morph)
        morph.comment = "Replace with irregular stem " + morph.verbForm
        morph.comment = getMorphComment(.replaceWithIrregularStem, morph.verbForm)
        morph = MorphStep()
        morph.verbForm = "fu"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending = "era"
        case .S2:  ending =  "eras"
        case .S3:  ending = "era"
        case .P1:  ending =  "éramos"
        case .P2:  ending = "erais"
        case .P3:  ending =  "eran"
        }
        morph.verbForm = morph.verbForm + ending
        morph.part1 = "fu"
        morph.part2 = ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    case  .imperfectSubjunctiveSE:
        morph.verbForm = "fu___"
        morph.comment = getMorphComment(.replaceWithIrregularStem, morph.verbForm)
        morphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.verbForm = "fu"
        morph.isFinalStep = true
        
        switch person{
        case .S1:  ending =  "ese"
        case .S2:  ending = "eses"
        case .S3:  ending =  "ese"
        case .P1:  ending = "ésemos"
        case .P2:  ending = "eseis"
        case .P3:  ending = "esen"
        }
        morph.verbForm = morph.verbForm + ending
        morph.part1 = "fu"
        morph.part2 = ending
        morph.comment = getMorphComment(.appendEnding, ending)
        morphStruct.append(morphStep: morph)
    default:
        return morphStruct
    }
    return morphStruct
    }//getFormSer
    
    
    public func getFormIr (inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct {
        let vu = VerbUtilities()
        let infinitive = "ir"
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        //this step was missing from morph struct (1/8/23)
        
        morph = MorphStep()
        morph.isIrregular = true
        
        var verbForm = inputMorphStruct.finalVerbForm()
        //if this is reflexive, then the only thing left will be the personal pronoun, else there will be nothing left
        verbForm = vu.removeLastLetters(verbWord: verbForm, letterCount: infinitive.count)  //remove the infinitive
        
        morph.verbForm = verbForm
        morph.comment = getMorphComment(.removeInfinitive, infinitive)
        morphStruct.append(morphStep: morph)
        
        
        var ending : String
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm += "voy"
            case .S2:  verbForm += "vas"
            case .S3:  verbForm += "va"
            case .P1:  verbForm += "vamos"
            case .P2:  verbForm += "vas"
            case .P3: verbForm += "van"
            }
            morph.verbForm = verbForm
            morph.part1 = verbForm
            morph.comment = "Replace with irregular form " + verbForm
            morph.comment = getMorphComment(.replaceWithIrregular, verbForm)
            morphStruct.append(morphStep: morph)
        case .imperfect:
            morph.verbForm = verbForm + "ib_"
            morph.part1 = verbForm + "ib_"
            morph.comment = getMorphComment(.replaceWithIrregularStem, "ib_")
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = verbForm + "ib"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending = "as"
            case .S3:  ending =  "a"
            case .P1:  ending = "amos"
            case .P2:  ending = "ais"
            case .P3:  ending =  "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case .preterite:
            switch person{
            case .S1:  verbForm +=  "fui"
            case .S2:  verbForm += "fuiste"
            case .S3:  verbForm += "fue"
            case .P1:  verbForm += "fuimos"
            case .P2:  verbForm += "fuisteis"
            case .P3:  verbForm += "fueron"
            }
            morph.isFinalStep = true
            morph.verbForm = verbForm
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.replaceWith, verbForm)
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.verbForm = verbForm + "vay_"
            morph.part1 = verbForm + "vay_"
            morph.comment = getMorphComment(.replaceWithIrregularStem, "vay_")
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = verbForm + "vay"
            morph.part1 = verbForm + "vay"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending = "as"
            case .S3:  ending = "a"
            case .P1:  ending = "amos"
            case .P2:  ending = "ais"
            case .P3:  ending = "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
            
        case .imperfectSubjunctiveRA:
            morph.verbForm = verbForm + "fu___"
            morph.part1 = verbForm + "fu___"
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "era"
            case .S2:  ending =  "eras"
            case .S3:  ending = "era"
            case .P1:  ending =  "éramos"
            case .P2:  ending = "erais"
            case .P3:  ending =  "eran"
            }
            morph.verbForm = morph.verbForm + ending
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case  .imperfectSubjunctiveSE:
            morph.verbForm = verbForm + "fu___"
            morph.comment = getMorphComment(.replaceWithIrregularStem, morph.verbForm)
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = verbForm + "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending =  "ese"
            case .S2:  ending = "eses"
            case .S3:  ending =  "ese"
            case .P1:  ending = "ésemos"
            case .P2:  ending = "eseis"
            case .P3:  ending = "esen"
            }
            morph.verbForm = morph.verbForm + ending
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "yendo"
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.replaceWithIrregular, "yendo")
            morphStruct.append(morphStep: morph)
            
        default:
            break
        }
        return morphStruct
    }//getFormIr
    
    
    public func getFormOir (inputMorphStruct : MorphStruct,  tense: Tense, person: Person ) -> MorphStruct {
        let vu = VerbUtilities()
        var morphStruct = inputMorphStruct
        let infinitive = "oír"
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        var verbFormPrefix = inputMorphStruct.finalVerbForm()
        //if this is a derivative word, such as deshacer, then create the prefix
        
        if verbFormPrefix.count > infinitive.count {
            verbFormPrefix = vu.removeLastLetters(verbWord: verbFormPrefix, letterCount: infinitive.count)  //remove the infinitive
            morph.verbForm = verbFormPrefix
            morph.comment = getMorphComment(.removeInfinitive, infinitive)
            morphStruct.append(morphStep: morph)
        } else {
            verbFormPrefix = ""
        }
        
        var ending = ""
        var ss = ""
        morph = MorphStep()
        morph.isFinalStep = true
        switch (tense){
        case .present:
            switch person{
            case .S1:
                ss = verbFormPrefix + "oigo"
                morph.part1 = ss
                morph.comment = getMorphComment(.replaceWith, "oigo")
                morph.verbForm = ss
                morphStruct.append(morphStep: morph)
            case .S2:
                ss = verbFormPrefix + "oy"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.comment = getMorphComment(.replaceStemWith, "oi", str2: "oy")
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                ending = "es"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.part2 = ending
                morph.verbForm += ending
                morph.isFinalStep = true
                morph.comment = getMorphComment(.appendEnding, ending)
                morphStruct.append(morphStep: morph)
            case .S3:
                ss = verbFormPrefix + "oy"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.comment = getMorphComment(.replaceStemWith, "oi", str2: "oy")
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                ending = "e"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.part2 = ending
                morph.verbForm += ending
                morph.isFinalStep = true
                morph.comment = getMorphComment(.appendEnding, ending)
                morphStruct.append(morphStep: morph)
            case .P1:
                ss = verbFormPrefix + "o__"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.comment = getMorphComment(.removeEnding, "ír")
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                ending = "ímos"
                morph.verbForm = verbFormPrefix + "o"
                morph.part1 = morph.verbForm
                morph.part2 = ending
                morph.verbForm = morph.verbForm + ending
                morph.isFinalStep = true
                morph.comment = getMorphComment(.appendEnding, ending)
                morphStruct.append(morphStep: morph)
            case .P2:
                ss = verbFormPrefix + "o__"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.comment = getMorphComment(.removeEnding, "ír")
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                ending = "ís"
                morph.verbForm = verbFormPrefix + "o"
                morph.part1 = morph.verbForm
                morph.part2 = ending
                morph.verbForm = morph.verbForm + ending
                morph.isFinalStep = true
                morph.comment = getMorphComment(.appendEnding, ending)
                morphStruct.append(morphStep: morph)
            case .P3:
                ss = verbFormPrefix + "oy"
                morph.verbForm = ss
                morph.part1 = morph.verbForm
                morph.comment = getMorphComment(.replaceStemWith, "oi", str2: "oy")
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                ss = verbFormPrefix + "oy"
                morph.verbForm = ss
                ending = "en"
                morph.part1 = morph.verbForm
                morph.part2 = ending
                morph.verbForm = morph.verbForm + ending
                morph.isFinalStep = true
                morph.comment = getMorphComment(.appendEnding, ending)
                morphStruct.append(morphStep: morph)
            }
            
        case .presentSubjunctive:
            morph.verbForm = verbFormPrefix + "o__"
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.removeEnding, "ír")
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = verbFormPrefix + "o"
            switch person{
            case .S1: ending = "iga"
            case .S2: ending = "igas"
            case .S3: ending = "iga"
            case .P1: ending = "igamos"
            case .P2: ending = "igais"
            case .P3: ending = "igan"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.part1 + morph.part2
            morph.isFinalStep = true
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case .preterite:
            morph.isFinalStep = true
            morph.verbForm = verbFormPrefix + "o__"
            morph.part1 = morph.verbForm
            morph.comment = getMorphComment(.removeEnding, "ír")
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = verbFormPrefix + "o"
            switch person{
            case .S1: ending = "í"
            case .S2: ending = "íste"
            case .S3: ending = "yó"
            case .P1: ending = "ímos"
            case .P2: ending = "ísteis"
            case .P3: ending = "yeron"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.part1 + morph.part2
            morph.comment = getMorphComment(.appendEnding, ending)
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .conditional :
            morph.comment = getMorphComment(.replaceThisWith, "oír", str2: "unaccented oir" )
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = verbFormPrefix + "oir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "ía"
            case .S2:  ending = "ías"
            case .S3:  ending = "ía"
            case .P1:  ending = "íamos"
            case .P2:  ending = "íais"
            case .P3:  ending = "ían"
            }
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case .future :
            morph.comment = getMorphComment(.replaceThisWith, "oír", str2: "unaccented oir" )
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = verbFormPrefix + "oir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "é"
            case .S2:  ending = "ás"
            case .S3:  ending = "á"
            case .P1:  ending = "emos"
            case .P2:  ending = "éis"
            case .P3:  ending = "án"
            }
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.verbForm = verbFormPrefix + "oyendo"
            morph.isFinalStep = true
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.verbForm = verbFormPrefix + "oído"
            morph.isFinalStep = true
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        return morphStruct
    }
    /*
     é
     É
     á
     ó
     í
     üú
     ñ
     ç
     ß
     */
    public func getFormReir (inputMorphStruct : MorphStruct,  tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        let ms = inputMorphStruct.getMorphStep(index: 0)  //should be the infinitive
        let infinitive = ms.verbForm
        let prefix = infinitive.dropLast(4)
        let stem = infinitive.dropLast(2)
        let shortStem = infinitive.dropLast(3)
        
        var morph = MorphStep()
        morph.isIrregular = true
        
        var ending = ""
        morph.verbForm = String(shortStem)
        morph.part1 = morph.verbForm
        switch (tense){
        case .present:
            morph.comment = getMorphComment(.removeEnding, "eír")
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = String(shortStem)
            switch person{
            case .S1: ending = "ío"
            case .S2:  ending = "íes"
            case .S3: ending = "íe"
            case .P1:  ending = "eímos"
            case .P2:  ending = "eís"
            case .P3:  ending = "íen"
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.part1 + morph.part2
            morph.comment = getMorphComment(.appendEnding, ending)
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .preterite:
            morph.comment = getMorphComment(.removeEnding, "eír")
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = String(shortStem)
            switch person{
            case .S1: ending = "eí"
            case .S2: ending = "eíste"
            case .S3: ending = "ío"
            case .P1: ending = "eímos"
            case .P2: ending = "eísteis"
            case .P3: ending = "ieron"
                
            }
            morph.part1 = morph.verbForm
            morph.part2 = ending
            morph.verbForm = morph.part1 + morph.part2
            morph.comment = getMorphComment(.appendEnding, ending)
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .conditional :
            morph.comment = "Replace '\(prefix)reír' with unaccented '\(prefix)reir' "
            morph.verbForm = prefix + "reir"
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = prefix + "reir"
            
            switch person{
            case .S1:  ending = "ía"
            case .S2:  ending = "ías"
            case .S3:  ending = "ía"
            case .P1:  ending = "íamos"
            case .P2:  ending = "íais"
            case .P3:  ending = "ían"
            }
            morph.verbForm = morph.verbForm + ending
            morph.isFinalStep = true
            morph.comment = getMorphComment(.appendEnding, ending)
        case .future:
            morph.comment = "Replace '\(prefix)reír' with unaccented '\(prefix)reir' "
            morph.verbForm = prefix + "reir"
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "\(prefix)reir"
            switch person{
            case .S1:  ending = "é"
            case .S2:  ending = "ás"
            case .S3:  ending = "á"
            case .P1:  ending = "emos"
            case .P2:  ending = "éis"
            case .P3:  ending = "án"
            }
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.appendEnding, ending)
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive :
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "\(prefix)ría"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "\(prefix)rías"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "\(prefix)ría"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "\(prefix)riamos"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "\(prefix)riáis"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "\(prefix)rían"
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            }
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "\(prefix)riendo"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "\(prefix)reído"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        
        return morphStruct
    }
    
    public func getFormSonreir (inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:  morph.verbForm = "sonrío"
            case .S2:  morph.verbForm = "sonríes"
            case .S3:  morph.verbForm = "sonríe"
            case .P1:  morph.verbForm = "sonreímos"
            case .P2:  morph.verbForm = "sonreís"
            case .P3:  morph.verbForm = "sonríen"
            }
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.isFinalStep = true
            switch person{
            case .S1:  morph.verbForm = "sonría"
            case .S2:  morph.verbForm = "sonrías"
            case .S3:  morph.verbForm = "sonría"
            case .P1:  morph.verbForm = "sonriamos"
            case .P2:  morph.verbForm = "sonriaís"
            case .P3:  morph.verbForm = "sonrían"
            }
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
            
        case .preterite:
            morph.isFinalStep = true
            switch person{
            case .S1:  morph.verbForm = "sonreí"
            case .S2:  morph.verbForm = "sonreíste"
            case .S3:  morph.verbForm = "sonrió"
            case .P1:  morph.verbForm = "sonreímos"
            case .P2:  morph.verbForm = "sonreísteis"
            case .P3:  morph.verbForm = "sonrieron"
            }
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "sonriendo"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "sonreído"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        
        return morphStruct
    }
    
    
    
    public func getFormVer (inputMorphStruct : MorphStruct, tense: Tense, person: Person ) -> MorphStruct {
        let vu = VerbUtilities()
        let infinitive = "ver"
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        
        //this step was missing from morph struct (1/8/23)
        
        morph = MorphStep()
        morph.isIrregular = true
        
        var verbForm = inputMorphStruct.finalVerbForm()
        //if this is reflexive, then the only thing left will be the personal pronoun, else there will be nothing left
        verbForm = vu.removeLastLetters(verbWord: verbForm, letterCount: infinitive.count)  //remove the infinitive
        
        morph.verbForm = verbForm
        morph.comment = getMorphComment(.removeInfinitive, infinitive)
        morphStruct.append(morphStep: morph)
        morph = MorphStep()
        morph.isIrregular = true
        var ending : String
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:
                verbForm += "veo"
                morph.verbForm = verbForm
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            case .P2:
                verbForm += "veis"
                morph.verbForm = verbForm
                morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
                morphStruct.append(morphStep: morph)
            default: break
            }
            
        case .presentSubjunctive:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm += "vea"
            case .S2:  verbForm += "veas"
            case .S3:  verbForm += "vea"
            case .P1:  verbForm += "veamos"
            case .P2:  verbForm += "veáis"
            case .P3:  verbForm += "vean"
            }
            morph.verbForm = verbForm
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .preterite:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm += "vi"
            case .S2:  verbForm += "viste"
            case .S3:  verbForm += "vio"
            case .P1:  verbForm += "vimos"
            case .P2:  verbForm += "visteis"
            case .P3:  verbForm += "vieron"
            }
            morph.verbForm = verbForm
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
            
        case .imperfect:
            morph.isFinalStep = true
            morph.verbForm = verbForm
            morph.verbForm += "ve"
            switch person{
            case .S1:  ending = "ía"
            case .S2:  ending = "ías"
            case .S3:  ending = "ía"
            case .P1:  ending = "íamos"
            case .P2:  ending = "íais"
            case .P3:  ending = "ían"
            }
            morph.verbForm = morph.verbForm + ending
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "viendo"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
            
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "visto"
            morph.comment = getMorphComment(.replaceWithIrregular, morph.verbForm )
            morphStruct.append(morphStep: morph)
            
        default:
            break
        }
        return morphStruct
    }
    
    
    
}
