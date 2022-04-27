//
//  VerbModel.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation
import JumpLinguaHelpers

public enum SpecialPatternType : String {
    //Spanish
    case e2i = "e to i"  //pedir
    case e2ie = "e to ie" //tener, venir
    case e2y = "e to y"  //creer  preterite ... also e to í
    case e2ye = "e to ye"  //erguir
    case i2ie = "i to ie"  //adquirir
    case i2í = "i to í"  //prohibir / enraizar /guiar
    case o2u = "o to u" //podrir
    case o2ue = "o to ue"  //encontrar, dormir
    case o2hue = "o to hue" //desosar
    case u2ue = "u to ue"  //jugar
    case u2ú = "u to ú"  //reunir
    case u2uy = "u to uy"  //influir
    
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
    
    //spell/ortho changing
   
    case a2aig = "a to aig"  //caer, raer, traer
    case cab2quep = "cab to quep"  //caber
    case c2g = "c to g"  //hacer - hago, satisfacer
    case c2qu = "c to qu"  //hincar, sacar, trocar
    case c2z = "c to z"  //convencir, mecer, zurcir
    case c2zc = "c to zc" //lucir, conocer
    case c2zg = "c to zg"  //yacer
    case ec2ig = "ec to ig" //predecir, decir
    case gu2g = "gu to g"  //distinguir, erguir, xxxguir, seguir
    case g2gu = "g to gu"  //colgar, jugar, regar
    case g2j = "g to j"  //coger, dirigir, elegir
    case gu2gü = "gu to gü"  //averiguar
    case l2lg = "l to lg" //salir, valer
    case o2oig = "o to oig" //roer
    case n2ng = "n to ng" //tener, poner, venir
    case qu2c = "qu to c"  //delinquir
    case s2sg = "s to sg"  //asir
    case z2c = "z to c"  //enraizar, empezar
    
    case i_pret = "i pret" //hacer, querer, venir
    case uv_pret = "uv pret" //andar, estar, tener
    case u_pret = "u pret" //caber, haber, poder, poner, saber
    case j_pret = "j pret" //conducir, decir, traducir, traer
    
    case none = "none"
    
    public static var stemChangingESpanish =  [SpecialPatternType.e2i, .e2ie, .e2íe, .e2y, .e2ye]
    public static var stemChangingISpanish =  [SpecialPatternType.i2ie, .i2í]
    public static var stemChangingOSpanish =  [SpecialPatternType.o2u, .o2ue, .o2hue]
    public static var stemChangingUSpanish =  [SpecialPatternType.u2ue, .u2ú, .u2uy]
    
    
    public static var stemChangingAllSpanish =
    [SpecialPatternType.e2i, .e2ie, .e2íe, .e2y, .e2ye, .i2ie, .i2í, .o2u, .o2ue, .o2hue, .u2ue, .u2ú, .u2uy]

    public static var stemChangingPresentSpanish =
    [SpecialPatternType.e2i, .e2ie, .e2íe, .e2y, .e2ye, .i2í, .i2ie, .o2u, .o2ue, .o2hue, .u2ue, .u2ú, .u2uy]
    
    public static var stemChangingCommonSpanish =
    [SpecialPatternType.e2i, .e2ie, .o2ue]
    
    public static var stemChangingPreteriteSpanish =
    [SpecialPatternType.e2i, .o2u, .u2uy]
    
    public static var stemChangingFrenchAll =
    [SpecialPatternType.e2íe, .ev2o, .é2è, .e2è, .é2ie, .o2e, .l2ll, .t2tt, .y2i]
    
    public static var orthoChangingSpanish =
    [SpecialPatternType.a2aig, .cab2quep, .c2g, .c2qu, .c2zg, .c2z, .c2zc, .ec2ig, .gu2g, .g2gu, .g2j,
     .gu2gü, .l2lg, .o2oig, .n2ng, .qu2c, .z2c]
    
    public static var irregPreteriteSpanish =
    [SpecialPatternType.i_pret, .j_pret, .u_pret, .uv_pret]
    
    public func isOrthoChangingSpanish() -> Bool {
        if SpecialPatternType.orthoChangingSpanish.contains(self) {return true}
        return false
    }
    
    public func isStemChangingCommonSpanish() -> Bool {
        if SpecialPatternType.stemChangingCommonSpanish.contains(self) {return true}
        return false
    }
    
    public func isStemChangingPresentSpanish() -> Bool {
        if SpecialPatternType.stemChangingPresentSpanish.contains(self) {return true}
        return false
    }
    
    public func isStemChangingPreteriteSpanish() -> Bool {
        if SpecialPatternType.stemChangingPreteriteSpanish.contains(self) {return true}
        return false
    }
    
    public func isIrregularPreteriteSpanish() -> Bool {
        if SpecialPatternType.irregPreteriteSpanish.contains(self) {return true}
        return false
    }
    
}

public struct SpecialPattern : Codable{
    public var id = 0
    public var tenseStr: String
    public var patternStr : String
    
    public init(){
        tenseStr = "none"
        patternStr = "none"
    }
    
    public init(tenseStr: String, patternStr: String){
        self.tenseStr = tenseStr
        self.patternStr = patternStr
    }
}

public struct SpecialPatternStruct {
    public var tense : Tense
    public var pattern : SpecialPatternType
    
    public init(){
        tense = .infinitive
        pattern = .none
    }
    
    public init(tense: Tense, spt: SpecialPatternType){
        self.tense = tense
        self.pattern = spt
    }
    
    public func isSameAs(spt: SpecialPatternStruct)->Bool{
        if spt.tense == self.tense && spt.pattern == self.pattern { return true}
        return false
    }
}

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
    
    mutating public func appendSpecialPattern(tense: Tense, pattern: SpecialPatternType){
        let tenseStr = tense.rawValue
        let patternStr = pattern.rawValue
        let specialPattern = SpecialPattern(tenseStr: tenseStr, patternStr: patternStr)
        specialPatternList.append(specialPattern)
    }
    
    mutating public func parseSpecialPatterns()->[SpecialPatternStruct]{
        var specialPatternStructList = [SpecialPatternStruct]()
        
        for spt in specialPatternList {
            specialPatternStructList.append(parseSpecialPattern(tenseStr: spt.tenseStr, patternStr: spt.patternStr))
        }
        
        return specialPatternStructList
    }
    
//    public func getSpecialPatternStruct(tenseStr: String, patternStr: String)->SpecialPatternStruct {
//        var spt = parseSpecialPattern(tenseStr: tenseStr, patternStr: patternStr)
//        return spt
//    }
    
    mutating public func parseSpecialPattern(tenseStr: String, patternStr: String)->SpecialPatternStruct {
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
        
        case "a to aig"  : spt.pattern = .a2aig //caer, raer, traer
        case "cab to quep"   : spt.pattern = .cab2quep //caber
        case "c to g"  : spt.pattern = .c2g //hacer - hago, satisfacer
        case "c to qu"  : spt.pattern = .c2qu //hincar, sacar, trocar
        case "c to z"  : spt.pattern = .c2z //convencir, mecer, zurcir
        case "c to zc"  : spt.pattern = .c2zc //lucir
        case "c to zg"  : spt.pattern = .c2zg //yacer
        case "ec to ig"  : spt.pattern = .ec2ig //predecir, decir
        case "g to gu"   : spt.pattern = .g2gu //colgar, jugar, regar
        case "gu to g"   : spt.pattern = .gu2g //distinguir, erguir, xxxguir, seguir
        case "g to j"   : spt.pattern = .g2j //coger, dirigir, elegir
        case "gu to gü"   : spt.pattern = .gu2gü //averiguar
        case "l to lg"   : spt.pattern = .l2lg //salir, valer
        case "o to oig"    : spt.pattern = .o2oig //roer
        case "n to ng"   : spt.pattern = .n2ng //tener, poner, venir
        case "qu to c"   : spt.pattern = .qu2c //delinquir
        case "s to sg"   : spt.pattern = .s2sg //asir
        case "z to c"   : spt.pattern = .z2c //enraizar, empezar
        case "i pret"   : spt.pattern = .i_pret //hacer, querer, venir
        case "uv pret"   : spt.pattern = .uv_pret //andar, estar, tener
        case "u pret"   : spt.pattern = .u_pret //caber, haber, poder, poner, saber
        case "j pret"   : spt.pattern = .j_pret //conducir, decir, traducir, traer
        
            
        case "none": spt.pattern = .none
        default: spt.pattern = .none
        }
        return spt
    }
    
   
     mutating public func appendException(exceptionPattern: ExceptionPattern, tense : ExceptionTense, person : ExceptionPerson, from : String, to : String ) {
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


