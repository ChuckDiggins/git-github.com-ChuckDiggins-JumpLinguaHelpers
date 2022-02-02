//
//  MiscSentenceStructs.swift
//  MiscSentenceStructs
//
//  Created by Charles Diggins on 11/26/21.
//

import Foundation

public struct VerbSettings{
    public init(tense: Tense, person: Person){
        self.tense = tense
        self.person = person
    }
    public var tense : Tense
    public var person : Person
}

public struct NounSettings{
    public init(number: Number){
        self.number = number
    }
    public var number : Number
}

public struct SentenceData {
    public init(){}
    public var word = Word()
    public var data = WordStateData()
}
