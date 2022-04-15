//
//  JSONLessonBundlePhraseCollectionManager.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/21/22.
//

import Foundation



public struct LessonBundlePhraseCollectionManager{
    
    public var jsonDictionaryManager : JSONDictionaryManager
    public var randomWordLists : RandomWordLists
    
    public var jsonWordCollectionManager = JSONCollectionManager()
    public var jsonPhraseManager = JsonPhraseManager()
    public var jsonBundleManager = JSONBundleManager()
    public var wordCollectionManager = dWordCollectionManager()
    public var phraseManager = dPhraseManager()
    public var bundleManager = dBundleManager()

    public let bUseJsonStarterFiles = true
    public var bLoadPhrases = true
    public var bLoadCollections = true
    public var bLoadBundles = true
    
    public init(jsonDictionaryManager: JSONDictionaryManager, randomWordLists: RandomWordLists){
        self.jsonDictionaryManager = jsonDictionaryManager
        self.randomWordLists = randomWordLists
    }

    
    public mutating func loadJsonStuff(loadBundles: Bool = true, loadPhrases: Bool = true, loadCollections: Bool = true){
        //load word collections
        if loadCollections { loadJsonWordCollections()}
        //load phrases and clauses
        if loadPhrases { loadJsonPhrasesAndClauses()}
        //load bundles
        if loadBundles { loadJsonBundles() }
        //load lessons
    }
    
    public mutating func loadJsonPhrasesAndClauses(){
        if bUseJsonStarterFiles {
               jsonPhraseManager.encodeInternalPhrases(total: 2000)
           createPhrasesFromJsonPhrases()
           print("phraseManager phrase count = \(phraseManager.getClusterCount())")
       }
    }
    public mutating func loadJsonBundles(){
        jsonBundleManager.encodeBundles(total: 2000)
        createBundlesFromJsonBundles()
        print("bundleManager bundle count = \(bundleManager.getBundleCount())")
    }
    
    public mutating func createBundlesFromJsonBundles(){
        for jsonBundle in jsonBundleManager.myBundleList {
            let bundleName = jsonBundle.bundleName
//            let idNum = jsonBundle.idNum
            let teacher = jsonBundle.teacher
            var tenseList = [Tense]()
            for str in jsonBundle.tenseList{
                let tense = getTenseFromString(str: str)
                tenseList.append(tense)
            }
            //look for phrases in phraseManager
            
            var phraseList = [dCluster]()
            for jsonPhrase in jsonBundle.phraseList{
                let name = jsonPhrase.phraseName
                let phrase = phraseManager.getClusterByName(clusterName: name)
                phraseList.append(phrase)
            }
            var wordCollectionList = [dWordCollection]()
            for jsonCollection in jsonBundle.collectionList{
                let name = jsonCollection.collectionName
                let collection = wordCollectionManager.getCollectionByName(collectionName: name)
                wordCollectionList.append(collection)
            }
            let bundle = dBundle(teacher: teacher, bundleName: bundleName, tenseList: tenseList, collectionList: wordCollectionList, phraseList: phraseList)
            bundleManager.appendBundle(bundle: bundle)
        }
    }
    
    public mutating func createPhraseFromJsonPhrase(jsonPhrase: JSONNamedLoadedPhrase)->dCluster{
       let clusterType = getClusterTypeFromString(str: jsonPhrase.phraseType)
           let np = dPhrase(randomWord: randomWordLists, phraseName: jsonPhrase.phraseName, phraseType: clusterType)
           //rebuild all of the member clusters from the jsonPhrase cluster list
           for jsonCluster in jsonPhrase.clusterList {
               np.appendCluster(cluster: randomWordLists.getAgnosticRandomWordAsSingle(wordType: getClusterTypeFromString(str: jsonCluster.wordType), isSubject:false))
               if jsonPhrase.wordListCount() > 0 {
                   for jsonWord in jsonPhrase.wordList{
                       let word = jsonDictionaryManager.getExistingWord(jsonWord: jsonWord)
                       np.appendWordToAssociatedWordList(word: word)
                   }
               }
           }
           return np
       }
   
    public mutating func createPhrasesFromJsonPhrases(){
           var np = dPhrase()
   
           for jsonPhrase in jsonPhraseManager.myList {
               let clusterType = getClusterTypeFromString(str: jsonPhrase.phraseType)
               //if rebuilding a phrase ...
               if (clusterType != .AMB){
                   np = dPhrase(randomWord: randomWordLists, phraseName: jsonPhrase.phraseName, phraseType: clusterType)
                   //rebuild all of the member clusters from the jsonPhrase cluster list
                   for jsonCluster in jsonPhrase.clusterList {
                       np.appendCluster(cluster: randomWordLists.getAgnosticRandomWordAsSingle(wordType: getClusterTypeFromString(str: jsonCluster.wordType), isSubject:false))
                       if jsonPhrase.wordListCount() > 0 {
                           for jsonWord in jsonPhrase.wordList{
                               let word = jsonDictionaryManager.getExistingWord(jsonWord: jsonWord)
                               np.appendWordToAssociatedWordList(word: word)
                           }
                       }
                   }
                   phraseManager.appendCluster(cluster: np)
               }
               //not legitimate phrase type
               else {
   
               }
           }
       }

    public mutating func loadJsonWordCollections(){
        //        jsonWordCollection.decodeWords()
        //        createWordGroupFromJsonWordCollection()
        //        if bUseJsonStarterFiles {
        //            jsonWordCollection.encodeInternalWords(total: 2000)
        //        }
        
        //encodes the already existing word collections
        if bUseJsonStarterFiles {
            jsonWordCollectionManager.encodeWordCollections(total: 2000)
        }
        createWordCollectionManagerFromJsonWordCollectionManager()
    }
    
    public mutating func createWordCollectionManagerFromJsonWordCollectionManager(){
        for jWordCollection in jsonWordCollectionManager.myCollectionList{
            var wordCollection = dWordCollection(collectionName: jWordCollection.collectionName)
            for jws in jWordCollection.wordList {
                wordCollection.appendWord(word: jws.getWord())
            }
            wordCollectionManager.append(collection: wordCollection)
        }
    }
}
