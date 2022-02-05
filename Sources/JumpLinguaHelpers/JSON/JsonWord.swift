//
//  File.swift
//  File
//
//  Created by Charles Diggins on 2/2/22.
//

import Foundation
public struct JSONWord : Codable, CustomStringConvertible {
    public var spanish: String
    public var english: String
    public var french: String
    public var wordType: String
    public init(){
        spanish = ""
        english = ""
        french = ""
        wordType = "Unknown"
    }
    public init(spanish: String, english: String, french: String, wordType: String){
        self.spanish = spanish
        self.english = english
        self.french  = french
        self.wordType = wordType
    }
    
    public  var description: String {
        return "\(self.spanish) \(self.english) \(self.french)"
    }
    
    public func getWord()->Word{
        let word = Word(word: spanish, spanish: spanish, french: french, english: english, wordType: getWordTypeFromString(str: wordType))
        return word
    }
    
    public func getJsonWord(word: Word)->JSONWord{
        return JSONWord(spanish: word.spanish, english: word.english, french: word.french, wordType: word.getWordTypeString())
    }
    
    
}
