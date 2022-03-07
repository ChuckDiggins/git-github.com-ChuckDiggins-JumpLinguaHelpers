//
//  JSONBundleStructs.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/20/22.
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
