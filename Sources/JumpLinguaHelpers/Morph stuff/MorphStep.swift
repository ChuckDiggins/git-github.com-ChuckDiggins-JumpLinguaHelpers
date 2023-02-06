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
    case reflexive
}

public enum MorphComment: String {
    case appendEnding = "Append the ending ->"
    case appendPreteriteEnding = "Append special preterite ending ->"
    case changeStemFrom = "Change the stem from ->"
    case changeStemTo = "Change the stem to ->"
    case convertReflexivePronoun = "Convert to ->"
    case grabEnding = "Grab the ending ->"
    case grabInfinitive = "Grab the infinitive ->"
    case grabReflexivePronoun = "Grab the reflexive pronoun -> "
    case grabStem = "Grab the stem ->"
    case grabThis = "Grab this ->"
    case insertEstar = "Insert correct form of ESTAR "
    case insertHaber = "Insert correct form of HABER "
    case moveReflexivePronoun = "Move the reflexive pronoun"
    case removeStem = "Remove the stem ->"
    case removeEnding = "Remove ending ->"
    case removeLastLetter = "Remove last letter ->"
    case removeInfinitive = "Remove infinitive ->"
    case replaceWith = "Replace with ->"
    case replaceWithIrregular = "Replace with irregular form: "
    case replaceWithIrregularStem = "Replace with irregular stem: "
    case replaceWithOrthoForm = "Replace with spell-changing form: "
    case replaceWithPresentParticiple = "Replace with present participle "
    case replaceWithPastParticiple = "Replace with past participle "
    case replaceStemWith = "Replace stem ->"
    case replaceThisWith = "Replace ->"
    case startWith = "Start with "
    case startWithPretP3 = "Start with preterite ellos form: "
}

public func getMorphComment(_ morphComment: MorphComment, _ str1: String, str2: String = "")->String{
    let mc = morphComment.rawValue
    
    switch morphComment{
    case .appendEnding,
         .appendPreteriteEnding,
         .changeStemFrom,
         .changeStemTo,
         .grabEnding,
         .grabInfinitive,
         .grabReflexivePronoun,
         .grabStem,
         .grabThis,
         .insertEstar,
         .insertHaber,
         .removeEnding,
         .removeInfinitive,
         .removeLastLetter,
         .removeStem,
         .replaceWith,
         .replaceWithIrregular,
         .replaceWithIrregularStem,
         .replaceWithOrthoForm,
         .replaceWithPresentParticiple,
         .replaceWithPastParticiple,
         .startWith,
         .startWithPretP3
        : return mc + str1
    case .convertReflexivePronoun: return mc + str1 + "and move in front of the verb"
    case .moveReflexivePronoun: return mc + str1 + "in front of verb"
    case .replaceStemWith: return mc + str1 + " with " + str2
    case .replaceThisWith: return mc + str1 + " with " + str2
    }
}
public struct MorphStep : Equatable {
    public var verbForm : String = ""
    public var comment : String = ""
    public var part1 : String = ""
    public var part2 : String = ""
    public var part3: String = ""
    public var isFinalStep = false
    public var preposition : String = ""
    public var isOrthoPresent = false
    public var isOrthoPreterite = false
    public var isStem = false
    public var isPretStem = false
    public var isPretStem2 = false
    public var isPretStem3 = false
    public var isIrregular = false
    public var isFutureStem = false
    public var isVerbReflexive = false

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
        case .reflexive:
            isVerbReflexive = true
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
        self.isVerbReflexive = false
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
        self.isVerbReflexive = false
    }
    
    public func dumpThyself(message: String){
        print("\(message): verbForm \(verbForm): comment \(comment)")
        print("     Part1: \(part1),   Part2: \(part2), Part3:   \(part3)")
    }

}
