//
//  BundleManager.swift
//  BundleManager
//
//  Created by Charles Diggins on 1/28/22.
//

import Foundation

//manages JSONBundles for the project

public class JSONBundleManager: Codable {
     
    var myBundleList = [JSONBundle]()
    
    public func printWords(){
        print(myBundleList)
    }
    
    public func printOne(jb: JSONBundle){
        print(jb)
    }
    
    public func encodeBundles(total: Int){
        clearWords()
        let storedBundleList = [capituloTres, chuckBundle1]
        
        for bundle in storedBundleList{
            myBundleList.append(bundle)
            if myBundleList.count >= total {break}
            
            print("encodeBundle: \(bundle.bundleName)")
        }
        encodeBundles()
    }
    
    public func encodeBundles(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedPreps = try? encoder.encode(myBundleList){
            try? encodedPreps.write(to: getURL(), options: .noFileProtection)
        }
        print("Bundles encoded successfully")
    }

    public func getBundles()->[JSONBundle]{
        guard let data = try? Data(contentsOf: getURL()) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let bundleData = try? decoder.decode([JSONBundle].self, from: data) else {
            fatalError("There was a problem decoding the data ... ")
        }
        myBundleList = bundleData
        return bundleData
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

    public func appendBundle(bundle: JSONBundle){
        var appendThis = true
        for i in 0..<myBundleList.count {
            let b = myBundleList[i]
            if b.bundleName == bundle.bundleName {
                myBundleList.remove(at: i)
                myBundleList.insert(bundle, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myBundleList.append(bundle)}
        encodeBundles()
    }
    public func clearWords(){
        myBundleList.removeAll()
    }
    
    public func getJSONBundleAt(index: Int)->JSONBundle{
        if index > myBundleList.count-1 { return myBundleList[0] }
        return myBundleList[index]
    }
    
    public func getBundleNameAt(index: Int)->String{
        if index > myBundleList.count-1 {
            return myBundleList[0].bundleName  //need a default
        }
        else {
            return myBundleList[index].bundleName
        }
    }
    
    public func getCollectionCount()->Int{
        return myBundleList.count
    }
     
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("JSONBundleManager").appendingPathExtension("json")
    }
    
}

