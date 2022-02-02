//
//  CFMorphModel.swift
//  ContextFree
//
//  Created by Charles Diggins on 7/10/21.
//

import Foundation

public enum MorphOperation : String {
    case remove
    case insertBefore
    case replace
    case move
    case grab
    case contract   //a + el = al, will + not = won't
    case convert   //from direct object phrase to direct object pronoun
    case append   //estoy comprando + lo = estoy comprándolo
    case none
}

public struct MorphOperationStruct{
    public init(){}
    public var morphOperation = MorphOperation.grab
    public var from = CFType.none
    public var to = CFType.none
    public var location = CFLocation.none
}

public struct MorphOperationJson : Codable{
    public let morphOperationString : String
    public let cfFromTypeString : String
    public let cfToTypeString : String
    public var locationString : String
    
    public init(morphOperation: String, cfFromTypeString: String, cfToTypeString: String){
        self.morphOperationString = morphOperation
        self.cfFromTypeString = cfFromTypeString
        self.cfToTypeString = cfToTypeString
        self.locationString = ""
    }
    
    public init(morphOperation: String, cfFromTypeString: String, locationString: String){
        self.morphOperationString = morphOperation
        self.cfFromTypeString = cfFromTypeString
        self.cfToTypeString = ""
        self.locationString = locationString
    }
}

public enum CFType {
    case none
    case literal     //any string, exclamation
    case punctuation
    case directObjectPhrase
    case indirectObjectPhrase
    case subjectPhrase
    case directObjectPronoun
    case indirectObjectPronoun
    case subjectPronoun
    case demonstrativePronoun //this one, that one
    case disjunctivePronoun   //disjunctive: after preposition, after C'est (FR)
    case adverbialPronoun   //y, en
    case possessivePronoun   //my, mine
    case followingAdjective  //for use in moving a following romance adjective to preceding english adjective
    case precedingAdjective  //for use in moving a following romance adjective to preceding english adjective
}

public enum CFLocation {
    case none
    case precedingVerb
    case insideVerb     //phrasal verbs in English
    case appendToVerb  //comprando + lo = comprándolo
    case precedingDOPronoun
    case afterDOPronoun
    case precedingClause
    case afterClause
    case afterSingle
    case beforeSingle
}


/*
 A CFMorphModel comprises a list of MorphPatterns
 Each pattern defines an operation
 Each operation involves an operation type plus one or two operands
 1.  single operand might be to insert a direct object pronoun before the clause verb
 2.  a double operand might be to convert a direct object to a direct object pronoun
 */

public struct CFMorphModel : Identifiable {
    public let id : Int
    public let modelName : String
    public var mpjList = [MorphOperationJson]()  //string version for reading and writing as JSON
    public var mpsList = [MorphOperationStruct]() //enum version
    
    public init(id: Int, modelName: String){
        self.id = id
        self.modelName = modelName
    }
    
    public mutating func appendOperation(mp : MorphOperationJson){
        mpjList.append(mp)
    }
    
    public mutating func unpackJSONOperationString(operation: String)->MorphOperation{
        var morphOperation : MorphOperation
        switch operation {
        case "remove" : morphOperation = .remove
        case "insert" : morphOperation  = .insertBefore
        case "replace" : morphOperation  = .replace
        case "move" : morphOperation  = .move
        case "grab" : morphOperation  = .grab
        case "contract" : morphOperation  = .contract
        case "convert" : morphOperation = .convert
        case "append" : morphOperation = .append
        default: morphOperation = .none
        }
        return morphOperation
    }
    
    public mutating func unpackJSONFromToString(fromToString: String)->CFType{
        var cfType : CFType
        switch fromToString{
        case "directObjectPhrase" : cfType = .directObjectPhrase
        case "subjectPhrase" : cfType = .subjectPhrase
        case "indirectObjectPhrase" : cfType = .indirectObjectPhrase
        case "directObjectPronoun" : cfType = .directObjectPronoun  //for removing
        case "subjectPronoun" : cfType = .subjectPronoun
        case "indirectObjectPronoun" :  cfType = .indirectObjectPronoun
        case "demonstrativePronoun" : cfType = .demonstrativePronoun //this one, that one
        case "disjunctivePronoun" : cfType = .disjunctivePronoun    //disjunctive: after preposition, after C'est (FR)
        case "adverbialPronoun" : cfType = .adverbialPronoun   //y, en
        case "possessivePronoun" : cfType = .possessivePronoun   //my, mine
        case "followingAdjective" : cfType = .followingAdjective //
        case "literal" : cfType = .literal
        case "none" : cfType = .none
        default: cfType = .none
        }
        return cfType
    }
    
    public mutating func unpackJSONLocation(locationString: String)->CFLocation{
        var cfLocation : CFLocation
        switch locationString{
        case "precedingVerb" : cfLocation = .precedingVerb
        case "insideVerb" : cfLocation = .insideVerb
        case "appendToVerb" : cfLocation = .appendToVerb
        case "precedingDOPronoun" : cfLocation = .precedingDOPronoun
        case "afterDOPronoun" : cfLocation = .afterDOPronoun
        case "precedingClause" : cfLocation = .precedingClause
        case "afterClause" : cfLocation = .afterClause
        default: cfLocation = .none
        }
        return cfLocation
   
        /*
         case inFrontOfVerb
         case insideVerb     //phrasal verbs in English
         case inFrontOfPronoun
         case inFrontOfClause
         case atBackOfClause
         */
    }
    
    //mutating func parseMorphModel(){
    public mutating func unpackJSONOperations(){
        for mpj in mpjList {
            var mps = MorphOperationStruct()
            mps.morphOperation = unpackJSONOperationString(operation: mpj.morphOperationString)
            mps.from = unpackJSONFromToString(fromToString: mpj.cfFromTypeString)
            mps.to = unpackJSONFromToString(fromToString: mpj.cfToTypeString)
            mps.location = unpackJSONLocation(locationString: mpj.locationString)
            mpsList.append(mps)
        }
    }
}


