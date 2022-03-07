//
//  JSONLessonBundlePhraseCollectionManager.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/21/22.
//

import Foundation
import JumpLinguaHelpers

struct LessonBundlePhraseCollectionManager{
    
    var jsonDictionaryManager : JSONDictionaryManager
    private var randomWordLists : RandomWordLists
    
    var jsonWordCollectionManager = JSONCollectionManager()
    var jsonPhraseManager = JsonPhraseManager()
    var jsonBundleManager = JSONBundleManager()
    var wordCollectionManager = dWordCollectionManager()
    var phraseManager = dPhraseManager()
    var bundleManager = dBundleManager()

    public let bUseJsonStarterFiles = true
    
    init(jsonDictionaryManager: JSONDictionaryManager, randomWordLists: RandomWordLists){
        self.jsonDictionaryManager = jsonDictionaryManager
        self.randomWordLists = randomWordLists
    }

    
    mutating func loadJsonStuff(){
        //load word collections
        loadJsonWordCollections()
        //load phrases and clauses
        loadJsonPhrasesAndClauses()
        //load bundles
        loadJsonBundles()
        //load lessons
        
    }
    mutating func loadJsonPhrasesAndClauses(){
        if bUseJsonStarterFiles {
               jsonPhraseManager.encodeInternalPhrases(total: 2000)
           createPhrasesFromJsonPhrases()
           print("phraseManager phrase count = \(phraseManager.getClusterCount())")
       }
    }
    mutating func loadJsonBundles(){
        jsonBundleManager.encodeBundles(total: 2000)
        createBundlesFromJsonBundles()
        print("bundleManager bundle count = \(bundleManager.getBundleCount())")
    }
    
    mutating func createBundlesFromJsonBundles(){
        for jsonBundle in jsonBundleManager.myBundleList {
            let bundleName = jsonBundle.bundleName
            let idNum = jsonBundle.idNum
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
            let bundle = dBundle(idNum: idNum, teacher: teacher, bundleName: bundleName, tenseList: tenseList, collectionList: wordCollectionList, phraseList: phraseList)
            bundleManager.appendBundle(bundle: bundle)
        }
    }
    
       mutating func createPhraseFromJsonPhrase(jsonPhrase: JSONNamedLoadedPhrase)->dCluster{
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
   
       mutating func createPhrasesFromJsonPhrases(){
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

    mutating func loadJsonWordCollections(){
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
    
    mutating func createWordCollectionManagerFromJsonWordCollectionManager(){
        for jWordCollection in jsonWordCollectionManager.myCollectionList{
            var wordCollection = dWordCollection(idNum: jWordCollection.idNum, collectionName: jWordCollection.collectionName)
            for jws in jWordCollection.wordList {
                wordCollection.appendWord(word: jws.getWord())
            }
            wordCollectionManager.append(collection: wordCollection)
        }
    }
}
