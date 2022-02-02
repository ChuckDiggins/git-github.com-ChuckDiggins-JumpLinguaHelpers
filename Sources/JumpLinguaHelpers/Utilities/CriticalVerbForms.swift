//
//  CriticalVerb.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 2/27/21.
//

import Foundation

public struct CriticalStruct {
    public let person : Person
    public let tense : Tense
    public var verbForm : String
    public var comment : String
    
    public init(person: Person, tense: Tense, verbForm: String, comment: String){
        self.person = person
        self.tense = tense
        self.verbForm = verbForm
        self.comment = comment
    }
    
    init(){
        self.person = Person.S1
        self.tense = Tense.present
        self.verbForm = ""
        self.comment = ""
    }
}

public struct CriticalVerbForms  {
    public init(){}
    public var criticalVerbForms = [CriticalStruct]()
    
    public mutating func clearAll(){
        criticalVerbForms.removeAll()
    }
    
    public mutating func appendCriticalForm(person: Person, tense: Tense, comment: String){
        criticalVerbForms.append( CriticalStruct( person: person, tense: tense, verbForm: "PlaceHolder",
                                             comment: comment  ))
    }
    public func getCriticalStruct(index: Int)->(CriticalStruct){
        return criticalVerbForms[index]
    }
    
    public func count()->Int {
        return criticalVerbForms.count
    }
    
    public func at(index: Int)-> CriticalStruct {
        return criticalVerbForms[index]
    }
    
    public mutating func put(index: Int, criticalStruct: CriticalStruct){
        criticalVerbForms[index] = criticalStruct
    }
    
    public func getCriticalVerbForms()->([CriticalStruct]){
        return criticalVerbForms
    }
    
}
