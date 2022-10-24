//
//  VerbManager.swift
//  VerbManager
//
//  Created by Charles Diggins on 11/2/21.
//

import Foundation

public struct VerbModelManager{
    public var romanceVerbModel = RomanceVerbModel()
    public var englishVerbModel = EnglishVerbModel()
    public var modelName = ""
    
    public init(){}
    
    public mutating func analyzeAndCreateBVerb_SPIFE(language: LanguageType, verbPhrase: String)->(isValid: Bool, verb: BVerb){
        var verb = BVerb()
        
        switch language {
        case .Spanish:
            verb = createSpanishBVerb(verbPhrase: verbPhrase)
            return (true, verb)
        case .French:
            verb = createFrenchBVerb(verbPhrase: verbPhrase)
            return (true, verb)
        case .English:
            verb = createEnglishBVerb(verbPhrase: verbPhrase, separable: .separable)
            return (true, verb)
        default:
            return (false, BVerb())
        }
        
    }

    
    public mutating func createEnglishBVerb(verbPhrase: String, separable: Separable ) -> BEnglishVerb {
        let brv = BEnglishVerb(verbPhrase : verbPhrase, separable: separable)
        englishVerbModel = m_englishVerbModelConjugation.getVerbModel(verbWord: brv.m_verbWord)
        brv.setModel(verbModel : englishVerbModel)
        modelName = brv.getBescherelleInfo()
        return brv
    }

    public mutating func createSpanishBVerb(verbPhrase: String) -> BSpanishVerb {
        let brv = BSpanishVerb(verbPhrase : verbPhrase)
        romanceVerbModel = m_spanishVerbModelConjugation.getVerbModel(language: .Spanish, verbWord: brv.m_verbWord)
        brv.setPatterns(verbModel : romanceVerbModel)
        modelName = brv.getBescherelleInfo()
        return brv
    }
    
    public mutating func createFrenchBVerb(verbPhrase: String) -> BFrenchVerb {
        let brv = BFrenchVerb(verbPhrase : verbPhrase)
        let verbModel = m_frenchVerbModelConjugation.getVerbModel(language: .French, verbWord: brv.m_verbWord)
        brv.setPatterns(verbModel : verbModel)
        modelName = brv.getBescherelleInfo()
        return brv
    }
    
}
