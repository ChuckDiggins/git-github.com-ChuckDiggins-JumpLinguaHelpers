//
//  MorphStep.swift
//  MorphStep
//
//  Created by Charles Diggins on 12/2/21.
//

import Foundation

public enum MorphFlag {
    case orthoPresent
    case orthoPreterite
    case stem
    case pretStem
    case pretStem2
    case pretStem3
    case irregular
    case futureStem
}

public struct MorphStep : Equatable {
    var verbForm : String = ""
    var comment : String = ""
    var part1 : String = ""
    var part2 : String = ""
    var part3: String = ""
    var isFinalStep = false
    var preposition : String = ""
    var isOrthoPresent = false
    var isOrthoPreterite = false
    var isStem = false
    var isPretStem = false
    var isPretStem2 = false
    var isPretStem3 = false
    var isIrregular = false
    var isFutureStem = false

    public mutating func setTrue (flag : MorphFlag ){
        switch (flag){
        case .orthoPresent:
            isOrthoPresent = true
        case .orthoPreterite:
            isOrthoPreterite = true
        case .stem:
            isStem = true
        case .pretStem:
            isPretStem = true
        case .pretStem2:
            isPretStem2 = true
        case .pretStem3:
            isPretStem3 = true
        case .irregular:
            isIrregular = true
        case .futureStem:
            isFutureStem = true
        }
    }
    
    public static func ==(lhs: MorphStep, rhs: MorphStep)->Bool{
        return lhs.verbForm == rhs.verbForm && lhs.comment == rhs.comment
    }
    
    public init(verbForm:String, isFinalStep: Bool, comment:String, preposition:String, part1:String, part2:String, part3:String){
        self.verbForm = verbForm
        self.isFinalStep = isFinalStep
        self.comment = comment
        self.preposition = preposition
        self.part1 = part1
        self.part2 = part2
        self.part3 = part3
        self.isOrthoPresent = false
        self.isOrthoPreterite = false
        self.isStem = false
        self.isPretStem = false
        self.isPretStem2 = false
        self.isPretStem3 = false
        self.isIrregular = false
        self.isFutureStem = false
    }
    
    public init(){
        self.verbForm = ""
        self.isFinalStep = false
        self.comment  = ""
        self.preposition  = ""
        self.part1 = ""
        self.part2 = ""
        self.part3 = ""
        self.isOrthoPresent = false
        self.isOrthoPreterite = false
        self.isStem = false
        self.isPretStem = false
        self.isPretStem2 = false
        self.isPretStem3 = false
        self.isIrregular = false
        self.isFutureStem = false
    }
    
    public func dumpThyself(message: String){
        print("\(message): verbForm \(verbForm): comment \(comment)")
        print("     Part1: \(part1),   Part2: \(part2), Part3:   \(part3)")
    }

}
