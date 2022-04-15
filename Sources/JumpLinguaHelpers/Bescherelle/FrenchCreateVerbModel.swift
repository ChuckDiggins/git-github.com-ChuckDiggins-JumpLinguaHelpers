//
//  FrenchCreateVerbModel.swift
//  VIperSpanish 2
//
//  Created by chuckd on 5/20/21.
//

import Foundation

public func createFrenchVerbModels()->[RomanceVerbModel]{
    
//    //setVerbModelList(verbModelList: verbModels)
    
    var verbModels = [RomanceVerbModel]()
    
    //this first because it's standalone
    
    var thisVerb : RomanceVerbModel
    
    var idNum = 1
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "être")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,
                           from: "être", to: "être")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "être", to: "être")  //not used
    thisVerb.appendSuffix(suffix: "être")
    verbModels.append(thisVerb)
    
    idNum = 2
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "avoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,
                           from: "avoir", to: "avoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "avoir", to: "avoir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "avoir", to: "eu")
    thisVerb.appendSuffix(suffix: "avoir")
    verbModels.append(thisVerb)
    
    idNum = 3
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "être aimé")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.SPECIAL,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "être aimé", to: "être aimé")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STANDALONE,
                           tense: ExceptionTense.PRESENT,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "être aimé", to: "être aimé")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.GERUND,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "être aimé", to: "étant aimé")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PASTPART,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "être aimé", to: "été aimé")  //not used
    thisVerb.appendSuffix(suffix: "étant aimé")
    
    verbModels.append(thisVerb)
    
    
    idNum = 66
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "placer")
    thisVerb.appendSuffix(suffix: "placer")
    thisVerb.appendSuffix(suffix: "acer")
    thisVerb.appendSuffix(suffix: "ecer")  //Dépecer
    thisVerb.appendSuffix(suffix: "écer")  //rapiécer
    verbModels.append(thisVerb)
//    
//    print(verbModels[0])
//    print(verbModels[1])
//    print(verbModels[2])
//    print(verbModels[3])
//    
    idNum = 67
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "manger")
    thisVerb.appendSuffix(suffix: "anger")
    thisVerb.appendExcludeSuffix(suffix: "guer")
    verbModels.append(thisVerb)
    
    idNum = 68
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "peser")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "eser", to: "èser")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .e2è)
    thisVerb.appendSuffix(suffix: "eser")
    verbModels.append(thisVerb)
    
    idNum = 69
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "céder")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "éder", to: "èder")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .é2è)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .é2è)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .é2è)
    thisVerb.appendSuffix(suffix: "éder")
    
    verbModels.append(thisVerb)
    
    idNum = 70
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "jeter")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "t", to: "tt")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "t", to: "tt")
    
    //this will also do the Contional Tense
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "jeter", to: "jetter")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .t2tt)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .t2tt)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .t2tt)
    thisVerb.appendSuffix(suffix: "jeter")
    thisVerb.appendSuffix(suffix: "reter")
    thisVerb.appendSuffix(suffix: "ueter")
    thisVerb.appendSuffix(suffix: "meter")
    thisVerb.appendSuffix(suffix: "peter")
    thisVerb.appendSuffix(suffix: "leter")
    thisVerb.appendSuffix(suffix: "veter")
    thisVerb.appendExcludeSuffix(suffix: "fureter")
    verbModels.append(thisVerb)
    
    idNum = 71
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "acheter")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "eter", to: "èter")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .e2è)
    thisVerb.appendSuffix(suffix: "eter")
    verbModels.append(thisVerb)
    
    idNum = 72
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "appeler")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "l", to: "ll")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "l", to: "ll")
    
    //this will also do the Contional Tense
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "appeler", to: "appeller")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .l2ll)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .l2ll)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .t2tt)
    thisVerb.appendSuffix(suffix: "peler")
    thisVerb.appendSuffix(suffix: "peller")
    verbModels.append(thisVerb)
    
    idNum = 73
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "modeler")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "modeler", to: "modèler")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2è)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .e2è)
    thisVerb.appendSuffix(suffix: "eler")
    verbModels.append(thisVerb)

    
    idNum = 74
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "créer")
    thisVerb.appendSuffix(suffix: "éer")
    verbModels.append(thisVerb)

    idNum = 75
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "siéger")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "è")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "è")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .é2è)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .é2è)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .é2è)
    thisVerb.appendSuffix(suffix: "éger")
    verbModels.append(thisVerb)
    
    idNum = 76
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "crier")

    thisVerb.appendSuffix(suffix: "ier")
    verbModels.append(thisVerb)

    idNum = 77
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "payer")
    thisVerb.appendSuffix(suffix: "eyer")
    thisVerb.appendSuffix(suffix: "ayer")
    verbModels.append(thisVerb)

    idNum = 78
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "broyer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "oyer", to: "oier")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .y2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .y2i)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .y2i)
    thisVerb.appendSuffix(suffix: "oyer")
    thisVerb.appendExcludeSuffix(suffix: "voyer")
    verbModels.append(thisVerb)

    idNum = 79
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "essuyer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "uyer", to: "uier")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .y2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .y2i)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .y2i)
    thisVerb.appendSuffix(suffix: "uyer")
    verbModels.append(thisVerb)

    idNum = 80
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "envoyer")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "y", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "oyer", to: "err")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .y2i)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .y2i)
    thisVerb.appendSuffix(suffix: "voyer")
    verbModels.append(thisVerb)

   
    idNum = 82
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "haïr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ïr", to: "ï")
    thisVerb.appendSuffix(suffix: "haïr")
    verbModels.append(thisVerb)

    //IRREGULAR
    
    idNum = 83
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "aller")
    thisVerb.appendSuffix(suffix: "aller")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "all", to: "vais")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "all", to: "vas")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "all", to: "va")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "all", to: "vont")

    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "all", to: "aill")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "aller", to: "ir")
    thisVerb.appendSuffix(suffix: "aller")
    verbModels.append(thisVerb)

    idNum = 84
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "tenir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "e", to: "ien")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "e", to: "ien")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "en", to: "in")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P1P2,
                           from: "en", to: "în")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "e", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S3,
                           from: "e", to: "î")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "enir", to: "iendr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.GERUND,  //GERUND means all relevant tenses
                           person: ExceptionPerson.S1toP3All,
                           from: "enir", to: "iener")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ir", to: "u")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .e2ie)
    thisVerb.appendSuffix(suffix: "tenir")
    thisVerb.appendSuffix(suffix: "venir")
    verbModels.append(thisVerb)

    idNum = 85
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "acquérir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "é", to: "iè")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "ie")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "é", to: "iè")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ér", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P1P2,
                           from: "ér", to: "î")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "ér", to: "i")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S3,
                           from: "ér", to: "î")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "érir", to: "err")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.GERUND, //all relevant tenses
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "érir", to: "err")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,  //not used
                           person: ExceptionPerson.S3,   //not used
                           from: "érir", to: "is")  //not used
    thisVerb.appendSpecialPattern(tense: .present, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .e2ie)
    thisVerb.appendSpecialPattern(tense: .future, pattern: .e2ie)
    thisVerb.appendSuffix(suffix: "uérir")
    verbModels.append(thisVerb)
    
    idNum = 86
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "sentir")

    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    
    thisVerb.appendSuffix(suffix: "entir")
    thisVerb.appendSuffix(suffix: "artir")
    thisVerb.appendSuffix(suffix: "ortir")
    verbModels.append(thisVerb)
    
    idNum = 87
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "vêtir")

    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ir", to: "u")
    thisVerb.appendSuffix(suffix: "vêtir")
    verbModels.append(thisVerb)
    
    idNum = 88
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "couvrir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                           tense: ExceptionTense.PRESENT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "rir", to: "ert")
    thisVerb.appendSuffix(suffix: "ouvrir")
    thisVerb.appendSuffix(suffix: "offrir")
    thisVerb.appendSuffix(suffix: "ouffrir")
    verbModels.append(thisVerb)

    idNum = 89
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "cueillir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                           tense: ExceptionTense.PRESENT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "llir", to: "ller")
    thisVerb.appendSuffix(suffix: "cueillir")
    verbModels.append(thisVerb)

    idNum = 90
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "assaillir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    
    thisVerb.appendSuffix(suffix: "aillir")
    thisVerb.appendExcludeSuffix(suffix: "faillir")
    verbModels.append(thisVerb)

    idNum = 91
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "faillir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "faill", to: "faux")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "faill", to: "faux")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "faill", to: "faut")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used

    thisVerb.appendSuffix(suffix: "faillir")
    thisVerb.appendExcludeSuffix(suffix: "défaillir")
    verbModels.append(thisVerb)

    idNum = 92
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "bouillir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "bouill", to: "bous")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "bouill", to: "bous")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "bouill", to: "bout")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "llir", to: "llir")  //not used

    thisVerb.appendSuffix(suffix: "bouillir")
    verbModels.append(thisVerb)

    idNum = 93
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "dormir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "dorm", to: "dors")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "dorm", to: "dors")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "dorm", to: "dort")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rmir", to: "rmir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rmir", to: "rmir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rmir", to: "rmir")  //not used
    thisVerb.appendSuffix(suffix: "dormir")
    verbModels.append(thisVerb)

    idNum = 94
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "courir")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "r", to: "ru")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P1P2,
                           from: "r", to: "rû")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "r", to: "ru")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,  //overrides S3 on previous step
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S3,
                           from: "r", to: "rû")

    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rmir", to: "rmir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "ourir", to: "ourr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ir", to: "u")
    thisVerb.appendSuffix(suffix: "courir")
    verbModels.append(thisVerb)

    idNum = 95
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "mourir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "r", to: "ru")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P1P2,
                           from: "r", to: "rû")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "r", to: "ru")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,  //overrides S3 on previous step
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S3,
                           from: "r", to: "rû")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ou", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ou", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rmir", to: "rmir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "ourir", to: "ourr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "urir", to: "rt")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .o2e)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .o2e)
    thisVerb.appendSuffix(suffix: "mourir")
    verbModels.append(thisVerb)
    
    idNum = 96
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "servir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "serv", to: "sers")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "serv", to: "sers")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,  //does not require conjugation ending
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "serv", to: "sert")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rvir", to: "rvir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rvir", to: "rvir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "rvir", to: "rvir")  //not used
    thisVerb.appendSuffix(suffix: "servir")
    verbModels.append(thisVerb)
    
    idNum = 97
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "fuir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "fuir", to: "fuir")  //not used
    thisVerb.appendSuffix(suffix: "fuir")
    verbModels.append(thisVerb)
    
    idNum = 98
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "ouïr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,
                           from: "ou", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "ou", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,
                           from: "ou", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ïr", to: "ï")
    thisVerb.appendSuffix(suffix: "ouïr")
    verbModels.append(thisVerb)
    
    idNum = 99
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "gésir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "és", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.P1P2,
                           from: "és", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,
                           from: "és", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ésir", to: "ésir")  //not used
    thisVerb.appendSuffix(suffix: "ésir")
    verbModels.append(thisVerb)
    
    idNum = 100
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "recevoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "cev", to: "ço")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P1P2,
                           from: "vo", to: "v")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEIT,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "cev", to: "çoivent")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "cev", to: "çoiv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.P1P2,
                           from: "vo", to: "v")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,
                           from: "vo", to: "v")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "cev", to: "çu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.P1P2,
                           from: "cev", to: "çû")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "cev", to: "çu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S3,
                           from: "cev", to: "çû")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "ouir", to: "ouir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "voir", to: "vr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "cevoir", to: "çu")
    thisVerb.appendSuffix(suffix: "cevoir")
    verbModels.append(thisVerb)
    
    idNum = 102
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pourvoir")
    /*
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "o", to: "")
 */
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "v", to: "vo")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "v", to: "vo")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "v", to: "vo")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendSuffix(suffix: "pourvoir")
    verbModels.append(thisVerb)
    
    idNum = 103
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "savoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3,
                           from: "v", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P1P2P3,
                           from: "o", to: "")
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,
                            from: "av", to: "")
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "av", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "v", to: "ch")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "voir", to: "ur")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "voïr", to: "u")
    thisVerb.appendSuffix(suffix: "savoir")
    verbModels.append(thisVerb)
    
    idNum = 104
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "devoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ev", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "ev", to: "oiv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ev", to: "oiv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,
                            from: "ev", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "evo", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "oir", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "evoir", to: "û")
    thisVerb.appendSpecialPattern(tense: .present, pattern: .ev2o)
    thisVerb.appendSpecialPattern(tense: .presentSubjunctive, pattern: .ev2o)
    thisVerb.appendSuffix(suffix: "devoir")
    verbModels.append(thisVerb)
    
    idNum = 105
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pouvoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ouv", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING2,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "ouv", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "ouv", to: "u")
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,
                            from: "ouv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "ouv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "voir", to: "rr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ouvoir", to: "u")
    thisVerb.appendSuffix(suffix: "pouvoir")
    verbModels.append(thisVerb)
    
    idNum = 106
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "émouvoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,    //only working for a single person
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "ouv", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "ouv", to: "euv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,
                            from: "ouv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "ouv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "oir", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ouvoir", to: "u")
    thisVerb.appendSuffix(suffix: "émouvoir")
    verbModels.append(thisVerb)

    idNum = 107
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "pleuvoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IMPERSONAL1,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "v", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "v", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,
                            from: "euv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "euv", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "oir", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.CONDITIONAL,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "euvoir", to: "u")
    thisVerb.appendSuffix(suffix: "pleuvoir")
    verbModels.append(thisVerb)
    
    idNum = 108
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "falloir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IMPERSONAL2,
                               tense: ExceptionTense.PRESENT,
                               person: ExceptionPerson.S3,
                               from: "v", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "ll", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "ll", to: "ill")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "lloir", to: "udr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.CONDITIONAL,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used

    thisVerb.appendSuffix(suffix: "falloir")
    verbModels.append(thisVerb)

    idNum = 109
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "valoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3,
                           from: "l", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING4,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "l", to: "ill")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "loir", to: "udr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.CONDITIONAL,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendSuffix(suffix: "valoir")
    verbModels.append(thisVerb)
    
    idNum = 110
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "vouloir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "oul", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING3,
                             tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1S2S3P3,
                           from: "oul", to: "eu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING2,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "loir", to: "dr")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.CONDITIONAL,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendSuffix(suffix: "vouloir")
    verbModels.append(thisVerb)

    idNum = 112
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "asseoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1,
                           from: "e", to: "ied")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S2,
                           from: "e", to: "ied")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S3,
                           from: "e", to: "ied")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P1,
                           from: "e", to: "ey")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P2,
                           from: "e", to: "ey")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEMSINGLE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.P3,
                           from: "e", to: "ey")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                           tense: ExceptionTense.PRESENT, //Present tense only
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "tir", to: "tir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                           tense: ExceptionTense.PRETERITE,
                           person: ExceptionPerson.S1toP3All,
                           from: "e", to: "")
   thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                            tense: ExceptionTense.PRETERITE,
                            person: ExceptionPerson.S1toP3All,  //not used
                            from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
//    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
//                           tense: ExceptionTense.PRESENTSUBJ,
//                           person: ExceptionPerson.S1toP3All,
//                           from: "e", to: "ey")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING3,
                             tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    
     thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                            tense: ExceptionTense.IMPERFECTSUBJRA,
                            person: ExceptionPerson.S1toP3All,
                            from: "e", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "eoir", to: "iér")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OVERRIDE_ER,
                             tense: ExceptionTense.CONDITIONAL,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "eoir", to: "iér")  //not used
    thisVerb.appendSuffix(suffix: "asseoir")
    verbModels.append(thisVerb)

    idNum = 114
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "surseoir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3P3,
                             from: "e", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2,
                             from: "e", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "e", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "e", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "e", to: "o")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                           tense: ExceptionTense.IMPERFECTSUBJRA,
                           person: ExceptionPerson.S1toP3All,
                           from: "e", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "eoir", to: "is")
    
    thisVerb.appendSuffix(suffix: "surseoir")
    verbModels.append(thisVerb)

   
    idNum = 115  //116, 117
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "choir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.CHOIR_ENDING,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.CHOIR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.CHOIR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.CHOIR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.CHOIR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendSuffix(suffix: "choir")
    verbModels.append(thisVerb)

    idNum = 101
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "voir")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                           tense: ExceptionTense.PRESENT,
                           person: ExceptionPerson.S1toP3All,
                           from: "v", to: "vo")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,
                           tense: ExceptionTense.PRESENTSUBJ,
                           person: ExceptionPerson.S1toP3All,
                           from: "v", to: "vo")
    
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                           tense: ExceptionTense.GERUND,
                           person: ExceptionPerson.S1toP3All,  //not used
                           from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "voir", to: "verr")
    thisVerb.appendSuffix(suffix: "voir")
    verbModels.append(thisVerb)
    
    idNum = 118
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "rendre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
   
 thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                        tense: ExceptionTense.FUTURE,
                        person: ExceptionPerson.S1toP3All,
                        from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "andre")
    thisVerb.appendSuffix(suffix: "endre")
    thisVerb.appendSuffix(suffix: "ondre")
    thisVerb.appendSuffix(suffix: "erdre")
    thisVerb.appendSuffix(suffix: "ordre")
    thisVerb.appendSuffix(suffix: "ourdre")
    thisVerb.appendExcludeSuffix(suffix: "prendre")
    verbModels.append(thisVerb)
    
    idNum = 119
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "prendre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2,
                             from: "d", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P3,
                             from: "d", to: "n")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "d", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "end", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.P1P2,
                             from: "d", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1S2S3P3,
                             from: "nd", to: "nn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "end", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "endre", to: "is")
    
    thisVerb.appendSuffix(suffix: "prendre")
    verbModels.append(thisVerb)
    
    idNum = 120
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "rompre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "rompre")
    verbModels.append(thisVerb)
    
    idNum = 1201
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "foutre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "foutre")
    verbModels.append(thisVerb)

    idNum = 121
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "battre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,
                             from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "battre")
    verbModels.append(thisVerb)
    
    idNum = 122
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "mettre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,
                             from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "ett", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.P1P2,
                             from: "d", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "ett", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ettre", to: "is")
    thisVerb.appendSuffix(suffix: "mettre")
    verbModels.append(thisVerb)
    
    idNum = 123
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "peindre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING,  //this should override the previous exception
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,
                             from: "t", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,
                             from: "nd", to: "gn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "nd", to: "gn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "nd", to: "gn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "nd", to: "gn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "nd", to: "gn")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "dre", to: "t")
    thisVerb.appendSuffix(suffix: "eindre")
    thisVerb.appendSuffix(suffix: "oindre")   //#124
    thisVerb.appendSuffix(suffix: "aindre")   //#125
    verbModels.append(thisVerb)
    
    idNum = 126
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "vaincre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,
                             from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "c", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "aincre")
    verbModels.append(thisVerb)
    
    idNum = 127
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "traire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2,
                             from: "i", to: "y")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "i", to: "y")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.P1P2,
                             from: "i", to: "y")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "raire")
    verbModels.append(thisVerb)
    
    idNum = 128
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "faire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING2,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P3,
                             from: "ai", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "ais")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "i", to: "ss")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "aire", to: "er")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "faire")
    verbModels.append(thisVerb)
    

    idNum = 129
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "plaire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.GERUND,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,
                             from: "ai", to: "ais")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P3,
                             from: "ent", to: "ient")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "ais")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "ais")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "ai", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "aire", to: "u")
    thisVerb.appendSuffix(suffix: "plaire")
    
    verbModels.append(thisVerb)
    
    //put these in front of paraître to intercept their verbs first
    
    idNum = 131
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "naître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "aître", to: "é")
    thisVerb.appendSuffix(suffix: "naître")
    thisVerb.appendExcludeSuffix(suffix: "connaître")
    verbModels.append(thisVerb)
    

    idNum = 132
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "paître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "qu")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "aître", to: "u")
    thisVerb.appendSuffix(suffix: "paître")
    thisVerb.appendExcludeSuffix(suffix: "repaître")
    verbModels.append(thisVerb)
    
    idNum = 133
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "repaître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "aît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "aît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                             from: "aître", to: "u")
    thisVerb.appendSuffix(suffix: "repaître")
    verbModels.append(thisVerb)
    
    idNum = 130
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "paraître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "aît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "aît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "aître", to: "u")
    thisVerb.appendSuffix(suffix: "paraître")
    thisVerb.appendSuffix(suffix: "raître")
    thisVerb.appendSuffix(suffix: "aître")
    verbModels.append(thisVerb)

    idNum = 134
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "croître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "oît", to: "û")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "oît", to: "û")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "oître", to: "û")
    
    thisVerb.appendSuffix(suffix: "croître")
    thisVerb.appendExcludeSuffix(suffix: "décroître")
    verbModels.append(thisVerb)
    
    idNum = 135
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "croire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "i", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "i", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "oi", to: "û")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "i", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "oi", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "dre", to: "t")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "oire", to: "u")
    thisVerb.appendSuffix(suffix: "croire")
    verbModels.append(thisVerb)
    
    idNum = 136
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "décroître")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING3,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "oît", to: "u")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "ît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "oît", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "oître", to: "u")
    thisVerb.appendSuffix(suffix: "décroître")
    verbModels.append(thisVerb)
    
    idNum = 137
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "boire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2,
                             from: "oi", to: "uv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P3,
                             from: "oi", to: "oiv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "oi", to: "uv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "oi", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.STEM,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1S2S3P3,
                             from: "i", to: "iv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.P1P2,
                             from: "oi", to: "uv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "oi", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.FUTURE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "oire", to: "u")
    thisVerb.appendSuffix(suffix: "boire")
    verbModels.append(thisVerb)
    
    idNum = 138
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "clore")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,
                             from: "o", to: "os")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S3,
                             from: "o", to: "ô")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,
                             from: "o", to: "os")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,
                             from: "o", to: "os")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,
                             from: "o", to: "os")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,    //only working for a single person
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,
                             from: "o", to: "os")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendSuffix(suffix: "clore")
    verbModels.append(thisVerb)
    
    idNum = 139
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "exclure")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "u", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "u", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ure", to: "u")
    thisVerb.appendSuffix(suffix: "exclure")
    verbModels.append(thisVerb)
    
    idNum = 140
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "inclure")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "u", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "u", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "s")
    thisVerb.appendSuffix(suffix: "inclure")
    verbModels.append(thisVerb)
    
    idNum = 141
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "absoudre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,  //not used
                             from: "d", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "s")
    
    thisVerb.appendSuffix(suffix: "soudre")
    thisVerb.appendExcludeSuffix(suffix: "résoudre")
    verbModels.append(thisVerb)
    
    idNum = 142
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "résoudre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,  //not used
                             from: "d", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "lv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ud", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "u")
    thisVerb.appendSuffix(suffix: "résoudre")
    verbModels.append(thisVerb)
    
    idNum = 143
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "coudre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "d", to: "s")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "s")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "s")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "s")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "s")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "dre", to: "su")
    thisVerb.appendSuffix(suffix: "coudre")
    verbModels.append(thisVerb)
    
    idNum = 144
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "moudre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "d", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.RE_ENDING1,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "d", to: "l")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "dre", to: "lu")
    thisVerb.appendSuffix(suffix: "moudre")
    verbModels.append(thisVerb)
    
    idNum = 145
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "suivre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,  //not used
                             from: "v", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "i")
    thisVerb.appendSuffix(suffix: "suivre")
    verbModels.append(thisVerb)
    
    idNum = 146
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "vivre")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.S1S2S3,  //not used
                             from: "v", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "iv", to: "éc")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "iv", to: "éc")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ivre", to: "vécu")
    thisVerb.appendSuffix(suffix: "vivre")
    verbModels.append(thisVerb)
    
    idNum = 147
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "lire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.OIR_ENDING1,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ire", to: "u")
    thisVerb.appendSuffix(suffix: "lire")
    verbModels.append(thisVerb)
    
    idNum = 148
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "dire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "dire")
    verbModels.append(thisVerb)
    
    
    idNum = 150
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "écrire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "iv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ri", to: "riv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ri", to: "riv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ri", to: "riv")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ri", to: "riv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "ri", to: "riv")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "écrire")
    verbModels.append(thisVerb)
    
    idNum = 151
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "confire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "fi", to: "fis")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "fi", to: "fis")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.DROPLETTERS,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "confire")
    thisVerb.appendSuffix(suffix: "ncire")
    thisVerb.appendSuffix(suffix: "frire")
    thisVerb.appendSuffix(suffix: "ffire")
    verbModels.append(thisVerb)
    
    idNum = 149
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "rire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING2,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ire", to: "i")
    thisVerb.appendSuffix(suffix: "rire")
    thisVerb.appendExcludeSuffix(suffix: "écrire")
    verbModels.append(thisVerb)
    
    idNum = 152
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "cuire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "t")
    thisVerb.appendSuffix(suffix: "uire")
    verbModels.append(thisVerb)
    
    idNum = 153
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "luire")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENT,
                             person: ExceptionPerson.P1P2P3,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.PRETERITE,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.IMPERFECT,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING1,
                             tense: ExceptionTense.PRESENTSUBJ,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "", to: "")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACE,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "i", to: "is")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.IR_ENDING,
                             tense: ExceptionTense.IMPERFECTSUBJRA,
                             person: ExceptionPerson.S1toP3All,  //not used
                             from: "voir", to: "voir")  //not used
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEINFINITIVE,
                           tense: ExceptionTense.FUTURE,
                           person: ExceptionPerson.S1toP3All,
                           from: "re", to: "r")
    thisVerb.appendException(exceptionPattern: ExceptionPattern.REPLACEENDING,
                           tense: ExceptionTense.PASTPART,
                           person: ExceptionPerson.S1toP3All,
                           from: "ire", to: "i")
    thisVerb.appendSuffix(suffix: "luire")
    verbModels.append(thisVerb)
    
    idNum = 81
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "finir")
    thisVerb.appendSuffix(suffix: "ir")
    thisVerb.appendSuffix(suffix: "s'amuïr")  //might need its own pattern
    thisVerb.appendExcludeSuffix(suffix: "tenir")
    thisVerb.appendExcludeSuffix(suffix: "venir")
    thisVerb.appendExcludeSuffix(suffix: "uérir")
    thisVerb.appendExcludeSuffix(suffix: "ourir")
    verbModels.append(thisVerb)

    idNum = 65
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "aimer")
    thisVerb.appendSuffix(suffix: "er")
    verbModels.append(thisVerb)
    
    idNum = 7
    thisVerb = RomanceVerbModel(id: idNum, modelVerb: "xxxre")
    thisVerb.appendSuffix(suffix: "re")
    verbModels.append(thisVerb)
    
    let lastIndex = verbModels.count - 1
    let vm = verbModels[lastIndex]
    
    print("French model count = \(verbModels.count), final verb model at index \(lastIndex): \(vm.modelVerb)")
    
    return verbModels
}


public func parseFrenchVerbModels(verbModels: [RomanceVerbModel]){
    for vm in verbModels {
        let modelVerb = vm.modelVerb
        let exceptionCount = vm.exceptionList.count
        print("model verb \(vm.id). \(modelVerb) has exceptionCount = \(exceptionCount)")
    }
}

public func testFrenchVerbsAgainstVerbModels(verbModels: [RomanceVerbModel]){
    var verbWordList = [String]()
    
    verbWordList.append("être")
    verbWordList.append("avoir")
    verbWordList.append("aimer")

    for verbWord in verbWordList {
        var modelFound = false
        for vm in verbModels {
            if vm.isModelFor(verbWord: verbWord){
                modelFound = true
                //print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                break
            }
        }
        if !modelFound {print("VerbWord \(verbWord) has no known verb model")}
    }
}
