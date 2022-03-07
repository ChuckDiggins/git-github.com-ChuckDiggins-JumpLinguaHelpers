//
//  VerbModel.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation

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
    
    public init(id: Int, modelVerb: String, exceptionList: [Exception], includeWord: String, includeSuffixList: [String], excludeSuffixList: [String]){
        self.id = id
        self.modelVerb = modelVerb
        self.exceptionList = exceptionList
        self.includeWord = includeWord
        self.includeSuffixList = includeSuffixList
        self.excludeSuffixList = excludeSuffixList
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


