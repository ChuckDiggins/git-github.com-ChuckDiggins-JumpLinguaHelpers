//
//  File.swift
//  File
//
//  Created by Charles Diggins on 2/2/22.
//

import Foundation

public struct JSONCollectionStruct : Codable, CustomStringConvertible {
    var idNum: Int
    public var collectionName : String
    public var wordList = [JSONWord]()
    
    public var description: String {
        return "\(self.collectionName) : wordCount =\(wordList.count)"
    }
    
    public init(idNum: Int, collectionName: String, wordList : [JSONWord]){
        self.idNum = idNum
        self.collectionName = collectionName
        self.wordList = wordList
    }
    
    public init(idNum: Int, collectionName: String){
        self.idNum = idNum
        self.collectionName = collectionName
    }
    
    public mutating func appendJsonWord(jw: JSONWord){
        wordList.append(jw)
    }
    
    public func printThyself(){
        print("\(idNum) - \(collectionName)")
        var i = 0
        for word in wordList {
            print("Word \(i)- \(word.spanish), \(word.english), \(word.french)")
            i += 1
        }
    }
    
    public func convertToJLingCollection()->dWordCollection{
        var newWordList = [Word]()
        for jsonWord in wordList {
            let wordType = getWordTypeFromString(str: jsonWord.wordType)
            let word = Word(word: jsonWord.spanish, spanish: jsonWord.spanish, french: jsonWord.french, english: jsonWord.english, wordType: wordType)
            newWordList.append(word)
        }
        return dWordCollection(idNum: idNum, collectionName: collectionName, wordList: newWordList)
    }
}
