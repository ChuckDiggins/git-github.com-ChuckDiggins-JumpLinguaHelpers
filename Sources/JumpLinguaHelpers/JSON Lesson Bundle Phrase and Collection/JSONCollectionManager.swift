//
//  JSONCollectionManager.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/20/22.
//

import Foundation
import JumpLinguaHelpers

public class JSONCollectionManager: Codable {
     
    public var myCollectionList = [JSONCollectionStruct]()
    
    public func printWords(){
        print(myCollectionList)
    }
    
    public func printOne(jv: JSONCollectionStruct){
        print(jv)
    }
    
    public func convertWordCollectionsToJSONCollectionStructsAndEncode(wordCollectionList : [dWordCollection]){
        myCollectionList.removeAll()
        for collection in wordCollectionList{
            let jwcs = getJsonWordCollectionStructFromWordCollection(wordCollection: collection)
            myCollectionList.append(jwcs)
        }
        encodeWords()
    }
    
    public func encodeWordCollections(total: Int){
        clearWords()
        let storedCollectionList = [fiveSimpleVerbsCollection, carpenterWordCollection, chuckVerbCollection1, TenCommonVerbCollection, problemVerbCollection, verbPhraseCollection]
        
        for collection in storedCollectionList{
            myCollectionList.append(collection)
            if myCollectionList.count >= total {break}
            
//            print("encodeWordCollection \(collection.collectionName)")
        }
        encodeWords()
    }
    
    public func encodeWords(){
        //encode to JSON
        let encoder = JSONEncoder()
//        if let encodedPreps = try? encoder.encode(collectionName){
//            try? encodedPreps.write(to: getURL(), options: .noFileProtection)
//        }
        if let encodedPreps = try? encoder.encode(myCollectionList){
            try? encodedPreps.write(to: getURL(), options: .noFileProtection)
        }
    }

    public func getWordCollections()->[JSONCollectionStruct]{
        guard let data = try? Data(contentsOf: getURL()) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let wordCollectionData = try? decoder.decode([JSONCollectionStruct].self, from: data) else {
            fatalError("There was a problem decoding the data ... ")
        }
        myCollectionList = wordCollectionData
        return wordCollectionData
    }
    
//    func decodeWords(){
//        let decoder = JSONDecoder()
//
//        if let data = try? Data.init(contentsOf: getURL()){
//            if let decodedWords = try? decoder.decode([myCollectionList].self, from: data){
//                myCollectionList = decodedWords
//            }
//        }
//    }
    public func appendCollection(collection: JSONCollectionStruct){
        var appendThis = true
        for i in 0..<myCollectionList.count {
            let c = myCollectionList[i]
            if c.collectionName == collection.collectionName {
                myCollectionList.remove(at: i)
                myCollectionList.insert(collection, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myCollectionList.append(collection)}
        encodeWords()
    }
    public func clearWords(){
        myCollectionList.removeAll()
    }
    
    public func getJSONCollectionAt(index: Int)->JSONCollectionStruct{
        if index > myCollectionList.count-1 { return myCollectionList[0] }
        return myCollectionList[index]
    }
    
    public func getCollectionNameAt(index: Int)->String{
        if index > myCollectionList.count-1 {
            return myCollectionList[0].collectionName  //need a default
        }
        else {
//            let collection = myCollectionList[index]
            return myCollectionList[index].collectionName
        }
    }
    
    public func getCollectionCount()->Int{
        return myCollectionList.count
    }
     
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("JSONWordCollectionManager").appendingPathExtension("json")
    }
    
}
