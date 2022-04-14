//
//  VerbModel.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation
import JumpLinguaHelpers

public enum ExceptionPattern : String {
    case IMPERSONAL1  //verbs with limited conjugation - rain, it is necessary, etc
    case IMPERSONAL2  //verbs with limited conjugation - rain, it is necessary, etc
    case STEM
    case STEMSINGLE
    case DROPLETTERS  //partir - parts -> pars  - drop t
    case PRETSTEM
    case PRETSTEM2
    case PRETSTEM3
    case ORTHO
    case ORTHOSTEM
    case REPLACE  //replaces part of the verb but still requires attaching a conjugation ending  -- tenir (French)
    case REPLACEIT  //does not require conjugation ending - French aller - S1, Present = vais
    case REPLACEINFINITIVE //decir with dir for future, conditional
    case REPLACEENDING     //dejieron to dijeron
    case STANDALONE     //   only has one verb pertaining to this model.  Such as ir, dar, estar.
                        //   Prevents other verbs with identical suffixes from using this model.
    case SPECIAL //just creates canned verb without "oir", "ser", "ir"
    case IR_ENDING //alternate IR ending - tenir
    case IR_ENDING1 //alternate IR ending - tenir
    case IR_ENDING2 //alternate IR ending - tenir
    case OIR_ENDING1 //alternate IR ending - tenir
    case OIR_ENDING2 //alternate IR ending - tenir
    case OIR_ENDING3 //alternate IR ending - vouloir
    case OIR_ENDING4 //alternate IR ending - vouloir
    case CHOIR_ENDING //alternate IR ending - déchoir, choir
    case OVERRIDE_ER //alternate IR ending - tenir
    case RE_ENDING //alternate RE ending - joindre present tense
    case RE_ENDING1 //alternate RE ending - rendre
    case RE_ENDING2 //alternate RE ending - rendre
    case RE_ENDING3 //alternate RE ending - rendre
    case IRREG
    case NONE
}


public enum ExceptionTense : String{
    case PRESENT
    case PRETERITE
    case IMPERFECT
    case PRESENTSUBJ
    case FUTURE
    case CONDITIONAL
    case IMPERFECTSUBJRA
    case IMPERFECTSUBJSE
    case PASTPART
    case GERUND
}

public enum ExceptionPerson  : String {
    case S1
    case S2
    case S3
    case P1
    case P2
    case P3
    case S1toP3All
    case S2toP3All
    case S1S2S3P3
    case S1S2S3
    case S1S2S3P1P2
    case S3P3
    case P1P2     //enraizars
    case P1P2P3     //enraizars
}

public enum ExceptionVerbEnding : String {
    case ar
    case er
    case ir
    case none
    
}

public enum SpecialPatternType : String {
    //Spanish
    case e2i = "e to i"
    case e2ie = "e to ie"
   
    case e2y = "e to y"  //creer  preterite ... also e to í
    case e2ye = "e to ye"  //erguir
    case i2í = "i to í"  //prohibir / enraizar /guiar
//    case i2y = "i to y"  //influir
    case o2u = "o to u"
    case o2ue = "o to ue"
    case o2hue = "o to hue"
    case u2ue = "u to ue"
    case u2ú = "u to ú"  //reunir
    case u2uy = "u to uy"  //influir  
    case c2zc = "z to zc"
    case c2c = "z to c"  //enraizar
    
    //Spanish and French
    case e2íe = "e to íe"  //reír
    
    //French
    case ev2o = "ev to o"  //devoir
    case é2è = "é to è"
    case e2è = "e to è"
    case é2ie = "é to ie"   //acquérir
    case o2e = "o to e"  //mourir
    case l2ll = "l to ll"
    case t2tt = "t to tt"
    case y2i = "y to i"
    
    case none = "none"
}

public struct SpecialPattern : Codable{
    public var id = 0
    public var tenseStr: String
    public var patternStr : String
    
    init(){
        tenseStr = "none"
        patternStr = "none"
    }
    
    init(tenseStr: String, patternStr: String){
        self.tenseStr = tenseStr
        self.patternStr = patternStr
    }
}

public struct SpecialPatternStruct {
    public var tense : Tense
    public var pattern : SpecialPatternType
    
    init(){
        tense = .infinitive
        pattern = .none
    }
    
    init(tense: Tense, spt: SpecialPatternType){
        self.tense = tense
        self.pattern = spt
    }
    
    func isSameAs(spt: SpecialPatternStruct)->Bool{
        if spt.tense == self.tense && spt.pattern == self.pattern { return true}
        return false
    }
}

public struct ParsedExceptionStruct {
    var tense = Tense.present
    var pattern = ExceptionPattern.STEM
    var from = ""
    var to = ""
    var personList = [Person]()
    var standAlone = false
}

public struct Exception : Codable{
    let exceptionPattern : String
    let tense : String
    let person : String?
    let from : String?
    let to : String?
    
    public init(exceptionPattern: String, tense: String, exceptionPerson: String, from: String, to:String){
        self.exceptionPattern = exceptionPattern
        self.tense = tense
        self.person = exceptionPerson
        self.from = from
        self.to = to
    }
}

public struct RomanceVerbModel : Identifiable {
    public let id : Int
    public let modelVerb : String
    public var exceptionList = [Exception]()
    public var specialPatternList = [SpecialPattern]()
    var includeWord = ""
    var includeSuffixList = [String]()
    var excludeSuffixList = [String]()
    var standAlone = false
    var special = false
    var specialVerb = ""
    var consistentVerbEnding = ExceptionVerbEnding.none  //assume that include suffixes are not consistent verb ending
 
    public init(){
        id = -1
        modelVerb = ""
    }
    
    public init(id: Int, modelVerb:String ){
        self.id = id
        self.modelVerb = modelVerb
    }
    
    public init(id: Int, modelVerb: String, exceptionList: [Exception], specialPatternList: [SpecialPattern], includeWord: String, includeSuffixList: [String], excludeSuffixList: [String]){
        self.id = id
        self.modelVerb = modelVerb
        self.exceptionList = exceptionList
        self.specialPatternList = specialPatternList
        self.includeWord = includeWord
        self.includeSuffixList = includeSuffixList
        self.excludeSuffixList = excludeSuffixList
    }
    
   
    mutating func appendSpecialPattern(tense: Tense, pattern: SpecialPatternType){
        let tenseStr = tense.rawValue
        let patternStr = pattern.rawValue
        let specialPattern = SpecialPattern(tenseStr: tenseStr, patternStr: patternStr)
        specialPatternList.append(specialPattern)
    }
    
    mutating func parseSpecialPatterns()->[SpecialPatternStruct]{
        var specialPatternStructList = [SpecialPatternStruct]()
        
        for spt in specialPatternList {
            specialPatternStructList.append(parseSpecialPattern(tenseStr: spt.tenseStr, patternStr: spt.patternStr))
        }
        
        return specialPatternStructList
    }
    
    mutating func parseSpecialPattern(tenseStr: String, patternStr: String)->SpecialPatternStruct {
        var spt = SpecialPatternStruct()
        
        switch tenseStr {
        case "Present" : spt.tense = Tense.present
        case "Preterite" : spt.tense = .preterite
        case "Future" : spt.tense = .future
        case "Pres Subj" : spt.tense = .presentSubjunctive
        default: spt.tense = .infinitive
        }
        
        switch patternStr {
        case "e to i" : spt.pattern = .e2i
        case "e to ie" : spt.pattern = .e2ie
       
        case "e to y" : spt.pattern = .e2y //creer  preterite ... also e to í
        case "e to ye" : spt.pattern = .e2ye //erguir
        case "i to í" : spt.pattern = .i2í  //prohibir / enraizar /guiar
    //    case i2y = "i to y"  //influir
        case "o to u" : spt.pattern = .o2u
        case "o to ue" : spt.pattern = .o2ue
        case "o to hue" : spt.pattern = .o2hue
        case "u to ue" : spt.pattern = .u2ue
        case "u to ú" : spt.pattern = .u2ú  //reunir
        case "u to uy"  : spt.pattern = .u2uy //influir
        case "z to zc" : spt.pattern = .c2zc
        case "z to c" : spt.pattern = .c2c //enraizar
        
        //Spanish and French
        case "e to íe"  : spt.pattern = .e2íe  //reír
        
        //French
        case "ev to o"  : spt.pattern = .ev2o //devoir
        case "é to è" : spt.pattern = .é2è
        case "e to è": spt.pattern = .e2è
        case "é to ie": spt.pattern = .é2ie //acquérir
        case "o to e" : spt.pattern = .o2e //mourir
        case "l to ll" : spt.pattern = .l2ll
        case "t to tt" : spt.pattern = .t2tt
        case "y to i" : spt.pattern  = .y2i
        
        case "none": spt.pattern = .none
        default: spt.pattern = .none
        }
        return spt
    }
    
     mutating func appendException(exceptionPattern: ExceptionPattern, tense : ExceptionTense, person : ExceptionPerson, from : String, to : String ) {
        let exception = exceptionPattern.rawValue
        let tense = tense.rawValue
        let person = person.rawValue
        let from = from
        let to = to
        let except = Exception(exceptionPattern:exception, tense: tense, exceptionPerson: person, from: from, to:to)
        if ( except.exceptionPattern == "STANDALONE"){
            standAlone = true
        }
        if ( except.exceptionPattern == "SPECIAL"){
            special = true
            specialVerb = from
        }
        exceptionList.append(except)
    }
    
    public mutating func appendWord(word: String){
        includeWord = word
    }
        
    
    public mutating func appendSuffix(suffix: String){
        includeSuffixList.append(suffix)
        
        var consistentEnding = true
        
        let testVerbEnding = includeSuffixList[0].suffix(2)
    
        //if any suffixes do not have the same verb ending as testVerbEnding,
        // then the test ending is not consistent
        
        for sf in includeSuffixList {
            if sf.suffix(2) != testVerbEnding {
                consistentEnding = false
                break
            }
        }
        consistentVerbEnding = .none
        if consistentEnding {
            if ( testVerbEnding == ExceptionVerbEnding.ar.rawValue){consistentVerbEnding = .ar}
            else if ( testVerbEnding == ExceptionVerbEnding.er.rawValue){consistentVerbEnding = .er}
            else if ( testVerbEnding == ExceptionVerbEnding.ir.rawValue){consistentVerbEnding = .ir}
        }
        
    }
    
    public mutating func appendExcludeSuffix(suffix: String){
        excludeSuffixList.append(suffix)
    }
    
    public func hasConsistentVerbEnding(suffix: String)->Bool {
        if suffix == consistentVerbEnding.rawValue {return true}
        return false
    }
    
    public func getConsistentVerbEnding()->String {
        return consistentVerbEnding.rawValue
    }
    
    public func isModelFor(verbWord: String)->Bool {
        
        if verbWord == includeWord {
            return true
        }
        
        //first, make sure it is not excluded
        for suffix in excludeSuffixList {
            if verbWord.hasSuffix(suffix){return false}
        }
        
        //only accept exact match with first suffix
        
        if standAlone {
            if verbWord == includeSuffixList[0] {return true}
        }
        else {
            //next, see if it is included
            for suffix in includeSuffixList {
                if verbWord.hasSuffix(suffix){return true}
            }
        }
        return false
    }
    
    public mutating func loadSpecialPatterns()->[SpecialPattern]{
        var specialPatternList = [SpecialPattern]()
        for spt in specialPatternList {
            specialPatternList.append(spt)
        }
        return specialPatternList
    }
    
    public mutating func parseVerbModel()->[ParsedExceptionStruct] {
        var parsedStructList = [ParsedExceptionStruct]()
        
        for exception in exceptionList {
            var parsedStruct = ParsedExceptionStruct()
            parsedStruct.tense = Tense.present
            parsedStruct.from = exception.from!
            parsedStruct.to = exception.to!
            
            //translate ExceptionPatternString into an enum that we can use
            
            switch exception.exceptionPattern {
            case "IMPERSONAL1" : parsedStruct.pattern = .IMPERSONAL1
            case "IMPERSONAL2" : parsedStruct.pattern = .IMPERSONAL2
            case "STEM" : parsedStruct.pattern = .STEM
            case "STEMSINGLE" : parsedStruct.pattern = .STEMSINGLE
            case "DROPLETTERS" : parsedStruct.pattern = .DROPLETTERS
            case "PRETSTEM" : parsedStruct.pattern = .PRETSTEM
            case "PRETSTEM2" : parsedStruct.pattern = .PRETSTEM2
            case "PRETSTEM3" : parsedStruct.pattern = .PRETSTEM3
            case "ORTHO" : parsedStruct.pattern = .ORTHO
            case "REPLACEINFINITIVE" : parsedStruct.pattern = .REPLACEINFINITIVE
            case "REPLACEENDING" : parsedStruct.pattern = .REPLACEENDING
            case "REPLACE" : parsedStruct.pattern = .REPLACE
            case "REPLACEIT" : parsedStruct.pattern = .REPLACEIT
            case "SPECIAL" : parsedStruct.pattern = .SPECIAL
            case "IR_ENDING": parsedStruct.pattern = .IR_ENDING
            case "IR_ENDING1": parsedStruct.pattern = .IR_ENDING1
            case "IR_ENDING2": parsedStruct.pattern = .IR_ENDING2
            case "OIR_ENDING1": parsedStruct.pattern = .OIR_ENDING1
            case "OIR_ENDING2": parsedStruct.pattern = .OIR_ENDING2
            case "OIR_ENDING3": parsedStruct.pattern = .OIR_ENDING3
            case "OIR_ENDING4": parsedStruct.pattern = .OIR_ENDING4
            case "CHOIR_ENDING": parsedStruct.pattern = .CHOIR_ENDING
            case "OVERRIDE_ER": parsedStruct.pattern = .OVERRIDE_ER
            case "RE_ENDING": parsedStruct.pattern = .RE_ENDING
            case "RE_ENDING1": parsedStruct.pattern = .RE_ENDING1
            case "RE_ENDING2": parsedStruct.pattern = .RE_ENDING2
            case "RE_ENDING3": parsedStruct.pattern = .RE_ENDING3
            default: parsedStruct.pattern = .NONE
            }
            
            switch exception.person {
            case "S1": parsedStruct.personList.append(Person.S1)
            case "S2": parsedStruct.personList.append(Person.S2)
            case "S3":  parsedStruct.personList.append(Person.S3)
            case "P1":  parsedStruct.personList.append(Person.P1)
            case "P2":  parsedStruct.personList.append(Person.P2)
            case "P3":  parsedStruct.personList.append(Person.P3)
            case "S1toP3All" :
                parsedStruct.personList.append(Person.S1)
                parsedStruct.personList.append(Person.S2)
                parsedStruct.personList.append(Person.S3)
                parsedStruct.personList.append(Person.P1)
                parsedStruct.personList.append(Person.P2)
                parsedStruct.personList.append(Person.P3)
            case "S2toP3All" :
                parsedStruct.personList.append(Person.S2)
                parsedStruct.personList.append(Person.S3)
                parsedStruct.personList.append(Person.P1)
                parsedStruct.personList.append(Person.P2)
                parsedStruct.personList.append(Person.P3)
            case "S1S2S3P3" :
                parsedStruct.personList.append(Person.S1)
                parsedStruct.personList.append(Person.S2)
                parsedStruct.personList.append(Person.S3)
                parsedStruct.personList.append(Person.P3)
            case "S1S2S3" :
                parsedStruct.personList.append(Person.S1)
                parsedStruct.personList.append(Person.S2)
                parsedStruct.personList.append(Person.S3)
            case "S3P3" :
                parsedStruct.personList.append(Person.S3)
                parsedStruct.personList.append(Person.P3)
            case "P1P2" :
                parsedStruct.personList.append(Person.P1)
                parsedStruct.personList.append(Person.P2)
            case "P1P2P3" :
                parsedStruct.personList.append(Person.P1)
                parsedStruct.personList.append(Person.P2)
                parsedStruct.personList.append(Person.P3)
            default: parsedStruct.personList.append(Person.S1)
            }
            
            switch exception.tense {
            case "PRESENT": parsedStruct.tense = .present
            case "IMPERFECT": parsedStruct.tense = .imperfect
            case "PRETERITE": parsedStruct.tense = .preterite
            case "PRESENTSUBJ": parsedStruct.tense = .presentSubjunctive
            case "IMPERFECTSUBJRA" : parsedStruct.tense = .imperfectSubjunctiveRA
            case "IMPERFECTSUBJSE" : parsedStruct.tense = .imperfectSubjunctiveSE
            case "FUTURE": parsedStruct.tense = .future
            case "CONDITIONAL": parsedStruct.tense = .conditional
            case "PASTPART": parsedStruct.tense = .pastParticiple
            case "GERUND": parsedStruct.tense = .gerund
            default: parsedStruct.tense = .present   
            
            }
            parsedStructList.append(parsedStruct)
        }
        
        return parsedStructList
    }

}

func createVerbModel(id: Int, verbWord : String, exceptionPattern: ExceptionPattern)->RomanceVerbModel
{
    let id = id
    let mv = verbWord
    var verbModel = RomanceVerbModel(id: id, modelVerb: mv)
    verbModel.appendSuffix(suffix: mv)
    return verbModel
}


