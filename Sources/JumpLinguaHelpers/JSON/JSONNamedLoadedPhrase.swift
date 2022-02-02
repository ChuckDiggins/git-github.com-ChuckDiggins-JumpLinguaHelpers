//
//  JsonNamedPhrase.swift
//  ContextFree
//
//  Created by Charles Diggins on 7/21/21.
//

import Foundation

//import UIKit

public struct JSONNamedLoadedPhrase: Codable {
    public var language: String //agnostic means any language, otherwise it is language-specific
    public var phraseType : String
    public var phraseName: String
    public var wordList =  [JSONWord]()  //for use when this is a single
    public var isSingle = false
    public var clusterList: [Cluster]
    
    public struct Cluster: Codable {
        var wordType: String  //if not named, then this is a single
        var clusterName: String?  //if named, then this is a phrase
        var isSubject: Bool
    }
    
    public init(language: LanguageType, phraseType: ContextFreeSymbol, phraseName: String, clusterList : [Cluster], wordList : [JSONWord]){
        self.language = language.rawValue
        self.phraseType = phraseType.rawValue
        self.phraseName = phraseName
        self.clusterList = clusterList
        self.wordList = wordList
    }
    
    public  init(language: LanguageType, phraseType: ContextFreeSymbol, phraseName: String, clusterList : [Cluster]){
        self.language = language.rawValue
        self.phraseType = phraseType.rawValue
        self.phraseName = phraseName
        self.clusterList = clusterList
    }
    
    public init(language: String, phraseType: String, phraseName: String, clusterList : [Cluster]){
        self.language = language
        self.phraseType = phraseType
        self.phraseName = phraseName
        self.clusterList = clusterList
    }
    
    public init(){
        language = ""
        phraseType =  " "
        phraseName = ""
        self.clusterList = [Cluster]()
    }
    
    public func createCluster()->dCluster{
        var newCluster = dCluster()
        
        switch phraseType{
        case "NP": newCluster = dNounPhrase()
        case "VP": newCluster = dVerbPhrase()
        case "N":
            newCluster = dNounSingle()
        case "V": newCluster = dVerbSingle()
        default: break
        }
        if clusterList.count > 0 {
            var subCluster = dCluster()
            for _ in clusterList {
                switch phraseType{
                case "NP": subCluster = dNounPhrase()
                case "VP": subCluster = dVerbPhrase()
                case "PP": subCluster = dPrepositionPhrase()
                case "N": subCluster = dNounSingle()
                case "V": subCluster = dVerbSingle()
                case "Adj": subCluster = dAdjectiveSingle()
                case "Det": subCluster = dDeterminerSingle()
                case "P": subCluster = dPrepositionSingle()
                default: break
                }
                newCluster.appendCluster(cluster: subCluster)
            }
        }
        return newCluster
    }
    
    public func wordListCount()->Int{
        return wordList.count
    }
}


var myPhraseList: [JSONNamedLoadedPhrase] = [
    JSONNamedLoadedPhrase(language: .Agnostic, phraseType: .N, phraseName: "Breakfast noun single",
               clusterList: [
                JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: true)
               ],
                          wordList : [
                               JSONWord(spanish: "pimienta", english: "pepper",    french: "poivre", wordType: "noun"),
                               JSONWord(spanish: "azúcar", english: "sugar",    french: "sucre", wordType: "noun"),
                          ]),
    
    JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "NP", phraseName: "Simple article-noun phrase",
               clusterList: [
                            JSONNamedLoadedPhrase.Cluster(wordType: "Art", isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: true)
                            ]),
    
    JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "NP", phraseName: "Simple article-noun-adjective phrase",
               clusterList: [
                            JSONNamedLoadedPhrase.Cluster(wordType: "Art", isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false)
               ]),
    
    JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "NP", phraseName: "Simple article-noun-adj-conj-adj phrase",
               clusterList: [
                            JSONNamedLoadedPhrase.Cluster(wordType: "Art", isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "N",isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "C",isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "Adj",isSubject: false)
               ]),
    
    JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "PP", phraseName: "Simple preposition phrase",
            clusterList: [
                            JSONNamedLoadedPhrase.Cluster(wordType: "P", isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "NP", clusterName: "Simple article-noun-adj-conj-adj phrase", isSubject: false),
                            ]),
    
    JSONNamedLoadedPhrase(language: "Agnostic", phraseType: "VP", phraseName: "Simple verb phrase",
            clusterList: [
                            JSONNamedLoadedPhrase.Cluster(wordType: "V", isSubject: false),
                            JSONNamedLoadedPhrase.Cluster(wordType: "PP", clusterName: "Simple preposition phrase", isSubject: false),
                            ])
]
