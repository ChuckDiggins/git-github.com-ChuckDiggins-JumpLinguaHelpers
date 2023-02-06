//
//  VerbModel.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation
import JumpLinguaHelpers

//public enum VerbModelType : String, CaseIterable {
//    
//    case Regular   //ar, er and ir together
//    case Critical  //spanish:  ser, estar, ver, oir, etc.
//    case Special   //spanish:  tener, gustar, jugar, decir, creer, conocer
//    case Important //spanish: encontrar, pedir, dirigir, pedir, influir
//    case Sparse    //avergonzar
//    case undefined //
//    
//    public static var mainVerbModelTypes = [VerbModelType.Regular, .Critical, .Special, .Important, .Sparse]
//    
//}

public enum NewVerbModelType : String, CaseIterable {
    
    
    case Regular   //ar, er and ir together
    case Critical  //spanish:  ser, estar, ver, oir, etc.
    case StemChanging //spanish: encontrar, pedir, dirigir, pedir, influir
    case SpellChanging
    case Irregular   //spanish:  tener, gustar, jugar, decir, creer, conocer
    case LikeGustar  //gustar, paracer, etc.  ==
    case undefined //
    
    
    public func getTypeName()->String{
        switch self{
        case .Regular: return "Regular"
        case .Critical: return "Critical"
        case .StemChanging: return "Stem changing"
        case .SpellChanging: return "Spell changing"
        case .Irregular: return "Irregular"
        case .LikeGustar: return "Like gustar"
        case .undefined: return "Undefined"
        }
    }
    
    public func getAbbreviatedTypeName()->String{
        switch self{
        case .Regular: return "Reg"
        case .Critical: return "Crit"
        case .StemChanging: return "Stem"
        case .SpellChanging: return "Spell"
        case .Irregular: return "Irreg"
        case .LikeGustar: return "~Gustar"
        case .undefined: return "Und"
        }
    }
    
    public static var allNewVerbModelTypes = NewVerbModelType.allCases
    
    
    
    public static var spanishVerbModelTypes = [NewVerbModelType.Regular, .Critical, .Irregular, .StemChanging, .SpellChanging]
    
    public static var limitedSpanishVerbModelTypeList =
    [NewVerbModelType.StemChanging, .SpellChanging, .Irregular]
    
    public static var stemChangingSpanishVerbModelTypeList = [NewVerbModelType.StemChanging]
    public static var spellChangingSpanishVerbModelTypeList = [NewVerbModelType.SpellChanging]
    public static var irregularSpanishVerbModelTypeList = [NewVerbModelType.Irregular]
}


public enum SpecialPatternType : String, Equatable {
    
    //Spanish
    case e2i = "e->i"  //pedir
    case e2ie = "e->ie" //tener, venir
    case e2y = "e->y"  //creer  preterite ... also e to í
    case í2y = "í->y"  //oír
    case e2ye = "e->ye"  //erguir
    case i2ie = "i->ie"  //adquirir
    case i2í = "i->í"  //prohibir / enraizar /guiar
    case o2u = "o->u" //podrir
    case o2ue = "o->ue"  //encontrar, dormir
    case o2üe = "o->üe"  //avergonzar
    case o2hue = "o->hue" //desosar
    case u2ue = "u->ue"  //jugar
    case u2ú = "u->ú"  //reunir
    case u2uy = "u->uy"  //influir
    
    //Spanish and French
    case e2í = "e->í"  //reír
    
    //French
    case ev2o = "ev->o"  //devoir
    case é2è = "é->è"
    case e2è = "e->è"
    case é2ie = "é->ie"   //acquérir
    case o2e = "o->e"  //mourir
    case l2ll = "l->ll"
    case t2tt = "t->tt"
    case y2i = "y->i"
    
    //spell/ortho changing
   
    case a2é = "a->é"  //dar - present subj
    case a2oy = "a->oy"  //dar
    case ab2up = "ab->up"  //saber (supe)
    case a2aig = "a->aig"  //caer, raer, traer
    case cab2quep = "cab->quep"  //caber
    case c2g = "c->g"  //hacer - hago, satisfacer
    case c2qu = "c->qu"  //hincar, sacar, trocar
    case c2z = "c->z"  //convencir, mecer, zurcir
    case c2zc = "c->zc" //lucir, conocer
    case c2zg = "c->zg"  //yacer
    case ec2ig = "ec->ig" //predecir, decir
    case ec2ij = "ec->ij" //predecir, decir
    case ec = "drop->ec" //predecir, decir
    case gu2g = "gu->g"  //distinguir, erguir, xxxguir, seguir
    case g2gu = "g->gu"  //colgar, jugar, regar
    case g2j = "g->j"  //coger, dirigir, elegir
    case gu2gü = "gu->gü"  //averiguar
    case l2lg = "l->lg" //salir, valer
    case o2oig = "o->oig" //roer
    case n2ng = "n->ng" //tener, poner, venir
    case qu2c = "qu->c"  //delinquir
    case s2sg = "s->sg"  //asir
    case z2c = "z->c"  //enraizar, empezar
    
    //irregular preterite
    case o2oí = "o->oí" //roer
    case o2oy = "o->oy" //roer
    case a2í = "a->í"  //raer
    case a2ay = "a->ay"  //raer
    case er2is = "er->is" //querer - quise
    case j = "j"  //traer
    case a2i = "a->i" //hacer
    case uv = "uv" //andar, estar, tener
    case a2u = "a->u" //haber
    case o2ud = "o->ud" //poder
    case o2us = "o->us" //poner
    case c2j = "c->j" //producir, decir
    case ñi2ñ = "ñi->ñ" //bruñir - drop the i after ñ
    case lli2ll = "lli->ll" //bullir - drop the i after ll
    
    //irregular conditional/future/preterite
    case irreg = "irreg"
    case shortInf = "short inf"
    
    case none = "none"
    
    public static var stemChangingESpanish =  [SpecialPatternType.e2i, .e2ie, .e2í, .e2y, .e2ye]
    public static var stemChangingISpanish =  [SpecialPatternType.i2ie, .i2í]
    public static var stemChangingOSpanish =  [SpecialPatternType.o2u, .o2ue, .o2hue]
    public static var stemChangingUSpanish =  [SpecialPatternType.u2ue, .u2ú, .u2uy]
    
    public static var stemChangingAllSpanish =
    [SpecialPatternType.e2i, .e2ie, .e2í, .e2y, .e2ye, .i2ie, .i2í, .o2u, .o2ue, .o2üe, .o2hue, .u2ue, .u2ú, .u2uy]

    public static var stemChangingPresentSpanish =
    [SpecialPatternType.e2i, .e2ie, .e2í, .e2y, .e2ye, .i2í, .i2ie, .o2u, .o2ue, .o2üe, .o2hue, .u2ue, .u2ú, .u2uy]
    
    public static var stemChangingPreteriteSpanish =
    [SpecialPatternType.e2i, .o2u, .u2uy]
    
    public static var stemChangingFrenchAll =
    [SpecialPatternType.e2í, .ev2o, .é2è, .e2è, .é2ie, .o2e, .l2ll, .t2tt, .y2i]
    
    public static var spellChangingSpanish1 =
    [SpecialPatternType.a2aig, .c2zc, .c2z, .g2j, .gu2g,]
    
    public static var spellChangingSpanish2 =
    [SpecialPatternType.cab2quep, .c2g, .c2qu, .c2zg, .ec2ig, .g2gu,
     .gu2gü, .l2lg, .o2oig, .n2ng, .qu2c, .z2c]
    
    public static var orthoChangingSpanish =
    [SpecialPatternType.a2é, .a2i, .a2u, .ab2up, .a2í, .a2ay, .a2oy, .a2aig, .cab2quep, .c2g, .c2j, .c2qu, .c2zg, .c2z, .c2zc, .ec2ig, .ec2ij, .ec, .gu2g, .g2gu, .g2j,
     .gu2gü, .j, .l2lg, .lli2ll, .n2ng, .ñi2ñ, .o2oig, .o2ud, .o2us, .o2oí,.o2oy, .qu2c, .s2sg, .uv, .z2c, .shortInf, .irreg]
    
    public static var irregPreteriteSpanish =
    [SpecialPatternType.j, .a2i, .uv, .a2í, .a2ay, .ab2up, .o2ud, .o2us, .c2j, .ñi2ñ, .c2qu, .e2i, .c2z, .o2u, .g2gu, .gu2gü, .u2uy, .z2c, .e2í, ]
    
    public static var irregConditionalSpanish =
    [SpecialPatternType.irreg]
    
    public func isOrthoChangingSpanish() -> Bool {
        if SpecialPatternType.orthoChangingSpanish.contains(self) {return true}
        return false
    }
    
    public func isStemChangingSpanish() -> Bool {
        if SpecialPatternType.stemChangingAllSpanish.contains(self) {return true}
        return false
    }
    
    public func isIrregularSpanish() -> Bool {
        if SpecialPatternType.irregPreteriteSpanish.contains(self) {return true}
        return false
    }
    
    public func isStemChangingFrench() -> Bool {
        if SpecialPatternType.stemChangingFrenchAll.contains(self) {return true}
        return false
    }
    
    public func isSpellChangingSpanish() -> Bool {
        if SpecialPatternType.orthoChangingSpanish.contains(self) {return true}
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
    case IMPERATIVE
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

extension RomanceVerbModel: Equatable, Hashable{
    public static func == (lhs: RomanceVerbModel, rhs: RomanceVerbModel)->Bool {
        return lhs.modelVerb == rhs.modelVerb
    }
    
    public func hash(into hasher: inout Hasher){
        hasher.combine(modelVerb)
    }
}

public struct RomanceVerbModel : Identifiable {
    public let id : Int
    public let modelVerb : String
    public var exceptionList = [Exception]()
    public var specialPatternList = [SpecialPattern]()
    var modelStem = ""
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
    
    mutating public func setModelStem(modelStem : String){
        self.modelStem = modelStem
    }
    
    public func getModelStem()->String{
        modelStem
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
        case "Present" : spt.tense = .present
        case "Preterite" : spt.tense = .preterite
        case "Imperfect" : spt.tense = .imperfect
        case "Future" : spt.tense = .future
        case "Conditional" : spt.tense = .conditional
        case "Pres Subj" : spt.tense = .presentSubjunctive
        case "ImpSubj-ra" : spt.tense = .imperfectSubjunctiveRA
        case "ImpSubj-se" : spt.tense = .imperfectSubjunctiveRA
        default: spt.tense = .infinitive
        }
        
        switch patternStr {
        case "a->í" : spt.pattern = .a2í
        case "a->ay" : spt.pattern = .a2ay
        case "e->i" : spt.pattern = .e2i
        case "e->ie" : spt.pattern = .e2ie
        case "i->ie" : spt.pattern = .i2ie
       
        case "e->y" : spt.pattern = .e2y //creer  preterite ... also e to í
        case "e->ye" : spt.pattern = .e2ye //erguir
        case "i->í" : spt.pattern = .i2í  //prohibir / enraizar /guiar
    //    case i2y = "i to y"  //influir
        case "o->u" : spt.pattern = .o2u
        case "o->ue" : spt.pattern = .o2ue
        case "o->üe" : spt.pattern = .o2üe
        case "o->hue" : spt.pattern = .o2hue
        case "u->ue" : spt.pattern = .u2ue
        case "u->ú" : spt.pattern = .u2ú  //reunir
        case "u->uy"  : spt.pattern = .u2uy //influir
        
        case "í->y"  : spt.pattern = .í2y //oír
            
        //Spanish and French
        case "e->í"  : spt.pattern = .e2í  //reír
        
        //French
        case "ev->o"  : spt.pattern = .ev2o //devoir
        case "é->è" : spt.pattern = .é2è
        case "e->è": spt.pattern = .e2è
        case "é->ie": spt.pattern = .é2ie //acquérir
        case "o->e" : spt.pattern = .o2e //mourir
        case "l->ll" : spt.pattern = .l2ll
        case "t->tt" : spt.pattern = .t2tt
        case "y->i" : spt.pattern  = .y2i
        case "a->é"  : spt.pattern = .a2é  //dar - present subj
        case "a->oy" : spt.pattern = .a2oy //dar
        case "a->aig"  : spt.pattern = .a2aig //caer, raer, traer
        case "cab->quep"   : spt.pattern = .cab2quep //caber
        case "c->g"  : spt.pattern = .c2g //hacer - hago, satisfacer
        case "c->qu"  : spt.pattern = .c2qu //hincar, sacar, trocar
        case "c->z"  : spt.pattern = .c2z //convencir, mecer, zurcir
        case "c->zc"  : spt.pattern = .c2zc //lucir
        case "c->zg"  : spt.pattern = .c2zg //yacer
        case "ec->ig"  : spt.pattern = .ec2ig //predecir, decir
        case "ec->ij" : spt.pattern = .ec2ij //predecir, decir
        case "drop->ec" : spt.pattern = .ec //predecir, decir
        case "g->gu"   : spt.pattern = .g2gu //colgar, jugar, regar
        case "g->j"   : spt.pattern = .g2j //colgar, jugar, regar
        case "gu->g"   : spt.pattern = .gu2g //distinguir, erguir, xxxguir, seguir
        case "a2í" : spt.pattern = .a2í
        case "a2ay" : spt.pattern = .a2ay
        case "o2oí" : spt.pattern = .o2oí  //roer
        case "o2oy" : spt.pattern = .o2oy  //roer
        case "j"   : spt.pattern = .j //coger, dirigir, elegir
        case "gu->gü"   : spt.pattern = .gu2gü //averiguar
        case "l->lg"   : spt.pattern = .l2lg //salir, valer
        case "o->oig"    : spt.pattern = .o2oig //roer
        case "n->ng"   : spt.pattern = .n2ng //tener, poner, venir
        case "qu->c"   : spt.pattern = .qu2c //delinquir
        case "s->sg"   : spt.pattern = .s2sg //asir
        case "z->c"   : spt.pattern = .z2c //enraizar, empezar
        case "a->i" : spt.pattern = .a2i //hacer
        case "uv" : spt.pattern = .uv //andar, estar, tener
        case "a->u" : spt.pattern = .a2u //haber
        case "ab->up" : spt.pattern = .ab2up //caber, saber
        case "o->ud" : spt.pattern = .o2ud //poder
        case "o->us" : spt.pattern = .o2us //poner,
        case "c->j" : spt.pattern = .c2j //producir, decir
        case "ñi->ñ"   : spt.pattern = .ñi2ñ //bruñir
        case "lli->ll"   : spt.pattern = .lli2ll //bullir
        case "er2is": spt.pattern = .er2is  //querer
        case "irreg" : spt.pattern = .irreg
        case "short inf" : spt.pattern = .shortInf
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
            case "IMPERATIVE": parsedStruct.tense = .imperative
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


