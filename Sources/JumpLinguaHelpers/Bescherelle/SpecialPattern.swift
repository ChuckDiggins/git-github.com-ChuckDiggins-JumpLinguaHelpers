////
////  File.swift
////  
////
////  Created by Charles Diggins on 4/15/22.
////
//
//import Foundation
//
//public enum SpecialPatternType : String {
//    //Spanish
//    case e2i = "e to i"  //pedir
//    case e2ie = "e to ie" //tener, venir
//    case e2y = "e to y"  //creer  preterite ... also e to í
//    case e2ye = "e to ye"  //erguir
//    case i2í = "i to í"  //prohibir / enraizar /guiar
//    case o2u = "o to u" //podrir
//    case o2ue = "o to ue"  //encontrar, dormir
//    case o2hue = "o to hue" //desosar
//    case u2ue = "u to ue"  //jugar
//    case u2ú = "u to ú"  //reunir
//    case u2uy = "u to uy"  //influir
//    
//    //Spanish and French
//    case e2íe = "e to íe"  //reír
//    
//    //French
//    case ev2o = "ev to o"  //devoir
//    case é2è = "é to è"
//    case e2è = "e to è"
//    case é2ie = "é to ie"   //acquérir
//    case o2e = "o to e"  //mourir
//    case l2ll = "l to ll"
//    case t2tt = "t to tt"
//    case y2i = "y to i"
//    
//    //spell/ortho changing
//   
//    case a2aig = "a to aig"  //caer, raer, traer
//    case cab2quep = "cab to quep"  //caber
//    case c2g = "c to g"  //hacer - hago, satisfacer
//    case c2qu = "c to qu"  //hincar, sacar, trocar
//    case c2z = "c to z"  //convencir, mecer, zurcir
//    case c2zc = "c to zc" //lucir
//    case c2zg = "c to zg"  //yacer
//    case ec2ig = "ec to ig" //predecir, decir
//    case gu2g = "gu to g"  //distinguir, erguir, xxxguir, seguir
//    case g2gu = "g to gu"  //colgar, jugar, regar
//    case g2j = "g to j"  //coger, dirigir, elegir
//    case gu2gü = "gu to gü"  //averiguar
//    case l2lg = "l to lg" //salir, valer
//    case o2oig = "o to oig" //roer
//    case n2ng = "n to ng" //tener, poner, venir
//    case qu2c = "qu to c"  //delinquir
//    case s2sg = "s to sg"  //asir
//    case z2c = "z to c"  //enraizar, empezar
//    
//    case i_pret = "i pret" //hacer, querer, venir
//    case uv_pret = "uv pret" //andar, estar, tener
//    case u_pret = "u pret" //caber, haber, poder, poner, saber
//    case j_pret = "j pret" //conducir, decir, traducir, traer
//    
//    case none = "none"
//    
//    static var stemChangingAllSpanish =
//    [SpecialPatternType.e2i, .e2ie, .e2íe, .e2y, .e2ye, .i2í, .o2u, .o2ue, .o2hue, .u2ue, .u2ú, .u2uy]
//
//    static var stemChangingPresentSpanish =
//    [SpecialPatternType.e2i, .e2ie, .e2íe, .e2y, .e2ye, .i2í, .o2u, .o2ue, .o2hue, .u2ue, .u2ú, .u2uy]
//    
//    static var stemChangingCommonSpanish =
//    [SpecialPatternType.e2i, .e2ie, .o2ue]
//    
//    static var stemChangingPreteriteSpanish =
//    [SpecialPatternType.e2i, .o2u, .u2uy]
//    
//    static var stemChangingFrenchAll =
//    [SpecialPatternType.e2íe, .ev2o, .é2è, .e2è, .é2ie, .o2e, .l2ll, .t2tt, .y2i]
//    
//    static var orthoChangingSpanish =
//    [SpecialPatternType.a2aig, .cab2quep, .c2g, .c2qu, .c2zg, .c2z, .c2zc, .ec2ig, .gu2g, .g2gu, .g2j,
//     .gu2gü, .l2lg, .o2oig, .n2ng, .qu2c, .z2c]
//    
//    static var irregPreteriteSpanish =
//    [SpecialPatternType.i_pret, .j_pret, .u_pret, .uv_pret]
//    
//    public func isOrthoChangingSpanish() -> Bool {
//        if SpecialPatternType.orthoChangingSpanish.contains(self) {return true}
//        return false
//    }
//    
//    public func isStemChangingCommonSpanish() -> Bool {
//        if SpecialPatternType.stemChangingCommonSpanish.contains(self) {return true}
//        return false
//    }
//    
//    public func isStemChangingPresentSpanish() -> Bool {
//        if SpecialPatternType.stemChangingPresentSpanish.contains(self) {return true}
//        return false
//    }
//    
//    public func isStemChangingPreteriteSpanish() -> Bool {
//        if SpecialPatternType.stemChangingPreteriteSpanish.contains(self) {return true}
//        return false
//    }
//    
//    public func isIrregularPreteriteSpanish() -> Bool {
//        if SpecialPatternType.irregPreteriteSpanish.contains(self) {return true}
//        return false
//    }
//    
//}
//
//public struct SpecialPattern : Codable{
//    public var id = 0
//    public var tenseStr: String
//    public var patternStr : String
//    
//    public init(){
//        tenseStr = "none"
//        patternStr = "none"
//    }
//    
//    public init(tenseStr: String, patternStr: String){
//        self.tenseStr = tenseStr
//        self.patternStr = patternStr
//    }
//}
//
//public struct SpecialPatternStruct {
//    public var tense : Tense
//    public var pattern : SpecialPatternType
//    
//    public init(){
//        tense = .infinitive
//        pattern = .none
//    }
//    
//    public init(tense: Tense, spt: SpecialPatternType){
//        self.tense = tense
//        self.pattern = spt
//    }
//    
//    public func isSameAs(spt: SpecialPatternStruct)->Bool{
//        if spt.tense == self.tense && spt.pattern == self.pattern { return true}
//        return false
//    }
//}
//
//extension RomanceVerbModel {
//    mutating func appendSpecialPattern(tense: Tense, pattern: SpecialPatternType){
//        let tenseStr = tense.rawValue
//        let patternStr = pattern.rawValue
//        let specialPattern = SpecialPattern(tenseStr: tenseStr, patternStr: patternStr)
//        specialPatternList.append(specialPattern)
//    }
//    
//    mutating func parseSpecialPatterns()->[SpecialPatternStruct]{
//        var specialPatternStructList = [SpecialPatternStruct]()
//        
//        for spt in specialPatternList {
//            specialPatternStructList.append(parseSpecialPattern(tenseStr: spt.tenseStr, patternStr: spt.patternStr))
//        }
//        
//        return specialPatternStructList
//    }
//    
//    mutating func parseSpecialPattern(tenseStr: String, patternStr: String)->SpecialPatternStruct {
//        var spt = SpecialPatternStruct()
//        
//        switch tenseStr {
//        case "Present" : spt.tense = Tense.present
//        case "Preterite" : spt.tense = .preterite
//        case "Future" : spt.tense = .future
//        case "Pres Subj" : spt.tense = .presentSubjunctive
//        default: spt.tense = .infinitive
//        }
//        
//        switch patternStr {
//        case "e to i" : spt.pattern = .e2i
//        case "e to ie" : spt.pattern = .e2ie
//       
//        case "e to y" : spt.pattern = .e2y //creer  preterite ... also e to í
//        case "e to ye" : spt.pattern = .e2ye //erguir
//        case "i to í" : spt.pattern = .i2í  //prohibir / enraizar /guiar
//    //    case i2y = "i to y"  //influir
//        case "o to u" : spt.pattern = .o2u
//        case "o to ue" : spt.pattern = .o2ue
//        case "o to hue" : spt.pattern = .o2hue
//        case "u to ue" : spt.pattern = .u2ue
//        case "u to ú" : spt.pattern = .u2ú  //reunir
//        case "u to uy"  : spt.pattern = .u2uy //influir
//        case "z to zc" : spt.pattern = .c2zc
//        case "z to c" : spt.pattern = .z2c //enraizar
//        
//        //Spanish and French
//        case "e to íe"  : spt.pattern = .e2íe  //reír
//        
//        //French
//        case "ev to o"  : spt.pattern = .ev2o //devoir
//        case "é to è" : spt.pattern = .é2è
//        case "e to è": spt.pattern = .e2è
//        case "é to ie": spt.pattern = .é2ie //acquérir
//        case "o to e" : spt.pattern = .o2e //mourir
//        case "l to ll" : spt.pattern = .l2ll
//        case "t to tt" : spt.pattern = .t2tt
//        case "y to i" : spt.pattern  = .y2i
//        
//        case "a to aig"  : spt.pattern = .a2aig //caer, raer, traer
//        case "cab to quep"   : spt.pattern = .cab2quep //caber
//        case "c to g"  : spt.pattern = .c2g //hacer - hago, satisfacer
//        case "c to qu"  : spt.pattern = .c2qu //hincar, sacar, trocar
//        case "c to z"  : spt.pattern = .c2z //convencir, mecer, zurcir
//        case "c to zc"  : spt.pattern = .c2zc //lucir
//        case "c to zg"  : spt.pattern = .c2zg //yacer
//        case "ec to ig"  : spt.pattern = .ec2ig //predecir, decir
//        case "g to gu"   : spt.pattern = .g2gu //colgar, jugar, regar
//        case "gu to g"   : spt.pattern = .gu2g //distinguir, erguir, xxxguir, seguir
//        case "g to j"   : spt.pattern = .g2j //coger, dirigir, elegir
//        case "gu to gü"   : spt.pattern = .gu2gü //averiguar
//        case "l to lg"   : spt.pattern = .l2lg //salir, valer
//        case "o to oig"    : spt.pattern = .o2oig //roer
//        case "n to ng"   : spt.pattern = .n2ng //tener, poner, venir
//        case "qu to c"   : spt.pattern = .qu2c //delinquir
//        case "s to sg"   : spt.pattern = .s2sg //asir
//        case "z to c"   : spt.pattern = .z2c //enraizar, empezar
//        case "i pret"   : spt.pattern = .i_pret //hacer, querer, venir
//        case "uv pret"   : spt.pattern = .uv_pret //andar, estar, tener
//        case "u pret"   : spt.pattern = .u_pret //caber, haber, poder, poner, saber
//        case "j pret"   : spt.pattern = .j_pret //conducir, decir, traducir, traer
//        
//            
//        case "none": spt.pattern = .none
//        default: spt.pattern = .none
//        }
//        return spt
//    }
//    
//}
