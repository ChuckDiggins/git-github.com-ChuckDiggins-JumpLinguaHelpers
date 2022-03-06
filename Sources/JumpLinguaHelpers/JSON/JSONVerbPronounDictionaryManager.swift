//
//  JSONVerbPronounDictionaryManager.swift
//  JSONVerbPronounDictionaryManager
//
//  Created by Charles Diggins on 11/25/21.
//

import Foundation

public struct JSONVerbPronounDictionaryManager {
    
    public init(){}
    
    public var m_wsp : ViperWordStringParser!
    
    public var jsonVerbManager = JsonVerbManager()
    public var jsonPronounManager = JsonPronounManager()
    public let bUseJsonStarterFiles = true
    public var verbModelManager = VerbModelManager()
    
    public mutating func setWordStringParser(wsp: ViperWordStringParser){
        m_wsp = wsp
    }
    
    public mutating func loadJsonWords(){
        if bUseJsonStarterFiles {
            //jsonVerbManager.encodeVerbs()  //this should wipe out existing jsonVerbs
            //        jsonVerbManager.encodeInternalVerbs(collectionType: .CarpenterChapter3, total: 2000)
            jsonVerbManager.encodeInternalVerbs(collectionType: .Master, total: 2000)
            jsonPronounManager.encodeInternalWords(total: 2000)
        }
        jsonVerbManager.decodeVerbs()
        createDictionaryFromJsonWords(wordType: .verb)
        jsonPronounManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .pronoun)
    }
    
    public mutating func createDictionaryFromJsonWords(wordType: WordType){
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
    
    public mutating func createAndAppendPronounFromJsonPronoun(jn: JsonPronoun){
        let p = Pronoun(json: jn, language: .Agnostic)
        m_wsp.addPronounToDictionary(wd: p)
        
    }
    
    public mutating func createJsonVerb(verb: Verb)->Int{
        return appendJsonVerb(jsonVerb: verb.createJsonVerb())
    }
    
    public mutating func appendJsonVerb(jsonVerb: JsonVerb)->Int{
        jsonVerbManager.appendVerb(verb: jsonVerb)
        createAndAppendVerbFromJsonVerb(jv: jsonVerb)
        jsonVerbManager.printVerbs()
        return jsonVerbManager.getVerbCount()
    }
    
    public mutating func createVerbDictionaryFromJsonVerbs(){
        for i in 0 ..< jsonVerbManager.getVerbCount() {
            let jsonVerb = jsonVerbManager.getVerbAt(index: i)
            createAndAppendVerbFromJsonVerb(jv: jsonVerb)
        }
    }
    
    public mutating func createAndAppendVerbFromJsonVerb(jv: JsonVerb){
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
    
    public mutating func appendVerbFromJsonVerb(jv: JsonVerb){
        let verb = Verb(jsonVerb: jv, language: .Agnostic)
        m_wsp.addVerbToDictionary(verb: verb)
    }
    
    
    
    public func appendAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String){
        
    }
    
    public func analyzeAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String)->Bool {
        return true
    }
}

