//
//  SpanishWords.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/7/21.
//

import Foundation


public struct SpanishWords {
    public init(){}
    
    public var adjectiveList = Array<Word>()
    public var adverbList = Array<Word>()
    //var articleList = Array<Word>()
    public var conjunctionList = Array<Word>()
    public var determinerList = Array<Word>()
    public var nounList = Array<Word>()
    public var prepositionList = Array<Word>()
    public var verbList = Array<Word>()
    public var pronounList = Array<Word>()
    public var ambiguousList = Array<Word>()
    
    
    
    public func isContraction(word: String)->(Bool, String, String){
        if word == "al" {return (true, "a", "el")}
        if word == "del" {return (true, "de", "el")}
        if word == "conmigo" {return (true, "con", "mí")}
        if word == "contigo" {return (true, "con", "tú")}
        if word == "consigo" {return (true, "con", "él")}
        return (false, "", "")
    }
    
    public func createContraction(word1: String, word2: String)->String{
        if word1 == "a" && word2 == "el" {return "al"}
        if word1 == "de" && word2 == "el" {return "del"}
        if word1 == "con" && word2 == "mí" {return "conmigo"}
        if word1 == "con" && word2 == "tú" {return "contigo"}
        if word1 == "con" && word2 == "él" {return "consigo"}
        if word1 == "con" && word2 == "ella" {return "consigo"}
        if word1 == "con" && word2 == "ellos" {return "consigo"}
        if word1 == "con" && word2 == "ellas" {return "consigo"}
        return ""
    }
    
   
}
