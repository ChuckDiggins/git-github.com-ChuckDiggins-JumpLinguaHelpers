//
//  JSONUtilities.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/20/22.
//

import Foundation
import JumpLinguaHelpers

func getJsonWord(word: Word)->JSONWord{
    return JSONWord(spanish: word.spanish, english: word.english, french: word.french, wordType: getStringFromWordType(wordType: word.wordType))
}

func getJsonWordCollectionStructFromWordCollection(wordCollection: dWordCollection)->JSONCollectionStruct{
    var jwc = JSONCollectionStruct(idNum: wordCollection.idNum, collectionName: wordCollection.collectionName)
    for word in wordCollection.wordList{
        jwc.appendJsonWord(jw: getJsonWord(word: word))
    }
    return jwc
}
