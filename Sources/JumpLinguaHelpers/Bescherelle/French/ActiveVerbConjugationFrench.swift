//
//  ActiveVerbConjugationFrench.swift
//  VIperSpanish 2
//
//  Created by chuckd on 5/21/21.
//

import Foundation

//Nov25
public class ActiveVerbConjugationFrench {
    var perfectVerbAvoir = [[String]]()  //French ... avoir
    var perfectVerbEtre = [[String]]()  //French ... etre
    var progressiveVerbEtre = [[String]]() //French ... estar
    var specialVerbsFilled = false
    var p3PreteriteVerbWord = ""  // is there anything like this in French?

    //this is so much easier than trying to construct these verbs on the fly
    // plus, there is no morphing history to deal with
    
    // .... if they care they can l
    public func fillAuxiliaryFrenchVerbs(){
        perfectVerbAvoir = [
            ["ai", "as", "a", "avons", "avez", "ont"],
            ["avais", "avais", "avait", "avions","aviez","avaient"],
            ["eus", "eus", "eut", "eûmes", "eûtes", "eurent"],
            ["aurai", "auras", "aura", "aurons", "aurez", "auront"],
            ["aurais", "aurais", "aurait", "aurions", "auriez", "auraient"],
            ["aie", "aies", "ait", "ayons", "ayez", "aient" ],
            ["eusse", "eusses", "eût", "eussions", "eussiez", "eussent"]
        ]
         perfectVerbEtre = [
             ["suis", "es", "est", "sommes", "êtes", "sont"],
             ["étais", "étais", "était", "étions","étiez","étaient"],
             ["fus", "fus", "fut", "fûmes", "fûtes", "furent"],
             ["serai", "seras", "sera", "serons", "serez", "seront"],
             ["serais", "serais", "serait", "serions", "seriez", "seraient"],
             ["sois", "sois", "soit", "soyons", "soyez", "soient" ],
             ["fusse", "fusses", "fût", "fussions", "fussiez", "fussent"]
         ]
        progressiveVerbEtre = [
            ["suis en train de", "es en train de", "est en train de", "sommes en train de", "êtes en train de", "sont en train de"],
            ["étais en train de", "étais en train de", "était en train de", "étions en train de", "étiez en train de", "étaient en train de"]
        ]
        specialVerbsFilled = true
    }

    public func getPerfectVerb(tense: Tense, person: Person)->String {
        if !specialVerbsFilled {fillAuxiliaryFrenchVerbs()}
        let tenseIndex = max(0, tense.getPerfectIndex())
        let personIndex = person.getIndex()
        return perfectVerbAvoir[tenseIndex][personIndex]
    }
        
    public func getProgressiveVerb(tense: Tense, person: Person)->String {
        if !specialVerbsFilled {fillAuxiliaryFrenchVerbs()}
        let tenseIndex = max(0, tense.getProgressiveIndex())
        let personIndex = person.getIndex()
        return progressiveVerbEtre[tenseIndex][personIndex]
    }
    
    //indicative and subjunctive
    
    public func createInitialMorphSteps(verb: BFrenchVerb, person : Person, conjugateEntirePhrase: Bool)->MorphStruct
    {
        var workingMorphStruct = verb.getMorphStruct(person: person)
        let preposition = verb.m_residualPhrase
        var pronounString = ""
        var morphStep = MorphStep()
        
        if conjugateEntirePhrase {
            morphStep.comment = "Start with the verb phrase:" + " " + verb.getPhrase()
            morphStep.verbForm = verb.m_verbWord
            if verb.isReflexive() {
                morphStep.verbForm += "se"
            }
            if verb.hasPreposition() {
                morphStep.verbForm += " " + preposition
            }
            
            workingMorphStruct.append(morphStep : morphStep)
            
            if  verb.isReflexive() {
                pronounString = FrenchPronoun().getReflexive(person: person, startsWithVowelSound: false)
                //if S3 or P3, then pronoun 'se' does not have to change
                
                if  person != .S3 && person != .P3 {
                    var morphStep = MorphStep()
                     morphStep.comment = "Convert reflexive pronoun 'se' to correct person '\(pronounString)'"
                    morphStep.verbForm = verb.m_verbWord + pronounString + "  " + preposition
                    workingMorphStruct.append(morphStep : morphStep)
                }
                
                morphStep = MorphStep()
                morphStep.comment = "Move the pronoun '" + pronounString + "' to front of verb"
                morphStep.verbForm = pronounString + " " + verb.m_verbWord
                workingMorphStruct.append(morphStep : morphStep)
            }
            else {
                morphStep.comment = "Start with verb infinitive " + " " + verb.m_verbWord
                morphStep.verbForm = verb.m_verbWord
                workingMorphStruct.append(morphStep : morphStep)
            }
        }
        else {
            morphStep.comment = "Start with verb infinitive " + " " + verb.m_verbWord
            morphStep.verbForm = verb.m_verbWord
            workingMorphStruct.append(morphStep : morphStep)
        }
        return workingMorphStruct
    }
         
    

    public  func conjugateThisImperativeForm(verb : BFrenchVerb, person : Person, conjugateEntirePhrase : Bool ) -> MorphStruct {
        switch(person){
        case .S1:
            var ms = MorphStruct(person: .S1)
            var word = verb.m_verbWord
            word.removeLast()
            var morphStep = MorphStep()
            morphStep.comment = "There is no command form for first person singular -> I"
            morphStep.verbForm = ""
            ms.append(morphStep: morphStep)
            return ms
        case .S2: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .present, person: .S3, conjugateEntirePhrase: false)
        case .S3: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .S3, conjugateEntirePhrase: false)
        case .P1: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .P1, conjugateEntirePhrase: false)
        case .P2:
            var ms = MorphStruct(person: .S1)
            var word = verb.m_verbWord
            word.removeLast()
            var morphStep = MorphStep()
            morphStep.verbForm = word+"d"
            ms.append(morphStep: morphStep)
            return ms
        case .P3: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .P3, conjugateEntirePhrase: false)
        }
    }
    
    public func justCopyMorphStruct(verb: BFrenchVerb, person: Person) -> MorphStruct {
        let workingMorphStruct = verb.getMorphStruct( person: person)
        return workingMorphStruct
    }
    
    public func conjugateThisSimpleIndicativeNew(verb : BFrenchVerb, tense : Tense, person : Person , conjugateEntirePhrase : Bool ) -> MorphStruct {
        //let preposition = ""
        
        verb.restoreMorphStructs(person: person)
        
        //this is where we decide whether to use standard, stem or pretStem morphStruct
        
        var workingMorphStruct = verb.getMorphStruct( person: person)
        
        
        let verbWord = workingMorphStruct.finalVerbForm()
        
        var modelEndingType = EndingType.none

        
        if verb.m_isImpersonal1{
            if person == .S1 || person == .S2 || person == .P1 || person == .P2 {
                var morph = MorphStep()
                morph.comment =  "do not show this person"
                morph.part1 = ""
                morph.part2 = ""
                morph.part3 = ""
                morph.verbForm = "......"
                workingMorphStruct.append(morphStep: morph)
                return workingMorphStruct
                
            }
        }
        
        if verb.m_isImpersonal2{
            if person == .S1 || person == .S2 || person == .P1 || person == .P2 || person == .P3  {
            var morph = MorphStep()
            morph.comment = "do not show this person"
            morph.part1 = ""
            morph.part2 = ""
            morph.part3 = ""
            morph.verbForm = "....."
            workingMorphStruct.append(morphStep: morph)
            return workingMorphStruct
            }
        }

        //Chuck, fix this!!
        
        for se in verb.m_modelVerbEndingList {
            if se.type == .IR_ENDING {
                if  se.tense == tense { modelEndingType = .IR_ENDING}
                else if se.tense == .gerund  { modelEndingType = .IR_ENDING }
            }
            if se.type == .IR_ENDING1 {
                if  se.tense == tense { modelEndingType = .IR_ENDING1}
                else if se.tense == .gerund  { modelEndingType = .IR_ENDING1 }
            }
            if se.type == .IR_ENDING2 {
                if  se.tense == tense { modelEndingType = .IR_ENDING2}
                else if se.tense == .gerund  { modelEndingType = .IR_ENDING2 }
            }
            if se.type == .OIR_ENDING1 {
                if  se.tense == tense { modelEndingType = .OIR_ENDING1}
                else if se.tense == .gerund  { modelEndingType = .OIR_ENDING1 }
            }
            if se.type == .OIR_ENDING2 {
                if  se.tense == tense { modelEndingType = .OIR_ENDING2}
                else if se.tense == .gerund  { modelEndingType = .OIR_ENDING2 }
            }
            if se.type == .OIR_ENDING3 {
                if  se.tense == tense { modelEndingType = .OIR_ENDING3}
                else if se.tense == .gerund  { modelEndingType = .OIR_ENDING3 }
            }
            if se.type == .CHOIR_ENDING {
                if  se.tense == tense { modelEndingType = .CHOIR_ENDING}
                else if se.tense == .gerund  { modelEndingType = .CHOIR_ENDING }
            }
            if se.type == .overrideER {
                if  se.tense == tense { modelEndingType = .overrideER}
                else if se.tense == .gerund  { modelEndingType = .overrideER }
            }
            if se.type == .RE_ENDING {
                if  se.tense == tense { modelEndingType = .RE_ENDING}
                else if se.tense == .gerund  { modelEndingType = .RE_ENDING }
            }
            if se.type == .RE_ENDING1 {
                if  se.tense == tense { modelEndingType = .RE_ENDING1}
                else if se.tense == .gerund  { modelEndingType = .RE_ENDING1 }
            }
            if se.type == .RE_ENDING2 {
                if  se.tense == tense { modelEndingType = .RE_ENDING2}
                else if se.tense == .gerund  { modelEndingType = .RE_ENDING2 }
            }
            if se.type == .RE_ENDING3 {
                if  se.tense == tense { modelEndingType = .RE_ENDING3}
                else if se.tense == .gerund  { modelEndingType = .RE_ENDING3 }
            }
        }
        
        
        
        
        if ( verb.m_specialModel != SpecialFrenchVerbModel.none ){
            workingMorphStruct = IrregularVerbsFrench().getIrregularFormSpecial(inputMorphStruct : workingMorphStruct, verb : verb, preposition : "",
                                                                                specialVerbModel : verb.m_specialModel,
                                                                                tense : tense, person : person)
            //print("tense \(tense), person \(person) -- \(workingMorphStruct.finalVerbForm())")
            if workingMorphStruct.isComplete() {return workingMorphStruct}
        }
        
        //if this verb has a verb model at this tense/person, then conjugate it ... otherwise it's regular
        let replaceMultipleForm = verb.hasMultipleReplaceForm(tense: tense, person: person)
        if ( replaceMultipleForm.0.count > 0 ){
            workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: replaceMultipleForm.0, stemTo : replaceMultipleForm.1)
            return RegularFrenchVerb().attachRegularVerbEnding(inputMorphStruct: workingMorphStruct, tense: tense, person: person,
                                                               verbEnding: verb.m_verbEnding, endingType: modelEndingType)
        }
        
        let replaceEndingForm = verb.hasReplaceEndingForm(tense: tense, person: person)
        if ( replaceEndingForm.0.count>0 ){
            return RegularFrenchVerb().replaceEndingForm(inputMorphStruct : workingMorphStruct, from: replaceEndingForm.0, to : replaceEndingForm.1)
        }
        
        
        //if this verb has a verb model at this tense/person, then conjugate it ... otherwise it's regular
        let replaceForm = verb.hasReplaceForm(tense: tense, person: person)
        if ( replaceForm.0.count > 0 ){
            return StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: replaceForm.0, stemTo : replaceForm.1)
        }
        
        if ( verb.m_replacementVerbInfinitive.count > 0  && (tense == .future || tense == .conditional )){
            workingMorphStruct = replaceVerbInfinitive(inputMorphStruct : workingMorphStruct, baseInfinitive: verb.m_baseVerbInfinitive,
                                                       replacementInfinitive: verb.m_replacementVerbInfinitive)
            
        }
        
        //if stem single, then do it instead of other stem changes
        
        let dropLetters = verb.hasDropLettersForm(tense: tense, person: person)
        if ( dropLetters.count > 0 ){
            workingMorphStruct = StemChangingConjugation().dropLetters(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: dropLetters)
            workingMorphStruct = RegularFrenchVerb().attachRegularVerbEnding(inputMorphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding, endingType: modelEndingType)
            return workingMorphStruct
        }
        
        //if stem single, then do it instead of other stem changes
        
        let result = verb.hasStemSingleForm(tense: tense, person: person)
        if ( result.0.count > 0 ){
            workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: result.0, stemTo : result.1)
            workingMorphStruct = RegularFrenchVerb().attachRegularVerbEnding(inputMorphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding, endingType: modelEndingType)
            return workingMorphStruct
        }
        
        //stem changing for present tense?
        if verb.m_presentStemChanging {
            if tense == .present && verb.isPersonStem(person: person) {
                workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: verb.m_presentStemFrom, stemTo : verb.m_presentStemTo)
                workingMorphStruct = RegularFrenchVerb().attachRegularVerbEnding(inputMorphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding, endingType: modelEndingType)
                return workingMorphStruct
            }
        }
        //stem changing for presentSubj tense?
        if verb.m_presentSubjStemChanging {
            if tense == .presentSubjunctive && verb.isPersonStem(person: person) {
                workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: verb.m_presentSubjStemFrom, stemTo : verb.m_presentSubjStemTo)
                
                workingMorphStruct = RegularFrenchVerb().attachRegularVerbEnding(inputMorphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding, endingType: modelEndingType)
                return workingMorphStruct
            }
        }
   
        //treat this verb as a "regular" verb
        
        return RegularFrenchVerb().createRegularForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : "", tense : tense, person : person, endingType: modelEndingType)
    }


    public func replaceVerbInfinitive(inputMorphStruct : MorphStruct, baseInfinitive : String, replacementInfinitive : String)-> MorphStruct{
        var workingMorphStruct = inputMorphStruct
        let base = baseInfinitive
        var verbWord = inputMorphStruct.finalVerbForm()
        
        var morphStep = MorphStep()
        morphStep.isFutureStem = true
        morphStep.comment = "Grab base infinitive ->\(base)"
        morphStep.verbForm = verbWord
        workingMorphStruct.append(morphStep : morphStep)
            
        //strip it out
            
        verbWord = String(verbWord.dropLast(base.count))
            
        morphStep = MorphStep()
        morphStep.comment = "Replace infinitive with this form ->\(replacementInfinitive)"
        morphStep.verbForm = verbWord + replacementInfinitive
        workingMorphStruct.append(morphStep : morphStep)
        return workingMorphStruct
    }
    
    public func conjugateThisCompoundVerb(verb : BFrenchVerb, tense : Tense, person : Person , conjugateEntirePhrase : Bool ) -> MorphStruct {
        let preposition = ""
        var auxiliaryVerb = ""
        var participle = ""
         
        if tense.isProgressive() {
            auxiliaryVerb = self.getProgressiveVerb(tense: tense, person: person)
            participle = verb.m_gerund
        } else {
            auxiliaryVerb = self.getPerfectVerb(tense: tense, person: person)
            participle = verb.m_pastParticiple
        }

        var pronounString = ""
        var workingMorphStruct = createInitialMorphSteps(verb: verb, person: person, conjugateEntirePhrase: conjugateEntirePhrase)
        var morph = MorphStep()
        
        if verb.isReflexive() {
            pronounString = Pronoun().getReflexive(language: .French, person: person, startsWithVowelSound: false) + " "
            if VerbUtilities().startsWithVowelSound(characterArray: auxiliaryVerb) && person != .P1 && person != .P2 {
                pronounString.removeLast()
                pronounString.removeLast()
                pronounString += "'"
            }
        }
        
        //preposition = " " + verb.m_residualPhrase
        var ss = pronounString + participle

        if tense.isProgressive(){morph.comment = "replace with present participle " + participle}
        else { morph.comment = "replace with past participle " + participle }
        
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
    
}
