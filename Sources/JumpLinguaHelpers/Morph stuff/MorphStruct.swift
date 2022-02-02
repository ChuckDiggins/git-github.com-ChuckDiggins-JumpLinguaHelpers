//
//  MorphStruct.swift
//  MorphStruct
//
//  Created by Charles Diggins on 12/2/21.
//

import Foundation


//all the morphsteps should relate to a single person
public struct MorphStruct  {
    public var currentIndex = 0
    public var person = Person.S1
    public var morphStepArray = [MorphStep]()
    public var isOrtho = false
    public var isStem = false
    public var isIrreg = false
    public var isValid = false
    public var conjugationComplete = false
    
    public init (person: Person){
        self.person = person
        isValid = false
        conjugationComplete = false
    }
    
    public func getPerson()->Person{ return person }
    public mutating func clear(){ morphStepArray.removeAll() }
    public func count()->Int { return morphStepArray.count}
    public mutating func append( morphStep : MorphStep ){
        morphStepArray.append(morphStep)
        isValid = true
    }
    
    public func getMorphStepCount()->Int{
        morphStepArray.count
    }
    
    public func isOrthoChanging()->Bool{
        for morph in morphStepArray {
            if ( morph.isOrthoPresent || morph.isOrthoPreterite ){
                return true
            }
        }
        return false
    }
    
    public func isStemChanging()->Bool{
        for morph in morphStepArray {
            if ( morph.isStem || morph.isPretStem || morph.isPretStem2 || morph.isPretStem3  ){
                return true
            }
        }
        return false
    }
    
    public func isIrregular()->Bool{
        for morph in morphStepArray {
            if ( morph.isIrregular || morph.isFutureStem ){
                return true
            }
        }
        return false
    }

    public mutating func createAndAppendMorphStep(verbForm:String, isFinalStep: Bool, comment:String, preposition:String, part1: String, part2:String, part3:String )->Int{
        let ms = MorphStep(verbForm:verbForm, isFinalStep: isFinalStep, comment:comment, preposition:preposition, part1: part1, part2: part2, part3: part3)
        morphStepArray.append(ms)
        isValid = true
        return morphStepArray.count
    }
    
    //append all of the morphSteps in the incoming struct with the existing morphStep array
    
    public mutating func appendMorphStruct(morphStruct: MorphStruct){
        for morph in morphStruct.morphStepArray {
            morphStepArray.append(morph)
        }
    }
    
    public mutating func copyContents(input: MorphStruct){
        for i in 0..<input.count() {
            let morphStep = input.getMorphStep(index: i)
            let ms = MorphStep(verbForm: morphStep.verbForm, isFinalStep: morphStep.isFinalStep, comment: morphStep.comment, preposition: morphStep.preposition, part1: morphStep.part1, part2: morphStep.part2, part3: morphStep.part3)
            morphStepArray.append(ms)
        }
    }
    
    public mutating func copyContentsSetFlag(input: MorphStruct, morphFlag : MorphFlag){
        for i in 0..<input.count() {
            let morphStep = input.getMorphStep(index: i)
            var ms = MorphStep(verbForm: morphStep.verbForm, isFinalStep: morphStep.isFinalStep, comment: morphStep.comment, preposition: morphStep.preposition, part1: morphStep.part1, part2: morphStep.part2, part3: morphStep.part3)
            ms.setTrue(flag: morphFlag)
            morphStepArray.append(ms)
        }
    }
    
//    func hasEnding()->Bool{
//        if ( morphStepArray.count == 0 ){ return false }
//        return conjugationComplete
//
//    }
    
    public func isComplete()->Bool{
        if getMorphStepCount() > 0 {
            return getMorphStep(index: getMorphStepCount()-1).isFinalStep
        }
        return false
    }
    
    public func startVerbForm()->String {
        return getMorphStep(index: 0).verbForm
    }
    
    public func currentMorphForm()->String {
        return getMorphStep(index: currentIndex).verbForm
    }
    
    public func currentMorphComment()->String {
        return getMorphStep(index: currentIndex).comment
    }
  
    public mutating func incrementIndex(){
        if ( currentIndex < morphStepArray.count-1 ){
            currentIndex += 1
        }
        //reset
        else {
            currentIndex = 0
        }
    }
    
    public func getMorphIndex()-> Int {
        return currentIndex
    }
    
    public func isFinalMorphStep()->Bool{
        if currentIndex == morphStepArray.count-1 {return true}
        return false
    }
    
    public mutating func resetMorphIndex(){
        currentIndex = 0
    }
    
    public func finalVerbForm()->String {
        if ( morphStepArray.count > 0) {
            return getMorphStep(index: morphStepArray.count-1).verbForm.lowercased()
        }
        return ""
    }
    
    public func getCurrentMorphStep()->MorphStep {
        return getMorphStep(index: currentIndex)
    }
    
    public func getMorphStep(index : Int)-> MorphStep {
        if ( morphStepArray.isEmpty) {
            return MorphStep()
        }
        if index == 0 || index < morphStepArray.count { return morphStepArray[index]}
        return MorphStep()
    }
    
    public func getPersonIndex()->Int {
        return person.rawValue
    }

}
