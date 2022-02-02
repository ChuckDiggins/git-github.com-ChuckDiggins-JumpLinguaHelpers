//
//  EnumsVerbTypeCategory.swift
//  EnumsVerbTypeCategory
//
//  Created by Charles Diggins on 11/26/21.
//

import Foundation

public enum VerbTypeCategory: Int, CaseIterable, Identifiable {
    case ARCategory = 0
    case ERCategory
    case IRCategory
    case StemChangingCategory
    case OrthoChangingCategory

    public var id: VerbTypeCategory {
        self
    }

    var literal: String {
        switch self {
        case .ARCategory: return "AR verbs"
        case .ERCategory: return "ER verbs"
        case .IRCategory: return "IR verbs"
        case .StemChangingCategory: return "Stem-changing verbs"
        case .OrthoChangingCategory: return "Ortho-changing verbs"
        }
    }
}

public enum VerbProperties : Int, CaseIterable {
    case AR
    case ER
    case IR
    case Reflexive
    case VerbPhrase
    case StemChanging
    case OrthoChanging
    case Irregular
    case Simple
    case Auxiliary


    public func getString()->String {
        switch self {
        case .AR: return "AR ending"
        case .ER: return "ER ending"
        case .IR: return "IR ending"
        case .StemChanging: return "Stem changing"
        case .Irregular: return "Irregular"
        case .OrthoChanging: return "Orthographic changing"
        case .Simple: return "Simple"
        case .Auxiliary: return "Auxiliary"
        case .Reflexive: return "Reflexive"
        case .VerbPhrase: return "Phrase"
        }
    }
}
