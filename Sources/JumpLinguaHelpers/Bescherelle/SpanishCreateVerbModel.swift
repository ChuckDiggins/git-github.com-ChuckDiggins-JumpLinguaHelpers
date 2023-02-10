//
//  VerbModel.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation


public func createSpanishVerbModels()->[RomanceVerbModel]{
    
    //setVerbModelList(verbModelList: verbModels)
    
    var verbModels = [RomanceVerbModel]()
    
    //this first because it's standalone
    
    var thisVerb : RomanceVerbModel
    
    var idNum = 1
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "ser")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ser", to: "ser")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "ser", to: "ser")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "ser", to: "sé")
    thisVerb.appendSuffix(suffix: "ser")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfect, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .irreg)

    verbModels.append(thisVerb)
    
    idNum = 2
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "estar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "estar", to: "estar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "estar", to: "estar")  //not used
    thisVerb.appendSuffix(suffix: "estar")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .a2oy)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .uv)

    verbModels.append(thisVerb)
    
    idNum = 3
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "haber")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "haber", to: "haber")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "haber", to: "haber")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "haber", to: "habr")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .a2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .a2u)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "haber")
    verbModels.append(thisVerb)
    
    idNum = 46
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "ir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ir", to: "ir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "ido", to: "yendo")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "ir", to: "ve")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ir", to: "yendo")  //from is past participle, to is gerund
    thisVerb.appendSpecialPattern(tense: .present, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfect, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .irreg)
    thisVerb.appendSuffix(suffix: "ir")
    verbModels.append(thisVerb)

    idNum = 4
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "tener")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "en", to: "eng")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "en", to: "uv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "tener", to: "ten")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
//                           tense: ExceptionTense.PRESENTSUBJ,
//                           person: ExceptionPerson.P1,
//                           from: "er", to: "gamos")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
//                           tense: ExceptionTense.PRESENTSUBJ,
//                           person: ExceptionPerson.P2,
//                           from: "er", to: "gáis")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "tener", to: "tendr")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .n2ng)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .uv)
    
    thisVerb.appendSuffix(suffix: "tener")
    verbModels.append(thisVerb)
    
 
    
    idNum = 27
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "dar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "dar", to: "dar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "dar", to: "dar")  //not used
    thisVerb.appendSpecialPattern(tense: .present, pattern: .a2oy)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .a2é)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2i)
    thisVerb.appendSuffix(suffix: "dar")
    verbModels.append(thisVerb)
    
    
    idNum = 51
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "oír")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "oir", to: "oir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "oir", to: "oído")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2oig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .í2y)
    thisVerb.appendSuffix(suffix: "oír")
    verbModels.append(thisVerb)

    idNum = 52
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "oler")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "hue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "oler", to: "oler")  //not used
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2hue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2hue)
    thisVerb.appendSuffix(suffix: "oler")
    verbModels.append(thisVerb)
    
    idNum = 28
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "decir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "ec", to: "ig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                           from: "ec", to: "ij")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S1toP3All,
                           from: "decir", to: "dir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "decir", to: "di")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "decir", to: "decir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "decir", to: "dicho")  //not used
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .ec2ig)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .ec2ig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "decir")
    verbModels.append(thisVerb)
    
    idNum = 56
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pensar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSuffix(suffix: "ensar")
    //thisVerb.appendSuffix(suffix: "ebar")
    //thisVerb.appendSuffix(suffix: "ecar")
    //thisVerb.appendSuffix(suffix: "edar")  //depredar
    //thisVerb.appendSuffix(suffix: "efar")
    
    //thisVerb.appendSuffix(suffix: "esar")  //last vowel in stem is e - special rule??
    thisVerb.appendSuffix(suffix: "evar")
    thisVerb.appendSuffix(suffix: "ebrar")
    thisVerb.appendSuffix(suffix: "eldar")
    thisVerb.appendSuffix(suffix: "endar")
    thisVerb.appendSuffix(suffix: "entar")
    thisVerb.appendWord(word: "entar")
    thisVerb.appendSuffix(suffix: "erbar")
    thisVerb.appendSuffix(suffix: "ernar")
    thisVerb.appendSuffix(suffix: "erdar")
    thisVerb.appendSuffix(suffix: "ednar")
    thisVerb.appendSuffix(suffix: "helar")
    thisVerb.appendSuffix(suffix: "berrar")
    thisVerb.appendSuffix(suffix: "cerrar")
    thisVerb.appendSuffix(suffix: "derrar")
    thisVerb.appendSuffix(suffix: "ferrar")
    thisVerb.appendSuffix(suffix: "gerrar")
    thisVerb.appendSuffix(suffix: "herrar")
    thisVerb.appendSuffix(suffix: "jerrar")
    thisVerb.appendSuffix(suffix: "lerrar")
    thisVerb.appendSuffix(suffix: "merrar")
    thisVerb.appendSuffix(suffix: "nerrar")
    thisVerb.appendSuffix(suffix: "perrar")
    thisVerb.appendSuffix(suffix: "rerrar")
    thisVerb.appendSuffix(suffix: "serrar")
    thisVerb.appendSuffix(suffix: "terrar")
    thisVerb.appendSuffix(suffix: "ertar")
    thisVerb.appendSuffix(suffix: "emblar")
    thisVerb.appendSuffix(suffix: "embrar")
    thisVerb.appendSuffix(suffix: "estrar")
    thisVerb.appendExcludeSuffix(suffix: "ebrar")
    thisVerb.appendExcludeSuffix(suffix: "ejar")  //desaconsejar
    thisVerb.appendExcludeSuffix(suffix: "aberrar")
    
    verbModels.append(thisVerb)
    
    idNum = 9
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "actuar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "u", to: "ú")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .u2ú)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .u2ú)
    thisVerb.appendSuffix(suffix: "uar")
    thisVerb.appendExcludeSuffix(suffix: "guar")
    verbModels.append(thisVerb)
    
    idNum = 10
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "adquirir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "ie")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2ie)
    thisVerb.appendSuffix(suffix: "uirir")
    verbModels.append(thisVerb)
    
    idNum = 11
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "ahincar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "í")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "c", to: "qu")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2qu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2qu)
    thisVerb.appendSuffix(suffix: "hincar")
    verbModels.append(thisVerb)
    
//    idNum = 121
//    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "hilar")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
//                           tense: ExceptionTense.PRESENT,
//                           person: ExceptionPerson.S1S2S3P3,
//                           from: "hilar", to: "hilar")
//    thisVerb.appendSuffix(suffix: "hilar")
//    verbModels.append(thisVerb)

    idNum = 12
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "airar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "í")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2í)
    thisVerb.appendSuffix(suffix: "airar")
    thisVerb.appendSuffix(suffix: "ainar")
    thisVerb.appendSuffix(suffix: "einar")
    thisVerb.appendSuffix(suffix: "hijar")
    thisVerb.appendSuffix(suffix: "ahilar")
    thisVerb.appendSuffix(suffix: "ohilar")
    thisVerb.appendSuffix(suffix: "rehilar")
    thisVerb.appendSuffix(suffix: "hinar")
    thisVerb.appendSuffix(suffix: "hitar")
    thisVerb.appendSuffix(suffix: "islar")
    thisVerb.appendSuffix(suffix: "irmar")
    thisVerb.appendSuffix(suffix: "illar")
    //print("airar has consistent verb ending \(thisVerb.getConsistentVerbEnding())")
    verbModels.append(thisVerb)
    
    
    
    idNum = 14
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "asir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "s", to: "sg")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .s2sg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .s2sg)
    thisVerb.appendSuffix(suffix: "asir")
    verbModels.append(thisVerb)
    
    idNum = 15
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "aullar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "u", to: "ú")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .u2ú)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .u2ú)
    thisVerb.appendSuffix(suffix: "ullar")
    thisVerb.appendSuffix(suffix: "aular")
    thisVerb.appendSuffix(suffix: "cuar")
    thisVerb.appendSuffix(suffix: "huchar")
    thisVerb.appendSuffix(suffix: "humar")
    thisVerb.appendSuffix(suffix: "husar")  //13.2.4
    thisVerb.appendSuffix(suffix: "aupar")
    thisVerb.appendSuffix(suffix: "aunar")
    verbModels.append(thisVerb)
    
    idNum = 16
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "avergonzar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "üe")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "z", to: "c")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2üe)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2üe)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .z2c)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .z2c)
    
    thisVerb.appendSuffix(suffix: "gonzar")
    verbModels.append(thisVerb)
    
    idNum = 17
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "averiguar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "gu", to: "gü")
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .gu2gü)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .gu2gü)
    thisVerb.appendSuffix(suffix: "guar")
    verbModels.append(thisVerb)
    
    idNum = 18
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "bruñir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                            tense: ExceptionTense.GERUND,
                            person: ExceptionPerson.S3,
                            from: "ir", to: "endo")  //skips the -iendo and -yendo
    thisVerb.appendSuffix(suffix: "ñir")
    thisVerb.appendSuffix(suffix: "llir")
    thisVerb.appendExcludeSuffix(suffix: "eñir")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ñi2ñ)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ñi2ñ)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ñi2ñ)
    verbModels.append(thisVerb)
    
    
    idNum = 19
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "caber")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "cab", to: "quep")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "ab", to: "up")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S1toP3All,
                           from: "caber", to: "cabr")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .cab2quep)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .cab2quep)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ab2up)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ab2up)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ab2up)
    
    thisVerb.appendSuffix(suffix: "caber")
    verbModels.append(thisVerb)
    
    idNum = 20
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "caer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "a", to: "aig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM3,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "ca", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "er", to: "ído")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
//                           tense: ExceptionTense.GERUND,
//                           person: ExceptionPerson.S2,
//                           from: "er", to: "yendo")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2í)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2ay)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .a2ay)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .a2ay)
    thisVerb.appendSuffix(suffix: "caer")
    verbModels.append(thisVerb)
    
    
    idNum = 21
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "cazar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "z", to: "c")
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .z2c)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .z2c)
    thisVerb.appendSuffix(suffix: "zar")
    thisVerb.appendExcludeSuffix(suffix: "mozar")
    thisVerb.appendExcludeSuffix(suffix: "onzar")
    thisVerb.appendExcludeSuffix(suffix: "orzar")
    thisVerb.appendExcludeSuffix(suffix: "pezar")  //empezar, tropezar
    thisVerb.appendExcludeSuffix(suffix: "enzar")  //enlenzar
    thisVerb.appendExcludeSuffix(suffix: "aizar")
    verbModels.append(thisVerb)
    
    idNum = 22
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "cocer")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "z")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "o", to: "o")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2z)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2z)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSuffix(suffix: "cocer")
    thisVerb.appendSuffix(suffix: "socer")
    thisVerb.appendSuffix(suffix: "torcer")
    verbModels.append(thisVerb)
    
    idNum = 23
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "coger")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "g", to: "j")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .g2j)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2j)
    thisVerb.appendSuffix(suffix: "oger")
    thisVerb.appendSuffix(suffix: "eger")
    thisVerb.appendSuffix(suffix: "erger")
    verbModels.append(thisVerb)
    
    idNum = 24
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "colgar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "g", to: "gu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "g", to: "gu")
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2gu)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .g2gu)
    thisVerb.appendSuffix(suffix: "olgar")
    thisVerb.appendSuffix(suffix: "rogar")
    thisVerb.appendSuffix(suffix: "ongar")
    verbModels.append(thisVerb)
    
    //merged with paracer
    
    idNum = 25
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "conocer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zc")   //ortho should propogate to all Present subj
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zc)
    thisVerb.appendSuffix(suffix: "conocer")
    verbModels.append(thisVerb)
    
    idNum = 26
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "creer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM3,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "cre", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "er", to: "ído")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "er", to: "yendo")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2í)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2y)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2y)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2y)
    thisVerb.appendSuffix(suffix: "reer")
    thisVerb.appendSuffix(suffix: "seer")
    thisVerb.appendSuffix(suffix: "veer")
    thisVerb.appendSuffix(suffix: "leer")
    verbModels.append(thisVerb)

    
   
    idNum = 29
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "defender")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSuffix(suffix: "ender")
    thisVerb.appendSuffix(suffix: "erner")
    thisVerb.appendSuffix(suffix: "heder")
    thisVerb.appendSuffix(suffix: "erder")
    thisVerb.appendSuffix(suffix: "erter")
    thisVerb.appendExcludeSuffix(suffix: "pretender")
    thisVerb.appendExcludeSuffix(suffix: "suspender")
    thisVerb.appendExcludeSuffix(suffix: "render")
    thisVerb.appendExcludeSuffix(suffix: "vender")
    verbModels.append(thisVerb)
  
    idNum = 30
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "delinquir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "qu", to: "c")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .qu2c)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .qu2c)
    thisVerb.appendSuffix(suffix: "linquir")
    thisVerb.appendSuffix(suffix: "quir")
    verbModels.append(thisVerb)
    
    idNum = 31
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "desosar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "hue")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2hue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2hue)
    thisVerb.appendSuffix(suffix: "sosar")
    verbModels.append(thisVerb)
  
    idNum = 32
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "dirigir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "g", to: "j")    //plus all the pres subj
    thisVerb.appendSpecialPattern(tense: .present, pattern: .g2j)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2j)
    thisVerb.appendSuffix(suffix: "igir")
    thisVerb.appendSuffix(suffix: "ingir")
    thisVerb.appendSuffix(suffix: "ergir")
    thisVerb.appendSuffix(suffix: "ulgir")
    thisVerb.appendSuffix(suffix: "ugir")
    thisVerb.appendSuffix(suffix: "ungir")
    thisVerb.appendSuffix(suffix: "urgir")
    verbModels.append(thisVerb)
  
    idNum = 33
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "discernir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSuffix(suffix: "cernir")
    thisVerb.appendSuffix(suffix: "hendir")
    verbModels.append(thisVerb)
  
    idNum = 34
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "distinguir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "gu", to: "g")    //plus all the pres subj
    thisVerb.appendSpecialPattern(tense: .present, pattern: .gu2g)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .gu2g)
    thisVerb.appendSuffix(suffix: "inguir")
    verbModels.append(thisVerb)
  
    idNum = 35
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "dormir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S3P3,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S3P3,
                           from: "o", to: "u")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .o2u)
    thisVerb.appendSuffix(suffix: "ormir")
    verbModels.append(thisVerb)
  
    idNum = 94
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "morir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S3P3,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S3P3,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S3P3,
                           from: "orir", to: "uerto")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .o2u)
    thisVerb.appendSuffix(suffix: "morir")
    verbModels.append(thisVerb)
    idNum = 36
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "elegir")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "g", to: "j")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "e", to: "i")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
//                           tense: ExceptionTense.GERUND,
//                           person: ExceptionPerson.S3P3,
//                           from: "egir", to: "igiendo")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .g2j)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2j)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    
    thisVerb.appendSuffix(suffix: "legir")
    thisVerb.appendSuffix(suffix: "regir")
    verbModels.append(thisVerb)
  
    idNum = 37
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "empezar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "z", to: "c")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "z", to: "c")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .z2c)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .z2c)
    thisVerb.appendSuffix(suffix: "ezar")
    thisVerb.appendSuffix(suffix: "enzar")
    verbModels.append(thisVerb)
    
    idNum = 38
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "encontrar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSuffix(suffix: "probar")
    thisVerb.appendSuffix(suffix: "oblar")
    thisVerb.appendSuffix(suffix: "olar")
    thisVerb.appendSuffix(suffix: "oltar")
    thisVerb.appendSuffix(suffix: "sonar")
    thisVerb.appendSuffix(suffix: "onar")
    thisVerb.appendSuffix(suffix: "oñar")
    thisVerb.appendSuffix(suffix: "ontar")
    thisVerb.appendSuffix(suffix: "ontrar")
    thisVerb.appendSuffix(suffix: "ordar")
    thisVerb.appendSuffix(suffix: "ornar")
    thisVerb.appendSuffix(suffix: "ostar")
    thisVerb.appendSuffix(suffix: "ostrar")
    thisVerb.appendSuffix(suffix: "ovar")
    thisVerb.appendExcludeSuffix(suffix: "ionar")
    thisVerb.appendExcludeSuffix(suffix: "rolar")
    thisVerb.appendExcludeSuffix(suffix: "donar")  //abandonar
    thisVerb.appendExcludeSuffix(suffix: "montar")  //montar
    
    //thisVerb.appendSuffix(suffix: "ozar")  ??
    verbModels.append(thisVerb)
    
    idNum = 39
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "enraizar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "í")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "z", to: "c")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "z", to: "c")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .z2c)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .z2c)
    thisVerb.appendSuffix(suffix: "aizar")
    thisVerb.appendSuffix(suffix: "eizar")
    verbModels.append(thisVerb)
    
    idNum = 40
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "erguir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ye")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "gu", to: "g")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "e", to: "i")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ye)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ye)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .gu2g)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .gu2g)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "erguir")
    verbModels.append(thisVerb)
    
    
    idNum = 41
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "errar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ye")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ye)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ye)
    thisVerb.appendSuffix(suffix: "errar")
    thisVerb.appendSuffix(suffix: "aberrar")
    verbModels.append(thisVerb)
    
    idNum = 42
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "forzar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "z", to: "c")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .z2c)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .z2c)
    thisVerb.appendSuffix(suffix: "orzar")
    verbModels.append(thisVerb)
    
    idNum = 43
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "guiar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "í")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2í)
    thisVerb.appendSuffix(suffix: "uiar")
    thisVerb.appendSuffix(suffix: "liar")
    thisVerb.appendSuffix(suffix: "chiar")
    thisVerb.appendSuffix(suffix: "piar")
    thisVerb.appendSuffix(suffix: "stiar")
    thisVerb.appendSuffix(suffix: "spiar")
    thisVerb.appendSuffix(suffix: "ipiar")
    thisVerb.appendSuffix(suffix: "fiar")
    thisVerb.appendSuffix(suffix: "viar")
    thisVerb.appendSuffix(suffix: "riar")
    thisVerb.appendSuffix(suffix: "siar")
    thisVerb.appendSuffix(suffix: "ociar")
    thisVerb.appendSuffix(suffix: "squiar")  //esquiar, but not acequiar
    thisVerb.appendExcludeSuffix(suffix: "mpiar")
    thisVerb.appendExcludeSuffix(suffix: "diar")
    verbModels.append(thisVerb)
    
    idNum = 44
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "hacer")   //rehacer, deshacer
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "hacer", to: "hacer")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
//                           tense: ExceptionTense.PRESENT,  //not used
//                           person: ExceptionPerson.S3,   //not used
//                           from: "hacer", to: "hacer")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "hacer", to: "har")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1,
                           from: "acer", to: "echo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "hacer", to: "haz")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2g)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "hacer")
    verbModels.append(thisVerb)

    
    idNum = 45
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "influir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "u", to: "uy")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "u", to: "uy")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "u", to: "uy")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "u", to: "uy")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
//                           tense: ExceptionTense.GERUND,
//                           person: ExceptionPerson.S2,
//                           from: "u", to: "uy")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .u2uy)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .u2uy)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .u2uy)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .u2uy)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .u2uy)
    thisVerb.appendSuffix(suffix: "uir")
    thisVerb.appendSuffix(suffix: "üir")
    thisVerb.appendExcludeSuffix(suffix: "guir")
    thisVerb.appendExcludeSuffix(suffix: "quir")
    thisVerb.appendExcludeSuffix(suffix: "seguir")
    verbModels.append(thisVerb)
    
    
    
    idNum = 47
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "jugar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "u", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "g", to: "gu")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .u2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .u2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .g2gu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2gu)
    thisVerb.appendSuffix(suffix: "jugar")
    thisVerb.appendSuffix(suffix: "ugar")
    thisVerb.appendExcludeSuffix(suffix: "conjugar")
    verbModels.append(thisVerb)
    

    idNum = 48
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "lucir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zc")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zc)
    thisVerb.appendSuffix(suffix: "lucir")
    verbModels.append(thisVerb)
    
    idNum = 49
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "mecer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "z")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2z)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2z)
    thisVerb.appendSuffix(suffix: "mecer")
    thisVerb.appendSuffix(suffix: "encer")
    thisVerb.appendSuffix(suffix: "ercer")
    verbModels.append(thisVerb)
    
    idNum = 50
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "mover")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,  //turns off the gerund stem change
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "o")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSuffix(suffix: "over")
    thisVerb.appendSuffix(suffix: "oler")
    thisVerb.appendSuffix(suffix: "order")
    thisVerb.appendExcludeSuffix(suffix: "soler")
    verbModels.append(thisVerb)
    
    idNum = 53
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pagar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "g", to: "gu")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .g2gu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2gu)
    thisVerb.appendExcludeSuffix(suffix: "ongar")
    thisVerb.appendExcludeSuffix(suffix: "olgar")
    thisVerb.appendExcludeSuffix(suffix: "regar")
    thisVerb.appendExcludeSuffix(suffix: "jugar")
    thisVerb.appendExcludeSuffix(suffix: "plegar")
    thisVerb.appendExcludeSuffix(suffix: "negar")
    thisVerb.appendExcludeSuffix(suffix: "segar")
    thisVerb.appendExcludeSuffix(suffix: "cegar")
    thisVerb.appendSuffix(suffix: "gar")
    thisVerb.appendWord(word: "conjugar")
    
    verbModels.append(thisVerb)
    
    idNum = 54
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "parecer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zc")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zc)
    thisVerb.appendExcludeSuffix(suffix: "ercer")
    thisVerb.appendExcludeSuffix(suffix: "mecer")
    thisVerb.appendExcludeSuffix(suffix: "encer")
    thisVerb.appendExcludeSuffix(suffix: "facer")
    thisVerb.appendExcludeSuffix(suffix: "lacer")
    thisVerb.appendExcludeSuffix(suffix: "yacer")
    thisVerb.appendSuffix(suffix: "ecer")
    thisVerb.appendSuffix(suffix: "acer")
    thisVerb.appendSuffix(suffix: "ocer")
    verbModels.append(thisVerb)
    
    idNum = 55
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pedir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "e", to: "i")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "edir")
    thisVerb.appendSuffix(suffix: "ebir")
    thisVerb.appendSuffix(suffix: "ervir")  //servir
    thisVerb.appendSuffix(suffix: "estir")
    thisVerb.appendSuffix(suffix: "emir")
    thisVerb.appendSuffix(suffix: "endir")
    thisVerb.appendSuffix(suffix: "etir")
    thisVerb.appendSuffix(suffix: "chir")
    thisVerb.appendExcludeSuffix(suffix: "hervir")
    verbModels.append(thisVerb)
    
    
    
    idNum = 57
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "placer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zc")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zc)
    thisVerb.appendSuffix(suffix: "acer")
    thisVerb.appendExcludeSuffix(suffix: "isfacer") //satisfacer
    thisVerb.appendExcludeSuffix(suffix: "yacer")
    verbModels.append(thisVerb)


    idNum = 58
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "poder")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "poder", to: "podr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S3P3,
                           from: "o", to: "u")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "poder")
    thisVerb.appendSuffix(suffix: "repoder")
    verbModels.append(thisVerb)
    
    
    idNum = 59
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "podrir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "o", to: "u")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2u)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2u)
    thisVerb.appendSuffix(suffix: "podrir")
    verbModels.append(thisVerb)
    

    idNum = 60
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "poner")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "n", to: "ng")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "on", to: "us")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "poder", to: "pondr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "oner", to: "uesto")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "poner", to: "pon")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .n2ng)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .n2ng)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2us)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .o2us)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .o2us)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "poner")
    verbModels.append(thisVerb)
    
    idNum = 61
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "predecir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "ec", to: "ig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
 
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "ec", to: "ij")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P3,
                           from: "ieron", to: "eron")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,  //not used
                           person: ExceptionPerson.S3P3,   //not used
                           from: "e", to: "i")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "ecir", to: "icho")  //not used
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ec2ij)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .ec2ig)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .ec2ig)
    thisVerb.appendSuffix(suffix: "decir")
    verbModels.append(thisVerb)
    
    idNum = 62
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "producir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zc")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "c", to: "j")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P3,
                           from: "ieron", to: "eron")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zc)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .c2j)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .c2j)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .c2j)
    thisVerb.appendSuffix(suffix: "ducir")
    verbModels.append(thisVerb)
   
    idNum = 63
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "prohibir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "i", to: "í")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .i2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .i2í)
    thisVerb.appendSuffix(suffix: "hibir")
    verbModels.append(thisVerb)
   
    idNum = 64
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "querer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "er", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "querer", to: "querr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .er2is)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .er2is)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .er2is)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "querer")
    verbModels.append(thisVerb)

    idNum = 65
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "raer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "a", to: "aig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM3,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "ra", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "er", to: "yendo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "er", to: "ído")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2í)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2ay)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .a2ay)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .a2ay)
    thisVerb.appendSuffix(suffix: "raer")
    thisVerb.appendExcludeSuffix(suffix: "traer")
    verbModels.append(thisVerb)

    idNum = 66
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "regar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "g", to: "gu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "e", to: "e")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .g2gu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .g2gu)
    thisVerb.appendSuffix(suffix: "regar")
    thisVerb.appendSuffix(suffix: "plegar")
    thisVerb.appendSuffix(suffix: "cegar")
    thisVerb.appendSuffix(suffix: "negar")
    thisVerb.appendSuffix(suffix: "segar")
    verbModels.append(thisVerb)
    
    idNum = 67
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "reír")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "reir", to: "reir")

    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "eír", to: "iendo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "ír", to: "ído")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2í)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2í)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "reír")
    thisVerb.appendSuffix(suffix: "leír")
    verbModels.append(thisVerb)

    idNum = 68
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "reñir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "e", to: "i")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
//                           tense: ExceptionTense.GERUND,
//                           person: ExceptionPerson.S2,
//                           from: "ir", to: "endo")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "eñir")
    verbModels.append(thisVerb)
    
    
    idNum = 69
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "reunir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "u", to: "ú")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .u2ú)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .u2ú)
    thisVerb.appendSuffix(suffix: "reunir")
    verbModels.append(thisVerb)
    
    idNum = 70
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "roer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "o", to: "oig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM3,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S2,
                           from: "re", to: "re")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "er", to: "yendo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "oer", to: "ído")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2oig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2oí)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .o2oy)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .o2oy)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .o2oy)
    
    thisVerb.appendSuffix(suffix: "roer")
    verbModels.append(thisVerb)
    
    idNum = 71
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "saber")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "saber", to: "saber")
    thisVerb.appendSuffix(suffix: "saber")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ab2up)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ab2up)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ab2up)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    verbModels.append(thisVerb)
    
    idNum = 72
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "sacar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "c", to: "qu")  //this will change all the present subjunctive
    thisVerb.appendSuffix(suffix: "car")
    thisVerb.appendExcludeSuffix(suffix: "hincar")
    thisVerb.appendExcludeSuffix(suffix: "orcar")
    thisVerb.appendExcludeSuffix(suffix: "olcar")
    thisVerb.appendExcludeSuffix(suffix: "trocar")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .c2qu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2qu)
    verbModels.append(thisVerb)
    
    idNum = 73
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "salir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "l", to: "lg")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S2,
                           from: "salir", to: "saldr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "salir", to: "sal")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .l2lg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .l2lg)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "salir")
    verbModels.append(thisVerb)
    
    idNum = 74
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "satisfacer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "g")  //
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S3,
                           from: "ac", to: "zo")  //this will chthis will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S2,
                           from: "satisfacer", to: "satisfar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "a", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "acer", to: "echo")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2g)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2g)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .c2z)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .a2i)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "isfacer")
    verbModels.append(thisVerb)
    
    idNum = 75
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "seguir")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "gu", to: "g")  //this will change all the present subjunct
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S3P3,
                           from: "e", to: "i")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .gu2g)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .gu2g)
    thisVerb.appendSuffix(suffix: "eguir")
    verbModels.append(thisVerb)
    
//    idNum = 751
//    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "xxxguir")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
//                           tense: ExceptionTense.PRESENT,
//                           person: ExceptionPerson.S1,
//                           from: "gu", to: "g")  //this will change all the present subjunctive
//    thisVerb.appendSpecialPattern(tense: .present, pattern: .gu2g)
//    thisVerb.appendSuffix(suffix: "guir")
//    verbModels.append(thisVerb)
//
    idNum = 76
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "sentir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3P3,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S3P3,
                           from: "e", to: "i")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "erir")
    thisVerb.appendSuffix(suffix: "ertir")
    thisVerb.appendSuffix(suffix: "entir")
    thisVerb.appendSuffix(suffix: "ervir")
    thisVerb.appendSuffix(suffix: "envir")
    thisVerb.appendExcludeSuffix(suffix: "terir")   //aterir
    verbModels.append(thisVerb)
    
    
    idNum = 77
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "soler")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.P1,
                           from: "o", to: "o")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSuffix(suffix: "soler")
    verbModels.append(thisVerb)
    
    
    idNum = 78
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "tañer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S3P3,
                           from: "", to: "")
    thisVerb.appendSuffix(suffix: "tañer")
    thisVerb.appendSuffix(suffix: "peller")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .ñi2ñ)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .ñi2ñ)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .ñi2ñ)
    verbModels.append(thisVerb)
    
    idNum = 79
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "traer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "traer", to: "traer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "a", to: "aig")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "a", to: "aj")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
//                           tense: ExceptionTense.PRETERITE,
//                           person: ExceptionPerson.P3,
//                           from: "ieron", to: "eron")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S2,
                           from: "er", to: "yendo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S2,
                           from: "er", to: "ído")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .a2aig)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .j)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .j)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .j)
    thisVerb.appendSuffix(suffix: "traer")
    verbModels.append(thisVerb)
   
    idNum = 80
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "trocar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "c", to: "qu")  //this will change all the present subjunctive
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .c2qu)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2qu)
    thisVerb.appendSuffix(suffix: "ocar")
    thisVerb.appendSuffix(suffix: "orcar")
    thisVerb.appendSuffix(suffix: "olcar")
    thisVerb.appendSuffix(suffix: "oscar")
    thisVerb.appendSuffix(suffix: "iscar")
    thisVerb.appendExcludeSuffix(suffix: "trocar")   //aterir
    thisVerb.appendExcludeSuffix(suffix: "hincar")   //aterir
    verbModels.append(thisVerb)
    
    idNum = 81
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "valer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "l", to: "lg")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S2,
                           from: "valer", to: "valdr")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .l2lg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .l2lg)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "valer")
    verbModels.append(thisVerb)
    
    idNum = 82
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "venir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "en", to: "eng")  //this will change all the present subjunctive
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1,
                           from: "ir", to: "ngamos")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P2,
                           from: "ir", to: "ngáis")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.CONDITIONAL,
                           person: ExceptionPerson.S2,
                           from: "venir", to: "vendr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.IMPERATIVE,
                           person: ExceptionPerson.S2,
                           from: "venir", to: "ven")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .n2ng)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .n2ng)
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .shortInf)
    thisVerb.appendSpecialPattern(tense: .conditional, pattern: .shortInf)
    thisVerb.appendSuffix(suffix: "enir")
    verbModels.append(thisVerb)
    
    
    
    idNum = 84
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "volver")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "ue")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "olver", to: "uelto")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,  //turns off the stem change for the gerund
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "o", to: "o")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2ue)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2ue)
    thisVerb.appendSuffix(suffix: "olver")
    verbModels.append(thisVerb)
    
    idNum = 83
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "ver")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ver", to: "ver")
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,  //entrever, contraver
//                           tense: ExceptionTense.PRESENT,  //not used        //however, atreverse is not a "ver" model verb
//                           person: ExceptionPerson.S3,   //not used
//                           from: "ver", to: "ver")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1,
                           from: "er", to: "isto")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .irreg)
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .e2i)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .e2i)
    thisVerb.appendSuffix(suffix: "ver")
    thisVerb.appendSuffix(suffix: "rever")
    thisVerb.appendExcludeSuffix(suffix: "atrever")
    
    verbModels.append(thisVerb)
    
    idNum = 85
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "yacer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "zg")  //this will change all the present subjunctive
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2zg)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2zg)
    thisVerb.appendSuffix(suffix: "yacer")
    verbModels.append(thisVerb)
    
    idNum = 86
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "zurcir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.ORTHO,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "c", to: "z")  //this will change all the present subjunctive
    thisVerb.appendSpecialPattern(tense: .present, pattern: .c2z)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .c2z)
    thisVerb.appendSuffix(suffix: "cir")
    //thisVerb.appendSuffix(suffix: "ncir")
    verbModels.append(thisVerb)
    
    idNum = 90
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pudrir")
    thisVerb.appendSuffix(suffix: "pudrir")
    verbModels.append(thisVerb)
    
    
    idNum = 91
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "abrir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                             tense: ExceptionTense.PASTPART,
                             person: ExceptionPerson.S1,
                             from: "rir", to: "ierto")  //this will change all the present subjunctive
    thisVerb.appendSuffix(suffix: "brir")
    verbModels.append(thisVerb)
        
    idNum = 92
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "escribir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                             tense: ExceptionTense.PASTPART,
                             person: ExceptionPerson.S1,
                             from: "bir", to: "to")  //this will change all the present subjunctive
    thisVerb.appendSuffix(suffix: "scribir")
    verbModels.append(thisVerb)
        
    idNum = 93
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "romper")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                             tense: ExceptionTense.PASTPART,
                             person: ExceptionPerson.S1,
                             from: "omper", to: "oto")  //this will change all the present subjunctive
    thisVerb.appendSuffix(suffix: "romper")
    verbModels.append(thisVerb)
        
    idNum = 13
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "andar")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.PRETSTEM,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "d", to: "duv")
    thisVerb.appendSpecialPattern(tense: .preterite, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveRA, pattern: .uv)
    thisVerb.appendSpecialPattern(tense: .imperfectSubjunctiveSE, pattern: .uv)
    thisVerb.appendSuffix(suffix: "andar")
    thisVerb.appendWord(word: "desandar")
    thisVerb.appendExcludeSuffix(suffix: "bandar")
    thisVerb.appendExcludeSuffix(suffix: "candar")
    thisVerb.appendExcludeSuffix(suffix: "dandar")
    thisVerb.appendExcludeSuffix(suffix: "fandar")
    thisVerb.appendExcludeSuffix(suffix: "gandar")
    thisVerb.appendExcludeSuffix(suffix: "handar")
    thisVerb.appendExcludeSuffix(suffix: "landar")
    thisVerb.appendExcludeSuffix(suffix: "mandar")
    thisVerb.appendExcludeSuffix(suffix: "nandar")
    thisVerb.appendExcludeSuffix(suffix: "pandar")
    thisVerb.appendExcludeSuffix(suffix: "randar")
    thisVerb.appendExcludeSuffix(suffix: "sandar")
    thisVerb.appendExcludeSuffix(suffix: "tandar")
    thisVerb.appendExcludeSuffix(suffix: "vandar")
    thisVerb.appendExcludeSuffix(suffix: "zandar") 
    verbModels.append(thisVerb)
    
    idNum = 5
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "regularAR")
    thisVerb.appendSuffix(suffix: "ar")
    thisVerb.appendWord(word: "regularAR")
    verbModels.append(thisVerb)
    
    idNum = 6
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "regularER")
    thisVerb.appendSuffix(suffix: "er")
    thisVerb.appendWord(word: "regularER")
    verbModels.append(thisVerb)
    
    idNum = 7
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "regularIR")
    thisVerb.appendSuffix(suffix: "ir")
    thisVerb.appendWord(word: "regularIR")
    //thisVerb.appendSuffix(suffix: "vivir")
    verbModels.append(thisVerb)
    
    
    return verbModels
}


func parseVerbModels(verbModels: [RomanceVerbModel]){
    for vm in verbModels {
        let modelVerb = vm.modelVerb
        let exceptionCount = vm.exceptionList.count
        print("model verb \(vm.id). \(modelVerb) has exceptionCount = \(exceptionCount)")
    }
}

func testVerbsAgainstVerbModels(verbModels: [RomanceVerbModel]){
    var verbWordList = [String]()
    
    verbWordList.append("enraizar")
    verbWordList.append("mestruar")
    verbWordList.append("averiguar")
    verbWordList.append("adecuar")
    verbWordList.append("reforcer")
    verbWordList.append("inquirir")
    verbWordList.append("xxxquirir")
    verbWordList.append("enguillir")
    verbWordList.append("chuckar")
    verbWordList.append("chuckahincar")
    verbWordList.append("ahijar")
    verbWordList.append("redar")
    verbWordList.append("examinar")
    verbWordList.append("rehilar")
    verbWordList.append("forzar")
    verbWordList.append("empezar")
    verbWordList.append("atraillar")
    verbWordList.append("undecir")
    verbWordList.append("amohinar")
    verbWordList.append("rehusar")
    verbWordList.append("leer")
    verbWordList.append("concernir")
    

    for verbWord in verbWordList {
        var modelFound = false
        for vm in verbModels {
            if vm.isModelFor(verbWord: verbWord){
                modelFound = true
               // print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                break
            }
        }
        if !modelFound {print("VerbWord \(verbWord) has no known verb model")}
    }
}
