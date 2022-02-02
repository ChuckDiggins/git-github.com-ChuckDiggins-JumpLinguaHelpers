//
//  CFGrammarLibrary.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/10/21.
//

import Foundation

public struct CFGrammarLibrary {
    public init(){}
    public var nounPhraseGrammar = ContextFreeGrammar()
    public var verbPhraseGrammar = ContextFreeGrammar()
    public var prepositionalPhraseGrammar = ContextFreeGrammar()
    public var adjectivePhraseGrammar = ContextFreeGrammar()
}

public struct GnosticGrammarLibrary {
    let language : LanguageType
    public init(language: LanguageType )
    {
        self.language = language
    }
    
    public var nounPhraseGrammar = ContextFreeGrammar()
    public var verbPhraseGrammar = ContextFreeGrammar()
    public var prepositionalPhraseGrammar = ContextFreeGrammar()
    public var adjectivePhraseGrammar = ContextFreeGrammar()
}

