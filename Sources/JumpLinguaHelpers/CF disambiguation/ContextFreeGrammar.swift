//
//  ContextFreeGrammar.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 4/1/21.
//

import Foundation

public enum GrammarType{
    case adjective
    case noun
    case verb
    case preposition
    case special
    case unknown
}


public struct ContextFreeGrammarManager{
    var cfGrammarList = Array<ContextFreeGrammar>()
    public init(){}
    public mutating func addGrammar(cfg: ContextFreeGrammar){
        cfGrammarList.append(cfg)
    }
    
    public func getGrammar(type: GrammarType)->ContextFreeGrammar{
        for grammar in cfGrammarList {
            if grammar.grammarType == type {
                return grammar
            }
        }
        return ContextFreeGrammar(name: "", description: "", grammarType: .unknown)
    }
    
    public func getGrammarList()->Array<ContextFreeGrammar>{
        return cfGrammarList
    }
}

public struct ContextFreeGrammar {
    var name: String
    var description : String
    var grammarType : GrammarType
    var cfRuleList = Array<ContextFreeRule>()
    
    public init (name: String, description: String, grammarType: GrammarType){
        self.name = name
        self.description  = description
        self.grammarType = grammarType
    }
    
    public init (){
        self.name = ""
        self.description  = ""
        self.grammarType = .unknown
    }
    
    public func getName()->String{
        return name
    }
    
    func getDescription()->String{
        return description
    }
    
    public mutating func addRule(cfr: ContextFreeRule){
        cfRuleList.append(cfr)
    }
    
    public func getRuleCount()->Int{
        return cfRuleList.count
    }
    
    public func printRules(){
        for rule in cfRuleList {
            print ("Rule: \(rule.getSymbolString())")
        }
    }
    

}

