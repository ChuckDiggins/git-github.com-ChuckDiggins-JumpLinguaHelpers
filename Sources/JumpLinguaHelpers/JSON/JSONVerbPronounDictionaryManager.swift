//
//  JSONVerbPronounDictionaryManager.swift
//  JSONVerbPronounDictionaryManager
//
//  Created by Charles Diggins on 11/25/21.
//

import Foundation

struct JSONVerbPronounDictionaryManager {
var m_wsp : ViperWordStringParser!

var jsonVerbManager = JsonVerbManager()
var jsonPronounManager = JsonPronounManager()
let bUseJsonStarterFiles = true
var verbModelManager = VerbModelManager()

mutating func setWordStringParser(wsp: ViperWordStringParser){
    m_wsp = wsp
}

mutating func loadJsonWords(){
    if bUseJsonStarterFiles {
        //jsonVerbManager.encodeVerbs()  //this should wipe out existing jsonVerbs
//        jsonVerbManager.encodeInternalVerbs(collectionType: .CarpenterChapter3, total: 2000)
        jsonVerbManager.encodeInternalVerbs(collectionType: .All, total: 2000)
        
        jsonPronounManager.encodeInternalWords(total: 2000)
    }
    jsonVerbManager.decodeVerbs()
    createDictionaryFromJsonWords(wordType: .verb)
    jsonPronounManager.decodeWords()
    createDictionaryFromJsonWords(wordType: .pronoun)
}

mutating func createDictionaryFromJsonWords(wordType: WordType){
    switch wordType{
    case .pronoun:
        for i in 0 ..< jsonPronounManager.getWordCount() {
            let jsonWord = jsonPronounManager.getWordAt(index: i)
            createAndAppendPronounFromJsonPronoun(jn: jsonWord)
        }
    case .verb:
        for i in 0 ..< jsonVerbManager.getVerbCount() {
            let jsonWord = jsonVerbManager.getVerbAt(index: i)
//            createAndAppendVerbFromJsonVerb(jv: jsonWord)
            appendVerbFromJsonVerb(jv: jsonWord)
        }
    default:
        break
    }
}

mutating func createAndAppendPronounFromJsonPronoun(jn: JsonPronoun){
    let p = Pronoun(json: jn, language: .Agnostic)
    m_wsp.addPronounToDictionary(wd: p)
    
}

mutating func createJsonVerb(verb: Verb)->Int{
    return appendJsonVerb(jsonVerb: verb.createJsonVerb())
}

mutating func appendJsonVerb(jsonVerb: JsonVerb)->Int{
    jsonVerbManager.appendVerb(verb: jsonVerb)
    createAndAppendVerbFromJsonVerb(jv: jsonVerb)
    jsonVerbManager.printVerbs()
    return jsonVerbManager.getVerbCount()
}

mutating func createVerbDictionaryFromJsonVerbs(){
    for i in 0 ..< jsonVerbManager.getVerbCount() {
        let jsonVerb = jsonVerbManager.getVerbAt(index: i)
        createAndAppendVerbFromJsonVerb(jv: jsonVerb)
    }
}

mutating func createAndAppendVerbFromJsonVerb(jv: JsonVerb){
    //var cfModelTemp = cfModel
    
    //determine if this is a legitimate verb in all three languages
    
   let spanishVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .Spanish, verbPhrase: jv.spanish)
   let frenchVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .French, verbPhrase: jv.french)
   let englishVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .English, verbPhrase: jv.english)
   if ( spanishVerbStuff.isValid && frenchVerbStuff.isValid && englishVerbStuff.isValid){
        let verb = Verb(jsonVerb: jv, language: .Agnostic)
        m_wsp.addVerbToDictionary(verb: verb)
   }
}

    mutating func appendVerbFromJsonVerb(jv: JsonVerb){
        let verb = Verb(jsonVerb: jv, language: .Agnostic)
        m_wsp.addVerbToDictionary(verb: verb)
    }



func appendAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String){
    
}

func analyzeAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String)->Bool {
    return true
}
}

