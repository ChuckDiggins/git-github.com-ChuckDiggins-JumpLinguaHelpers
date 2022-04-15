//
//  WordCollection.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/20/22.
//

import Foundation

public struct dWordCollection : Equatable, Hashable {
    let id: String = UUID().uuidString
    public let collectionName : String
    public var wordList = [Word]()
    public static func == (lhs: dWordCollection, rhs: dWordCollection) -> Bool {
        return
            lhs.collectionName == rhs.collectionName
    }
    
    public init(){
        self.collectionName = "no name"
    }
    
    public init(collectionName: String, wordList: [Word]){
        self.collectionName = collectionName
        self.wordList = wordList
    }
    
    public init(collectionName: String){
        self.collectionName = collectionName
    }
    
    
    public mutating func appendWord(word: Word){
        wordList.append(word)
    }
    
    public mutating func addWords(words: [Word])->Int{
        for word in words{
            wordList.append(word)
        }
        return wordList.count
    }
    
    public func getWord(index: Int)->Word{
        if index >= 0 && index < wordList.count {
            return wordList[index]
        }
        return Word()
    }
    
    public func getWordCount()->Int{
        return wordList.count
    }
    
    public func getWords()->[Word]{
        return wordList
    }
    
    public func getWords(wordType: WordType)->[Word]{
        var newWordList = [Word]()
        for word in wordList{
            if word.wordType == wordType{
                newWordList.append(word)
            }
        }
        return newWordList
    }
}
