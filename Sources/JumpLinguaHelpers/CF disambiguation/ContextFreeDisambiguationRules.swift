//
//  ContextFreeDisambiguationRules.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 4/1/21.
//

import Foundation

public struct ContextFreeDisambiguateA{
    let sentence : String
    let words = Array<Word>()
    
    public init(sentence: String){
        self.sentence = sentence
    }
    
    public func parseSentence (){
        let util = Utilities()
        let words = util.getListOfWords(characterArray: sentence)
        
        //loop through wordStrings in sentence, casting them into Words
        
        
    }
    

    

}
