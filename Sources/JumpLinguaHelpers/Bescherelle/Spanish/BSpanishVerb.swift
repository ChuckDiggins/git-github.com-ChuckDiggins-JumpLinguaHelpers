//
//  BescherelleRomanceVerbClass.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation

//
//  RomanceVerbClass.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 12/25/20.
//

import Foundation

public class BSpanishVerb : BRomanceVerb {
    
    public var p3PreteriteWord = ""

    var m_useThis = false
    
    public var m_specialModel = SpecialSpanishVerbModel.none
    
    public var m_pretStem2Changing = false
    public var m_pretStem2From = ""
    public var m_pretStem2To = ""
    
    public var m_pretStem3Changing = false

   
    
    public var p3PreteriteVerbWord = String()

    
    public var m_pretStemChanging = false
    public var m_pretStemFrom = ""
    public var m_pretStemTo = ""
    
    //
    //*********************************************
    
//    public var m_verbModelParseList = [ParsedExceptionStruct]()
    public var m_defaultPresentSubjunctiveParsedExceptionStruct = ParsedExceptionStruct()
    public var m_defaultImperfectSubjunctiveParsedExceptionStruct = ParsedExceptionStruct()
    public var m_defaultParsedExceptionStruct = ParsedExceptionStruct()
    
    //var verbModelConjugation = VerbModelConjugation()
//
    
    var personIndex = 0
    
    var m_diagnosticLevel = 1

    public init(verbPhrase: String){
        super.init(verbPhrase: verbPhrase, language: .Spanish)
    }
    
    public  override init(){
        super.init(verbPhrase: "", language: .Spanish)
    }
    
    public override func setPatterns (verbModel : RomanceVerbModel) {
        bVerbModel = verbModel
       
        //bRomanceVerb specific
        initializeMorphStructs()
        if isReflexive() { addReflexiveMorphing() }
        
        //do some other stuff while we are at it
        m_verbStem = getVerbStem(verbWord : m_verbWord , verbEnding: m_verbEnding)
       
        //extract verb model stuff
        
        m_specialPatternList = bVerbModel.parseSpecialPatterns()
        m_verbModelParseList = bVerbModel.parseVerbModel()
       
        BSpanishVerbExtras().readModelParseStuff(verb: self)
        
        computeP3PreteriteForm()
        
        setRestrictions()
        
//        if m_pastParticiple.isEmpty {
//            m_pastParticiple = createPastParticiple()
//        }
//        if m_gerund.isEmpty {
//            m_gerund = createGerund()
//        }
        
    }//SetPatterns
    
    
    public override func createPastParticiple()->String {
        let vu = VerbUtilities()
        
        var verbWord = m_verbWord
        
        let exList = bVerbModel.exceptionList
        for ex in exList {
            let tenseStr = ex.tense
            let fromStr = ex.from ?? "no from string"   //contraver - contravisto
            let toStr = ex.to ?? "no to string"
            
            if tenseStr == "PASTPART" {
                if ex.exceptionPattern == "REPLACE" {  //the verb "ver" -> "visto"
                    return toStr
                }
                if ex.exceptionPattern == "REPLACEENDING" {
                    verbWord = vu.removeLastLetters(verbWord: verbWord, letterCount: fromStr.count)
                    verbWord += toStr
//                    print("createPastParticiple: for verb \(verbWord) from \(fromStr), to \(toStr)")
                    return verbWord
                }
            }
        }
        let result = hasReplaceEndingForm(tense: .pastParticiple)
        if result.0.count > 0 {
            var word = m_verbStem
            var removeCount = result.0.count
            if ( word.count < removeCount ) {removeCount = word.count}
            word = VerbUtilities().removeLastLetters(verbWord: word, letterCount: removeCount)
            word += result.1
            return word
        }
        
       return createDefaultPastParticiple()
    }
    
    public override func createDefaultPastParticiple()->String {
        //if part participle is not in the verb pattern, build the default here
        switch m_verbEnding {
        case .AR: return m_verbStem + "ado"
        case .ER, .IR, .accentIR: return m_verbStem + "ido"
        default: return m_verbStem + "nada"
        }
    }
    
    public override func createGerund()->String {
        var vu = VerbUtilities()
        var word = m_verbStem
        let exList = bVerbModel.exceptionList
        
        for ex in exList {
            let tenseStr = ex.tense
            let fromStr = ex.from ?? "no from string"
            let toStr = ex.to ?? "no to string"
            
            if tenseStr == "GERUND" {
                if ex.exceptionPattern == "REPLACE" {  //the verb "ir" ->yendo
                    return toStr
                }
                if ex.exceptionPattern == "REPLACEENDING" {  //the verb "ir" ->yendo
                    var verbWord = m_verbWord
                    verbWord = vu.removeLastLetters(verbWord: verbWord, letterCount: fromStr.count)
                    verbWord += toStr
                    print("create gerund: for verb \(verbWord) from \(fromStr), to \(toStr)")
                    return verbWord
                }

                var result = vu.replaceSubrangeAndGetBeforeAndAfterStrings(inputString: m_verbStem, fromString: fromStr, toString: "_")
                let partBefore = result.1
                let partAfter = result.2
                word = partBefore + toStr + partAfter
                if m_verbEnding == .AR { return word + "ando"}
                let lastLetter = word.suffix(1)
                if lastLetter == "ñ" { word += "endo" }
                else { word += "iendo" }
//                print("createGerund: for verb \(m_verbWord) from \(fromStr), to \(toStr)")
                return word
            }
        }
       
        
        if isStemChanging(){
            if m_stemFrom == "e" && (m_stemTo == "i" || m_stemTo == "ie"){
                let result = vu.replaceSubrangeAndGetBeforeAndAfterStrings(inputString: m_verbStem, fromString: m_stemFrom, toString: "_")
                let partBefore = result.1
                let partAfter = result.2
                word = partBefore + m_stemTo + partAfter
                let lastLetter = word.suffix(1)
                if lastLetter == "ñ" { word += "endo" }
                else { word += "iendo" }
                return word
            }
            if m_stemFrom == "o" && m_stemTo == "ue" && m_verbEnding != .AR {
                let result = vu.replaceSubrangeAndGetBeforeAndAfterStrings(inputString: m_verbStem, fromString: m_stemFrom, toString: "_")
                let partBefore = result.1
                let partAfter = result.2
                word = partBefore + m_stemTo + partAfter
                let lastLetter = word.suffix(1)
                if lastLetter == "ñ" { word += "endo" }
                else { word += "iendo" }
                return word
            }
        }
        return createDefaultGerund()
        
    }
    
    public override func createDefaultGerund()->String{
        var vu = VerbUtilities()
        var tempWord = m_verbStem
        
        switch m_verbEnding {
        case .AR: return tempWord + "ando"
        case .ER, .IR, .accentIR:
            let lastLetter = tempWord.suffix(1)
            if vu.isVowel(letter: String(lastLetter)) && lastLetter != "u"{
                return tempWord + "yendo"
            }
            if lastLetter == "ñ" {
                return tempWord + "endo"
            }
            return tempWord + "iendo"
        default: return tempWord + "xndo"
        }
    }
    
    public func computeP3PreteriteForm(){
        if ( p3PreteriteVerbWord.count == 0 ){
//            var p1PreteriteVerbWord = ActiveVerbConjugationSpanish().conjugateThisSimpleIndicativeNew(verb : self, tense: .preterite, person: .P1, conjugateEntirePhrase: false).finalVerbForm()
//            print("p1PreteriteVerbWord: \(p1PreteriteVerbWord)")
            p3PreteriteVerbWord = ActiveVerbConjugationSpanish().conjugateThisSimpleIndicativeNew(verb : self, tense: .preterite, person: .P3, conjugateEntirePhrase: false).finalVerbForm()
            p3PreteriteVerbWord = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: p3PreteriteVerbWord)
//            print("p3PreteriteVerbWord: \(p3PreteriteVerbWord)")
        }
    }
    
    public func getP3PreteriteForm()->String{
        return p3PreteriteVerbWord
    }
    
    public func dumpMorphStruct(morphStruct: MorphStruct, comment : String){
        print(comment)
        var i = 0
        while i < morphStruct.count() {
            let ms = morphStruct.getMorphStep(index: i)
            print("morphStep \(i) - verbForm \(ms.verbForm) = \(ms.part1) + \(ms.part2) + \(ms.part3)")
            i+=1
        }
    }
    /*
    func isPassive(verbWord: String)->Bool{
        for testVerb in passiveVerbDictionary {
            if ( verbWord == testVerb.key ){
                return true
            }
        }
        return false
    }
    */
 
    public func getMorphStruct(tense: Tense, person: Person)-> MorphStruct {
        return morphStructManager.get(person: person)
    }
      
    public override func getPhrase()->String {
        var phrase = m_verbWord
        if ( isReflexive()){  phrase += "se" }
        if ( hasPreposition() ){
            phrase += " "
            phrase += m_residualPhrase
        }
        return phrase
    }
    
    public func getPassiveConjugatedMorphStruct( tense : Tense, person : Person , conjugateEntirePhrase : Bool) -> MorphStruct {
        //simple indicative tenses
        let tenseIndex =  tense.getIndex()
        let count = Number.singular
        
        let passivePerson : Person = person.getPassivePerson(count : count)
        if tenseIndex <= Tense.future.getIndex() {
            let ms = PassiveVerbConjugationSpanish().conjugateThisSimplePassive( verb: self, tense : tense, person : passivePerson, count : count, conjugateEntirePhrase : conjugateEntirePhrase )
            setMorphStruct(person: person, morphStruct: ms)
            return ms
        }
        
        //perfect tenses - indicative and subjunctive
        
        if tenseIndex >= Tense.presentPerfect.getIndex() && tenseIndex <= Tense.conditionalProgressive.getIndex() {
            let ms = PassiveVerbConjugationSpanish().conjugateThisCompoundVerb( verb: self, tense : tense, person : person, count : count, conjugateEntirePhrase : conjugateEntirePhrase )
            setMorphStruct(person: person, morphStruct: ms)
            return ms
        }
        
        //simple subjunctive tenses
        
        if tenseIndex >= Tense.presentSubjunctive.getIndex() && tenseIndex <= Tense.imperfectSubjunctiveSE.getIndex() {
            let ms = PassiveVerbConjugationSpanish().conjugateThisSimpleSubjunctive( verb: self, tense : tense, person : person, count : count, conjugateEntirePhrase : conjugateEntirePhrase )
            setMorphStruct(person: person, morphStruct: ms)
            return ms
        }
        return MorphStruct(person: person)
    }
    
    public override func getConjugateForm(tense : Tense, person : Person)->String {
        let _ = getConjugatedMorphStruct( tense : tense, person : person , conjugateEntirePhrase : false)
        return morphStructManager.getFinalVerbForm(person: person)
    }
    

    //these patterns are not mutually exclusive
    
    public override func getConjugatedMorphStruct( tense : Tense, person : Person , conjugateEntirePhrase : Bool, isPassive : Bool = false) -> MorphStruct {
        
        let isNegative = false 
        //simple indicative tenses
        let tenseIndex =  tense.getIndex()
        var ms = MorphStruct(person: person)
        
//        if isPassive {print ("Verb is passive") }
//        else { print("verb is not passive") }
//        
        var personToUse = person
        if isPassive { personToUse = .S3 }
                     
        if tenseIndex <= Tense.future.getIndex() {
            ms = ActiveVerbConjugationSpanish().conjugateThisSimpleIndicativeNew( verb: self, tense : tense, person : personToUse, conjugateEntirePhrase : conjugateEntirePhrase )
            
        }
        
        else if ( tenseIndex == Tense.imperative.getIndex()){
            ms = ActiveVerbConjugationSpanish().conjugateThisImperativeForm(verb: self, person: personToUse, conjugateEntirePhrase: conjugateEntirePhrase, isNegative: isNegative)
        }
        
        //simple subjunctive tenses
        
        else if tenseIndex >= Tense.presentSubjunctive.getIndex() && tenseIndex <= Tense.imperfectSubjunctiveSE.getIndex() {
            //print("get p3 verb word = \(getP3PreteriteForm())")
            ms = ActiveVerbConjugationSpanish().conjugateThisSimpleIndicativeNew( verb: self, tense : tense, person : personToUse, conjugateEntirePhrase : conjugateEntirePhrase )
        }
        
        //perfect tenses - indicative and subjunctive
        
        else if tenseIndex >= Tense.presentPerfect.getIndex() && tenseIndex <= Tense.conditionalProgressive.getIndex() {
            ms = ActiveVerbConjugationSpanish().conjugateThisCompoundVerb( verb: self, tense : tense, person : personToUse, conjugateEntirePhrase : conjugateEntirePhrase)
        }
        
        //add residual phrase here
        if conjugateEntirePhrase && m_residualPhrase.count > 0 {
            let finalForm = ms.finalVerbForm()
            var morphStep = MorphStep()
            morphStep.isFinalStep = true
            morphStep.comment = "Add residual phrase -> \(m_residualPhrase)"
            morphStep.part1 = finalForm
            morphStep.part2 += " " + m_residualPhrase
            morphStep.verbForm = finalForm + " " + m_residualPhrase
            ms.append(morphStep : morphStep)
        }    
        setMorphStruct(person: person, morphStruct: ms)
        return ms
    }
    
        
    //verb properties --------------------------------------------------------
    
   
    public func isPretStemChanging()->Bool {
        return m_pretStemChanging  //VerbModel will need more granularity for this
    }
    
    public func isPretStem2Changing()->Bool {
        return m_pretStem2Changing //VerbModel will need more granularity for this
    }
    
    public func isPretStem3Changing()->Bool {
        return m_pretStem3Changing //VerbModel will need more granularity for this
    }
    
    
    public func isPersonPretStem(person : Person)->Bool {
        return true  //VerbModel will need more granularity for this
    }
    
    public func isPersonPretStem2(person : Person)->Bool {
        if person == .S3 || person == .P3 {return true}
        return false  //VerbModel will need more granularity for this
    }
    
    public func isPersonPretStem3(person : Person)->Bool {
        if person == .S1  {return false}
        return true  //VerbModel will need more granularity for this
    }


    
    public func isAuxiliary()->Bool{
        if (m_verbWord == "hacer" || m_verbWord == "estar"){ return true }
        return false
    }
    
    public func isSimple()->Bool{
        if (m_verbWord == "comer" || m_verbWord == "hablar" || m_verbWord == "vivir"){ return true }
        return false
    }
      
       
   
    public func getOrthoDescription()->String {
        
        return "placeholder"
    }
        
    public func getStemChangingDescription()->String {
        
        return "placeholder"
    }
        

    public func getIrregularDescription()->String {
        return "placeholder"
    }
    
    public func getIrregularSpecialDescription()->String {
        return "placeholder"
    }
   
    public func getSpecialDescription()->String {
        return "placeholder"
    }
}

