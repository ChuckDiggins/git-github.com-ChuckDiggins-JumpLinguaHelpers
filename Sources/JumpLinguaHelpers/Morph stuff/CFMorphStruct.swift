//
//  CFMorphStruct.swift
//  ContextFree
//
//  Created by Charles Diggins on 7/5/21.
//

import Foundation


public struct CFMorphStep {
    public init(){}
    public var index : Int = -1
    public var phraseForm : String = ""
    public var comment1 : String = ""
    public var comment2 : String = ""
    public var comment3 : String = ""
    public var comment4 : String = ""
    public var part1 : String = ""
    public var part2 : String = ""
    public var part3: String = ""
    
    public func getStrings()->(String, String, String){
        return (part1, part2, part3)
    }
    
    public func getComments()->(String, String, String, String){
        return (comment1, comment2, comment3, comment4)
    }
}

//all the morphsteps should relate to a single person
public struct  CFMorphStruct {
    public init(){
        let ms = CFMorphStep()
        append(morphStep: ms)
    }
    public var currentIndex = 0
    public var morphArray = [CFMorphStep]()
    mutating public func clear(){ morphArray.removeAll() }
    mutating public func count()->Int { return morphArray.count}
    mutating public func append( morphStep : CFMorphStep ){
        morphArray.append(morphStep)
    }
    
    mutating public func getMorphStep(index : Int)-> CFMorphStep {
            if index == 0 && index < morphArray.count { return morphArray[index]}
            return CFMorphStep()
    }
}
