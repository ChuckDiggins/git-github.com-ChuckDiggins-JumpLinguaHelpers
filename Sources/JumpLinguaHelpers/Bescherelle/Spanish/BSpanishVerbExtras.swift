//
//  BSpanishVerbExtras.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/23/21.
//

import Foundation

//BSpanishVerb was getting too long ...

struct BSpanishVerbExtras {
    
    public func restoreMorphStructs(verb: BSpanishVerb)
    {
        verb.morphStructManager.restoreToInitialState()
    }

    func readModelParseStuff(verb: BSpanishVerb){
        
        for parseStruct in verb.m_verbModelParseList {
            
            if ( parseStruct.pattern == .SPECIAL){
                verb.m_isSpecial = true
                switch parseStruct.from {
                case "haber" : verb.m_specialModel = SpecialSpanishVerbModel.HABER
                case "estar" : verb.m_specialModel = SpecialSpanishVerbModel.ESTAR  //using the model, so far
                case "ir" : verb.m_specialModel = SpecialSpanishVerbModel.IR
                case "oir": verb.m_specialModel = SpecialSpanishVerbModel.OIR
                case "saber": verb.m_specialModel = SpecialSpanishVerbModel.SABER  //using the model, so far
                case "ser": verb.m_specialModel = SpecialSpanishVerbModel.SER
                case "reir": verb.m_specialModel = SpecialSpanishVerbModel.REIR
                case "sonreir": verb.m_specialModel = SpecialSpanishVerbModel.SONREIR
                case "ver": verb.m_specialModel = SpecialSpanishVerbModel.VER
                default: verb.m_specialModel = SpecialSpanishVerbModel.none
                }
            }
            if ( parseStruct.pattern == .STEM){
                verb.m_stemChanging = true
                verb.m_stemFrom = parseStruct.from
                verb.m_stemTo = parseStruct.to
            }
   
            if ( parseStruct.pattern == .PRETSTEM){
                verb.m_pretStemChanging = true
                verb.m_pretStemFrom = parseStruct.from
                verb.m_pretStemTo = parseStruct.to
            }
            
            if ( parseStruct.pattern == .PRETSTEM2){
                verb.m_pretStem2Changing = true
                verb.m_pretStem2From = parseStruct.from
                verb.m_pretStem2To = parseStruct.to
            }

            if ( parseStruct.pattern == .PRETSTEM3){
                verb.m_pretStem3Changing = true
            }

            //if this exists, use it
            
            if ( parseStruct.pattern == .REPLACEINFINITIVE){
                verb.m_isIrregular = true
                verb.m_baseVerbInfinitive = parseStruct.from
                verb.m_replacementVerbInfinitive = parseStruct.to
            }
            
            //if replacing irregular, add it to the list
            
            if ( parseStruct.pattern == .REPLACE){
                verb.m_isIrregular = true
                var replaceModelForm = ReplaceModelForm()
                replaceModelForm.person = parseStruct.personList[0]
                replaceModelForm.tense = parseStruct.tense
                replaceModelForm.fromWord = parseStruct.from
                replaceModelForm.toWord = parseStruct.to
                verb.replaceModelList.append(replaceModelForm)
            }
            
            
            //if replacing stem, add it to the list
            
            if ( parseStruct.pattern == .STEMSINGLE){
                verb.m_stemChanging = true
                var stemSingleForm = StemSingleForm()
                stemSingleForm.person = parseStruct.personList[0]
                stemSingleForm.tense = parseStruct.tense
                stemSingleForm.fromWord = parseStruct.from
                stemSingleForm.toWord = parseStruct.to
                verb.stemSingleList.append(stemSingleForm)
            }
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .REPLACEENDING){
                verb.m_isIrregular = true
                var form = ReplaceEndingForm()
                form.person = parseStruct.personList[0]
                form.tense = parseStruct.tense
                form.fromWord = parseStruct.from
                form.toWord = parseStruct.to
                verb.replaceEndingList.append(form)
            }
            
            if ( parseStruct.pattern == .ORTHO){
                if ( parseStruct.tense == .present ){
                    verb.m_orthoPresent = true
                    verb.m_orthoPresentFrom = parseStruct.from
                    verb.m_orthoPresentTo = parseStruct.to
                }
                if ( parseStruct.tense == .presentSubjunctive ){
                    verb.m_orthoPresentSubjunctive = true
                    verb.m_orthoPresentSubjunctiveFrom = parseStruct.from
                    verb.m_orthoPresentSubjunctiveTo = parseStruct.to
                }
                if ( parseStruct.tense == .preterite ){
                    verb.m_orthoPreterite = true
                    verb.m_orthoPreteriteFrom = parseStruct.from
                    verb.m_orthoPreteriteTo = parseStruct.to
                }
            }
        }

    }
        

}
