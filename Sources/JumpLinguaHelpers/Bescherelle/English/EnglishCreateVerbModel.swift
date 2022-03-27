//
//  EnglishCreateVerbModel.swift
//  ContextFree
//
//  Created by Charles Diggins on 6/16/21.
//

import Foundation

public struct EnglishVerbModel : Identifiable{
    public let id : Int
    let infinitive: String
    let presS3: String
    let preterite: String
    let pastPart: String
    let gerund: String
    
    public  init(id: Int, infinitive: String, presS3: String, preterite: String, pastPart: String, gerund: String){
        self.id = id
        self.infinitive = infinitive
        self.presS3 = presS3
        self.preterite = preterite
        self.pastPart = pastPart
        self.gerund = gerund
    }
    
    public init(){
        id = 0
        infinitive = ""
        presS3 = ""
        preterite = ""
        pastPart = ""
        gerund = ""
    }
    
    public func isModelFor(verbWord: String)->Bool{
        if verbWord == infinitive { return true}
        return false
    }
}

public func createEnglishVerbModels()->[EnglishVerbModel]{
    
//    //setVerbModelList(verbModelList: verbModels)
    
    var verbModelList = [EnglishVerbModel]()
    
    //this first because it's standalone
    
    // id = 0 is reserved for regular verbs
    verbModelList.append( EnglishVerbModel(id: 0, infinitive: "admit", presS3: "admits", preterite: "admitted", pastPart: "admitted", gerund : "admitting"))
    verbModelList.append( EnglishVerbModel(id: 0, infinitive: "beg", presS3: "begs", preterite: "begged", pastPart: "begged", gerund : "begging"))
    verbModelList.append( EnglishVerbModel(id: 0, infinitive: "pop", presS3: "pops", preterite: "popped", pastPart: "popped", gerund : "popping"))
    var id = 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "be", presS3: "is", preterite: "was", pastPart: "been", gerund : "being")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "arise", presS3: "arises", preterite: "arose", pastPart: "arisen", gerund : "arising")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "awake", presS3: "awakens", preterite: "awoke", pastPart: "awoken", gerund : "awaking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "awake", presS3: "awakes", preterite: "awaked", pastPart: "awaked", gerund : "awaking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "beat",  presS3: "beats", preterite: "beat", pastPart: "beaten", gerund : "beating")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "become", presS3: "becomes", preterite: "became", pastPart: "become", gerund : "becoming")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "begin", presS3: "begins", preterite: "began", pastPart: "begun", gerund : "beginning")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bend", presS3: "bends", preterite: "bent", pastPart: "bent", gerund : "bending")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bet", presS3: "bets", preterite: "bet", pastPart: "bet", gerund : "betting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bet", presS3: "bets", preterite: "betted", pastPart: "betted", gerund : "betting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bid", presS3: "bids", preterite: "bid", pastPart: "bid", gerund : "bidding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bleed", presS3: "bleedss", preterite: "bled", pastPart: "bled", gerund : "bleeding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "blow", presS3: "blows", preterite: "blew", pastPart: "blown", gerund : "blowing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "break", presS3: "breaks", preterite: "broke", pastPart: "broken", gerund : "breaking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "breed", presS3: "breeds", preterite: "bred", pastPart: "bred", gerund : "breeding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "bring", presS3: "brings", preterite: "brought", pastPart: "brought", gerund : "bringing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "build", presS3: "builds", preterite: "built", pastPart: "built", gerund : "building")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "burn", presS3: "burns", preterite: "burned", pastPart: "burned", gerund : "burning")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "burst", presS3: "bursts", preterite: "burst", pastPart: "burst", gerund : "bursting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "buy", presS3: "buys", preterite: "bought", pastPart: "bought", gerund : "buying")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "can", presS3: "can", preterite: "could", pastPart: "no PP", gerund : "...")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "cast", presS3: "casts", preterite: "cast", pastPart: "cast", gerund : "casting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "catch", presS3: "catches", preterite: "caught", pastPart: "caught", gerund : "catching")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "chide", presS3: "chides", preterite: "chided", pastPart: "chided", gerund : "chiding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "choose", presS3: "chooses", preterite: "chose", pastPart: "chosen", gerund : "choosing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "come", presS3: "comes", preterite: "came", pastPart: "come", gerund : "coming")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "cost", presS3: "costs", preterite: "cost", pastPart: "cost", gerund : "costing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "cut", presS3: "cuts", preterite: "cut", pastPart: "cut", gerund : "cutting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "do", presS3: "does", preterite: "did", pastPart: "done", gerund : "doing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "draw", presS3: "draws", preterite: "drew", pastPart: "drawn", gerund : "drawing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "dream", presS3: "dreams", preterite: "dreamt", pastPart: "dreamt", gerund : "dreaming")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "drink", presS3: "drinks", preterite: "drank", pastPart: "drunk", gerund : "drinking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "drive", presS3: "drives", preterite: "drove", pastPart: "driven", gerund : "driving")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "eat", presS3: "eats", preterite: "ate", pastPart: "eaten", gerund : "eating")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "fall", presS3: "falls", preterite: "fell", pastPart: "fallen", gerund : "falling")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "feel", presS3: "feels", preterite: "felt", pastPart: "felt", gerund : "feeling")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "fight", presS3: "fights", preterite: "fought", pastPart: "fought", gerund : "fighting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "find", presS3: "finds", preterite: "found", pastPart: "found", gerund : "finding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "fit", presS3: "fits", preterite: "fit", pastPart: "fit", gerund : "fitting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "flee", presS3: "flees", preterite: "fled", pastPart: "fled", gerund : "fleeing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "fly", presS3: "flies", preterite: "flew", pastPart: "flown", gerund : "flying")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "forbid", presS3: "forbids", preterite: "forbade", pastPart: "forbidden", gerund : "forbidding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "forget", presS3: "forgets", preterite: "forgot", pastPart: "forgotten", gerund : "forgetting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "forgive", presS3: "forgives", preterite: "forgave", pastPart: "forgiven", gerund : "forgiving")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "get", presS3: "gets", preterite: "got", pastPart: "got", gerund : "getting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "give", presS3: "gives", preterite: "gave", pastPart: "given", gerund : "giving")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "go", presS3: "goes", preterite: "went", pastPart: "gone", gerund : "going")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "grow", presS3: "grows", preterite: "grew", pastPart: "grown", gerund : "growing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "have", presS3: "has", preterite: "had", pastPart: "had", gerund : "having")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "hear", presS3: "hears", preterite: "heard", pastPart: "heard", gerund : "hearing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "hide", presS3: "hides", preterite: "hid", pastPart: "hidden", gerund : "hiding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "hold", presS3: "holds", preterite: "held", pastPart: "held", gerund : "holding")); id += 1
    
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "hurt", presS3: "hurts", preterite: "hurt", pastPart: "hurt", gerund : "hurting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "keep", presS3: "keeps", preterite: "kept", pastPart: "kept", gerund : "keeping")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "know", presS3: "knows", preterite: "knew", pastPart: "known", gerund : "knowing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "learn", presS3: "learns", preterite: "learned", pastPart: "learned", gerund : "learning")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "leave", presS3: "leaves", preterite: "left", pastPart: "left", gerund : "leaving")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "lie", presS3: "lies", preterite: "lay", pastPart: "lain", gerund : "lying")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "lose", presS3: "loses", preterite: "lost", pastPart: "lost", gerund : "losing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "make", presS3: "makes", preterite: "made", pastPart: "made", gerund : "making")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "mean", presS3: "means", preterite: "meant", pastPart: "meant", gerund : "meaning")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "meet", presS3: "meets", preterite: "met", pastPart: "met", gerund : "meeting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "pay", presS3: "pays", preterite: "paid", pastPart: "paid", gerund : "paying")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "put", presS3: "puts", preterite: "put", pastPart: "put", gerund : "putting")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "read", presS3: "reads", preterite: "read", pastPart: "read", gerund : "reading")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "ride", presS3: "rides", preterite: "rode", pastPart: "ridden", gerund : "riding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "run", presS3: "runs", preterite: "ran", pastPart: "run", gerund : "running")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "say", presS3: "says", preterite: "said", pastPart: "said", gerund : "saying")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "see", presS3: "sees", preterite: "saw", pastPart: "seen", gerund : "seeing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "sell", presS3: "sells", preterite: "sold", pastPart: "sold", gerund : "selling")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "send", presS3: "sends", preterite: "sent", pastPart: "sent", gerund : "sending")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "show", presS3: "shows", preterite: "showed", pastPart: "shown", gerund : "showing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "sing", presS3: "sings", preterite: "sang", pastPart: "sung", gerund : "singing")); id += 1
    
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "slide", presS3: "slides", preterite: "slid", pastPart: "slid", gerund : "sliding")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "sleep", presS3: "sleeps", preterite: "slept", pastPart: "slept", gerund : "sleeping")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "speak", presS3: "speaks", preterite: "spoke", pastPart: "spoken", gerund : "speaking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "spell", presS3: "spells", preterite: "spelled", pastPart: "spelled", gerund : "spelling")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "stand", presS3: "stands", preterite: "stood", pastPart: "stood", gerund : "standing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "steal", presS3: "steals", preterite: "stole", pastPart: "stolen", gerund : "stealing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "swim", presS3: "swims", preterite: "swam", pastPart: "swum", gerund : "swimming")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "take", presS3: "takes", preterite: "took", pastPart: "taken", gerund : "taking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "teach", presS3: "teaches", preterite: "taught", pastPart: "taught", gerund : "teaching")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "tell", presS3: "tells", preterite: "told", pastPart: "told", gerund : "telling")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "think", presS3: "thinks", preterite: "thought", pastPart: "thought", gerund : "thinking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "throw", presS3: "throws", preterite: "threw", pastPart: "thrown", gerund : "throwing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "wake", presS3: "wakes", preterite: "woke", pastPart: "waked", gerund : "waking")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "wear", presS3: "wears", preterite: "wore", pastPart: "worn", gerund : "wearing")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "win", presS3: "wins", preterite: "won", pastPart: "won", gerund : "winning")); id += 1
    verbModelList.append( EnglishVerbModel(id: id, infinitive: "write", presS3: "writes", preterite: "wrote", pastPart: "wrote", gerund : "writing")); id += 1
    
    print("English verb model count = \(verbModelList.count)")
    
    return verbModelList
}


