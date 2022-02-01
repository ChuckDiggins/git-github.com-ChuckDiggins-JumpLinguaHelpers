//
//  IrregularVerbsFrench.swift
//  VIperSpanish 2
//
//  Created by chuckd on 5/20/21.
//

import Foundation

public enum SpecialFrenchVerbModel {
    case ETRE
    case AVOIR
    case none
}

public struct IrregularVerbsFrench {
    public func getIrregularFormSpecial(inputMorphStruct : MorphStruct, verb : BFrenchVerb, preposition : String,
                                 specialVerbModel : SpecialFrenchVerbModel,
                                 tense : Tense, person : Person)->MorphStruct{
        
        let morphStruct = inputMorphStruct
        
        switch (specialVerbModel){
        
        case .ETRE:
            return getFormEtre(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .AVOIR:
            return getFormAvoir(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        default:
            return morphStruct
        }
    }
    
    public func getFormAvoir (inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        var ss = ""
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case  .present:
            
            switch person{
            case .S1:  ss = "ai"
            case .S2:  ss =  "as"
            case .S3:  ss =  "a"
            case .P1:  ss =  "avons"
            case .P2:  ss =  "avez"
            case .P3:  ss =  "ont"
            }
            
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morph.comment = "Replace with irregular word " + morph.verbForm
            morphStruct.append(morphStep: morph)

        case  .preterite:
        
            switch person{
            case .S1:  ss = "eus"
            case .S2:  ss =  "eus"
            case .S3:  ss =  "eut"
            case .P1:  ss =  "eûmes"
            case .P2:  ss =  "eûtes"
            case .P3:  ss =  "eurent"
            }
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morph.comment = "Replace with irregular word " + morph.verbForm
            morphStruct.append(morphStep: morph)
        case .future :
            morph.comment = "Replace 'avoir' with 'aur' "
            morphStruct.append(morphStep: morph)
            ending = ""
            
            morph = MorphStep()
            morph.verbForm = "aur"
            
            switch person{
            case .S1:  ending = "ai"
            case .S2:  ending = "as"
            case .S3:  ending = "a"
            case .P1:  ending = "ons"
            case .P2:  ending = "ez"
            case .P3:  ending = "ont"
            }
            morph.comment = "Append ending " + ending
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.isFinalStep = true
            
            morphStruct.append(morphStep: morph)
        case .conditional :
            morph.comment = "Replace 'avoir' with 'aur' "
            morphStruct.append(morphStep: morph)
            ending = ""
            morph = MorphStep()
            morph.verbForm = "aur"
            
            switch person{
            case .S1:  ending = "ais"
            case .S2:  ending = "ais"
            case .S3:  ending = "ait"
            case .P1:  ending = "ions"
            case .P2:  ending = "iez"
            case .P3:  ending = "aient"
            }
            morph.comment = "Append ending " + ending
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            
            switch person{
            case .S1:  ss = "aie"
            case .S2:  ss =  "aies"
            case .S3:  ss =  "ait"
            case .P1:  ss =  "ayons"
            case .P2:  ss =  "ayes"
            case .P3:  ss =  "aient"
            }
            morph.comment = "Replace with " + morph.verbForm
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE :
            switch person{
            case .S1:  ss = "eusse"
            case .S2:  ss =  "eusses"
            case .S3:  ss =  "eût"
            case .P1:  ss =  "eussions"
            case .P2:  ss =  "eussiez"
            case .P3:  ss =  "eussent"
            }
            morph.comment = "Replace with " + morph.verbForm
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.verbForm = "ayant"  + preposition
            morph.comment = "use form 'ayant'"
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.verbForm = "eu"  + preposition
            morph.comment = "Use form: eu"
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        return morphStruct
    }
    
    public func getFormEtre (inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        var ss = ""
        morph = MorphStep()
        morph.isIrregular = true
        
        
        switch (tense){
        case .present:
            //            morph = MorphStep()
            switch person{
            case .S1:  ss = "suis"
            case .S2:  ss =  "es"
            case .S3:  ss =  "est"
            case .P1:  ss =  "sommes"
            case .P2:  ss =  "êtes"
            case .P3:  ss =  "sont"
            }
            morph.comment = "Replace with " + morph.verbForm
            morph.isFinalStep = true
            morph.verbForm = ss + preposition
            morphStruct.append(morphStep: morph)
        case  .imperfect:
            morph.verbForm = "ét"
            morph.comment = "Replace with ét ..."
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = "ét"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "ais"
            case .S2:  ending =  "ais"
            case .S3:  ending = "ait"
            case .P1:  ending = "ions"
            case .P2:  ending = "iez"
            case .P3:  ending = "aient"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.isFinalStep = true
            morph.comment = "Add ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .preterite:
            switch person{
            case .S1:  ss = "fus"
            case .S2:  ss =  "fus"
            case .S3:  ss =  "fut"
            case .P1:  ss =  "fûmes"
            case .P2:  ss =  "fûtes"
            case .P3:  ss =  "furent"
            }
            morph.comment = "Replace with " + morph.verbForm
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .future :
            morph.comment = "Replace 'être' with 'ser' "
            morphStruct.append(morphStep: morph)
            ending = ""
            morph = MorphStep()
            morph.verbForm = "ser"
            switch person{
            case .S1:  ending = "ai"
            case .S2:  ending = "as"
            case .S3:  ending = "a"
            case .P1:  ending = "ons"
            case .P2:  ending = "ez"
            case .P3:  ending = "ont"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Append ending -> " + ending
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .conditional :
            morph.comment = "Replace 'être' with 'ser' "
            morphStruct.append(morphStep: morph)
            ending = ""
            morph = MorphStep()
            morph.verbForm = "ser"
            
            switch person{
            case .S1:  ending = "ais"
            case .S2:  ending = "ais"
            case .S3:  ending = "ait"
            case .P1:  ending = "ions"
            case .P2:  ending = "iez"
            case .P3:  ending = "aient"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Attach ending -> " + ending
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            switch person{
            case .S1:  ss = "sois"
            case .S2:  ss =  "sois"
            case .S3:  ss =  "soit"
            case .P1:  ss =  "soyons"
            case .P2:  ss =  "soyez"
            case .P3:  ss =  "soient"
            }
            morph.comment = "Replace with irregular form: " + morph.verbForm
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .imperfectSubjunctiveRA, .imperfectSubjunctiveSE:
            switch person{
            case .S1:  ss = "fusse"
            case .S2:  ss =  "fusses"
            case .S3:  ss =  "fût"
            case .P1:  ss =  "fussions"
            case .P2:  ss =  "fussiez"
            case .P3:  ss =  "fussent"
            }
            morph.comment = "Replace with irregular form: " + morph.verbForm
            morph.verbForm = ss + preposition
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.verbForm = "étant"  + preposition
            morph.comment = "use form 'étant'"
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.verbForm = "été"  + preposition
            morph.comment = "Use form: été"
            morph.isFinalStep = true
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        return morphStruct
    }
   
}

