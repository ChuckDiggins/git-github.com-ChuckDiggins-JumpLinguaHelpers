//
//  MorphStructManager.swift
//  MorphStructManager
//
//  Created by Charles Diggins on 11/28/21.
//

import Foundation

public struct MorphStructManager {
   
    var verbPhrase : String
    var tense : Tense
    
    public init(verbPhrase: String, tense: Tense){
        self.verbPhrase = verbPhrase
        self.tense = tense
    }
    
   private var morphStrList : [MorphStruct] = [
        MorphStruct(person: .S1),
        MorphStruct(person: .S2),
        MorphStruct(person: .S3),
        MorphStruct(person: .P1),
        MorphStruct(person: .P2),
        MorphStruct(person: .P3)
    ]
    
    private var initialMorphStrList : [MorphStruct] = [
        MorphStruct(person: .S1),
        MorphStruct(person: .S2),
        MorphStruct(person: .S3),
        MorphStruct(person: .P1),
        MorphStruct(person: .P2),
        MorphStruct(person: .P3)
    ]
    
    var currentMorphStepIndex = [0,0,0,0,0,0]
    var isCompleted = [false, false, false, false, false, false]
    
    public mutating func setInfo(verbPhrase: String, tense: Tense){
        self.verbPhrase = verbPhrase
        self.tense = tense
    }
    
    public mutating func set(index: Int, ms: MorphStruct){
        if inRange(index: index) {
            morphStrList[index] = ms
        }
    }
    
    public mutating func set(person: Person, ms: MorphStruct){
        morphStrList[person.getIndex()] = ms
    }
    
    //sets both to initial state
    public mutating func initialize(person: Person, ms: MorphStruct){
        initialMorphStrList[person.getIndex()] = ms
        morphStrList[person.getIndex()] = ms
    }
    
    //sets both to initial state
    public mutating func clearAll(){
        for person in Person.all {
            morphStrList[person.getIndex()].clear()
            initialMorphStrList[person.getIndex()].clear()
        }
    }
    
    public mutating func setBoth(person: Person, ms: MorphStruct){
        morphStrList[person.getIndex()] = ms
        initialMorphStrList[person.getIndex()] = ms
    }
    
    
    public mutating func get(index: Int)->MorphStruct{
        if inRange(index: index) {
            let person = Person(rawValue: index) ?? Person.S1
            if person == morphStrList[index].person {
                return morphStrList[index]
            }
        }
        return MorphStruct(person: .S1)
    }
    
    public mutating func get(person: Person)->MorphStruct{
        let index = person.getIndex()
            return morphStrList[index]
    }
    
    public mutating func getFinalVerbForm(person: Person)->String{
        get(person: person).finalVerbForm()
    }
    
    public mutating func hasFinalVerbForm(person: Person)->Bool{
        get(person: person).isComplete()
    }
    
    public func inRange(index: Int)->Bool{
        if index >= 0 && index < 6 {return true}
        return false
    }
    
    public mutating func restoreToInitialState(){
        for person in Person.all {
            var ms = get(person: person)
            ms.copyContents(input: initialMorphStrList[person.getIndex()])
            currentMorphStepIndex[person.getIndex()] = get(person: person).count()-1
        }
    }
    
    public mutating func appendMorphStepToBoth(person: Person, morphStep: MorphStep){
        morphStrList[person.getIndex()].append(morphStep: morphStep)
        initialMorphStrList[person.getIndex()].append(morphStep: morphStep)
    }
    
    public mutating func appendMorphStep(person: Person, morphStep: MorphStep){
        morphStrList[person.getIndex()].append(morphStep: morphStep)
        currentMorphStepIndex[person.getIndex()] = morphStrList[person.getIndex()].count()-1
    }
    
    public mutating func clearMorphSteps(person: Person){
        morphStrList[person.getIndex()].clear()
    }
    
    public func getMorphStepCount(person: Person)->Int {
        return  morphStrList[person.getIndex()].count()
    }
    
    public mutating func getMorphStep(person: Person, index: Int)->MorphStep {
        get(person: person).getMorphStep(index: index)
    }
     
    public mutating func getCurrentMorphStep(person: Person)->MorphStep {
        if getCurrentMorphStepIndex(person: person) == getMorphStepCount(person: person)-1 {isCompleted[person.getIndex()] = true}
        return get(person: person).getMorphStep(index: currentMorphStepIndex[person.getIndex()])
    }
    
    public mutating func getCurrentMorphStepAndIncrementIndex(person: Person)->MorphStep {
        let ms = getCurrentMorphStep(person: person)
        incrementMorphStepIndex(person: person)
        return ms
    }
    
    public mutating func isCurrentMorphStepFinal(person: Person)->Bool{
        return isCompleted[person.getIndex()]
    }
    
    public func getCurrentMorphStepIndex(person: Person)->Int{
        currentMorphStepIndex[person.getIndex()]
    }
    
    public mutating func incrementMorphStepIndex(person: Person){
        let personIndex = person.getIndex()
        if currentMorphStepIndex[personIndex] < getMorphStepCount(person: person)-1 {
            currentMorphStepIndex[personIndex] += 1
        }
    }
    
    public mutating func getNextMorphStep(person: Person)->MorphStep{
        return getMorphStep(person: person, index: currentMorphStepIndex[person.getIndex()])
    }
    
    public mutating func resetCurrentMorphStepIndices(){
        for person in Person.all {
            resetCurrentMorphStepIndex(person: person)
            isCompleted[person.getIndex()] = false
        }
    }
    
    public mutating func resetCurrentMorphStepIndex(person: Person){
        currentMorphStepIndex[person.getIndex()] = 0
        isCompleted[person.getIndex()] = false
    }
    
    public func dumpSkinny(message: String){
        print ( "\n \(message)" )
        print("MSM dumpSkinny: \(verbPhrase), Tense\(tense.rawValue) ")
        for p in Person.allCases {
            let pIndex = p.getIndex()
            print ("MorphStep - \(pIndex):  step count: \(getMorphStepCount(person: p))")
        }
    }
    
    
    
    public mutating func dumpVerboseForPerson(p: Person, message: String){
        print ( message )
        print("\nMSM dumpVerboseForPerson: For \(verbPhrase), \(tense.rawValue) tense")
        
        print("\n ...... \(p.getIndex()).  person \(p.getMaleString())")
        for msIndex in 0 ..< getMorphStepCount(person:p){
            let ms = getMorphStep(person: p, index: msIndex)
            ms.dumpThyself(message: "\(msIndex)")
        }
        
    }
}
