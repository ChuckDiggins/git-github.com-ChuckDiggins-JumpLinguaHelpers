//
//  File.swift
//  File
//
//  Created by Charles Diggins on 2/2/22.
//

import Foundation

//create json from
public struct JsonPhraseManager {
    public var myList = [JSONNamedLoadedPhrase]()
    public init(){}
    
    public func printPhrases(){
        print(myList)
    }
    
    public func printOne(jv: JSONNamedLoadedPhrase){
        print(jv)
    }
    
    mutating public func encodeInternalPhrases(total: Int){
        clearPhrases()
        for v in myPhraseList{
            myList.append(v)
            print("JsonPhraseManager: appending phrase \(v.phraseName)")
            if myList.count >= total {break}
        }
        encodePhrases()
    }
    
    public func getLastPhrase()->JSONNamedLoadedPhrase{
        return myList.last!
    }
    
    mutating public func encodePhrases(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedPreps = try? encoder.encode( myList){
            //print(String(data: encodedAdjs, encoding: .utf8)!)
            try? encodedPreps.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    mutating public func decodePhrases(){
        let decoder = JSONDecoder()
        if let data = try? Data.init(contentsOf: getURL()){
            if let decodedWords = try? decoder.decode([JSONNamedLoadedPhrase].self, from: data){
                myList = decodedWords
            }
        }
    }
    
    mutating public func getPhraseAtName(language: String, name: String)->JSONNamedLoadedPhrase{
        for i in 0..<myList.count {
            let v = myList[i]
            if v.language == language && v.phraseName == name { return v }
        }
        return JSONNamedLoadedPhrase()  //empty
    }
    
    mutating public func appendPhrase(jl: JSONNamedLoadedPhrase){
        var appendThis = true
        for i in 0..<myList.count {
            let v = myList[i]
            if v.phraseName == jl.phraseName && v.language == jl.language {
                myList.remove(at: i)
                myList.insert(jl, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myList.append(jl)}
        encodePhrases()
    }
    
    mutating public func clearPhrases(){
        myList.removeAll()
    }
    
    public func getLessonAt(index: Int)->JSONNamedLoadedPhrase{
        if index > myList.count-1 { return myList[0] }
        return myList[index]
    }
    
    public func getCount()->Int{
        return myList.count
    }
     
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("SPIFEPhrases").appendingPathExtension("json")
    }
    
    
}
