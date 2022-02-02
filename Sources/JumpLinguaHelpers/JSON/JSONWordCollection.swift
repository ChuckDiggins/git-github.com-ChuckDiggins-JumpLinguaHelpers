//
//  JSONWordCollection.swift
//  JSONWordCollection
//
//  Created by Charles Diggins on 1/11/22.
//

import Foundation

public struct JSONWordCollection: Codable {
     
    public init(){}
    
    var myWordList = [JSONWord]()
    
    public func printWords(){
        print(myWordList)
    }
    
    public func printOne(jv: JSONWord){
        print(jv)
    }
    
    mutating public func encodeInternalWords(total: Int){
        clearWords()
        let wordList = CarpenterWordList
        
        for v in wordList{
            myWordList.append(v)
            if myWordList.count >= total {break}
        }
        encodeWords()
    }
    
    mutating public func encodeWords(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedPreps = try? encoder.encode(myWordList){
            try? encodedPreps.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    mutating public func decodeWords(){
        let decoder = JSONDecoder()
        
        if let data = try? Data.init(contentsOf: getURL()){
            if let decodedWords = try? decoder.decode([JSONWord].self, from: data){
                myWordList = decodedWords
            }
        }
    }
    
    mutating public func appendWord(jw: JSONWord){
        var appendThis = true
        for i in 0..<myWordList.count {
            let v = myWordList[i]
            if v.spanish == jw.spanish && v.french == jw.french && v.english == jw.english{
                myWordList.remove(at: i)
                myWordList.insert(jw, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myWordList.append(jw)}
        encodeWords()
    }
    mutating public func clearWords(){
        myWordList.removeAll()
    }
    
    public func getJsonWordAt(index: Int)->JSONWord{
        if index > myWordList.count-1 { return myWordList[0] }
        return myWordList[index]
    }
    
    mutating public func getWordAt(index: Int)->Word{
        if index > myWordList.count-1 {
            return Word()
        }
        else {
            let jsonWord = myWordList[index]
            let wordType = getWordTypeFromString(str: jsonWord.wordType)
            return Word(word: jsonWord.spanish, spanish: jsonWord.spanish, french: jsonWord.french, english: jsonWord.english, wordType: wordType)
        }
    }
    
    public func getWordCount()->Int{
        return myWordList.count
    }
     
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("SPIFEWordCollection").appendingPathExtension("json")
    }
    
}

