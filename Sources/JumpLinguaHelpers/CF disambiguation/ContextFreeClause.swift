//
//  ContextFreeClause.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/4/21.
//

import Foundation

public struct CFClauseA {
    var clauseType : ContextFreeSymbol
    var phraseList = Array<ContextFreeSymbol>()
    
    public init(clauseType: ContextFreeSymbol, cfps: ContextFreeSymbol){
        self.clauseType = clauseType
        phraseList.append(cfps)
    }
    
    public mutating func initial(cfps: ContextFreeSymbol){
        phraseList.removeAll()
        phraseList.append(cfps)
        //phraseList.append(ContextFreeSymbolType.connector)
    }
    
    public mutating func append(cfps: ContextFreeSymbol){
        phraseList.append(cfps)
    }
    
    public mutating func getClauseString(){
        var clauseString = ""
        for phrase in phraseList {
            clauseString += "->"
            //clauseString = clauseString + phrase.getRuleString()
        }
    }

}
