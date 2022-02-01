//
//  Bundle.swift
//  Bundle
//
//  Created by Charles Diggins on 1/28/22.
//

import Foundation

var breakfastNounSingle = JSONNamedLoadedPhrase(language: .Agnostic, phraseType: .N, phraseName: "Breakfast noun single",
                                                clusterList: [
                                                  JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: true)
                                                ],
                                                wordList : [
                                                  JSONWord(spanish: "pimienta", english: "pepper",    french: "poivre", wordType: "noun"),
                                                  JSONWord(spanish: "azúcar", english: "sugar",    french: "sucre", wordType: "noun"),
                                                ])
var breakfastVerbSingle = JSONNamedLoadedPhrase(language: .Agnostic, phraseType: .V, phraseName: "Breakfast verb single",
                                                clusterList: [
                                                  JSONNamedLoadedPhrase.Cluster(wordType: "V",isSubject: true)
                                                ],
                                                wordList : [
                                                  JSONWord(spanish: "comer", english: "eat", french: "manger", wordType: "verb"),
                                                  JSONWord(spanish: "beber", english: "drink", french: "boire", wordType: "verb"),
                                                ])

var chuckNamedUnloaded1 = JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "NP", phraseName: "Simple article-noun-adjective phrase",
                                             clusterList: [
                                                          JSONNamedLoadedPhrase.Cluster(wordType: "Art", isSubject: false),
                                                          JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: false),
                                                          JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false)
                                             ])

var chuckNamedUnloaded2 = JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "NP", phraseName: "Simple article-noun-adj-conj-adj phrase",
                                                clusterList: [
                                                             JSONNamedLoadedPhrase.Cluster(wordType: "Art", isSubject: false),
                                                             JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: false),
                                                             JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false),
                                                             JSONNamedLoadedPhrase.Cluster(wordType: "C",isSubject: false),
                                                             JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false)
                                                ])

var capituloTres = JSONBundle(idNum: 1, teacher: "Michelle Carpenter", bundleName: "Capitulo3",
                           tenseList : ["Present", "Imperfect"],
                           collectionList : [carpenterWordCollection],
                           phraseList : [ breakfastNounSingle, breakfastVerbSingle  ]
)

var chuckBundle1 = JSONBundle(idNum: 1, teacher: "Chuck Diggins", bundleName: "My bundle 1",
                           tenseList : ["Present", "Imperfect"],
                           collectionList : [carpenterWordCollection, threeSimpleVerbsCollection],
                           phraseList : [ chuckNamedUnloaded1, chuckNamedUnloaded2  ]
)


public struct dBundle : Equatable {
    public var idNum: Int
//    var language : String
    private var teacher : String
    private var bundleName : String
    private var tenseList = [Tense]()
    private var collectionList = [dWordCollection]()
    private var phraseList = [dCluster]()
    
    public init(){
        idNum = 0
        teacher = "no teacher"
        bundleName = "no bundle name"
    }
    
    public init(idNum: Int, teacher: String, bundleName: String, tenseList: [Tense], collectionList: [dWordCollection], phraseList : [dCluster]){
        self.idNum = idNum
        self.teacher = teacher
        self.bundleName = bundleName
        self.tenseList = tenseList
        self.collectionList = collectionList
        self.phraseList = phraseList
    }

    public static func == (lhs: dBundle, rhs: dBundle) -> Bool {
        return
            lhs.bundleName == rhs.bundleName && lhs.teacher == rhs.teacher
    }
    
    public mutating func replaceCollectionList(collectionList: [dWordCollection]){
        self.collectionList = collectionList
    }
    
    public mutating func appendCollection(collection: dWordCollection){
        collectionList.append(collection)
    }
    
    public func getCollectionList()->[dWordCollection]{
        return collectionList
    }
    
    public mutating func replacePhraseList(phraseList: [dCluster]){
        self.phraseList = phraseList
    }
    
    public mutating func appendPhrase(phrase: dCluster){
        phraseList.append(phrase)
    }
    
    public func getPhraseList()->[dCluster]{
        return phraseList
    }
    
    public func getName()->String{
        return bundleName
    }
    
    public func getTeacher()->String{
        return teacher
    }
    
    public func getTenseList()->[Tense]{
        return tenseList
    }
    
    public func getTenseCount()->Int{
        return tenseList.count
    }
    public func getPhraseCount()->Int{
        return phraseList.count
    }
    public func getCollectionCount()->Int{
        return collectionList.count
    }
    public func getTense(index: Int)->Tense{
        if index >= 0 && index < tenseList.count {return tenseList[index]}
        return .present
    }
    
    public func getPhrase(index: Int)->dCluster{
        if index >= 0 && index < phraseList.count {return phraseList[index]}
        return dCluster()
    }
    
    public func getWordCollection(index: Int)->dWordCollection{
        if index >= 0 && index < collectionList.count {return collectionList[index]}
        return dWordCollection()
    }
}

