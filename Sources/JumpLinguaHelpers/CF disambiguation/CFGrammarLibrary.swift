//
//  CFGrammarLibrary.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/10/21.
//

import Foundation

public struct CFGrammarLibrary {
    public init(){}
    var nounPhraseGrammar = ContextFreeGrammar()
    var verbPhraseGrammar = ContextFreeGrammar()
    var prepositionalPhraseGrammar = ContextFreeGrammar()
    var adjectivePhraseGrammar = ContextFreeGrammar()
}

public struct GnosticGrammarLibrary {
    let language : LanguageType
    public init(language: LanguageType )
    {
        self.language = language
    }
    
    var nounPhraseGrammar = ContextFreeGrammar()
    var verbPhraseGrammar = ContextFreeGrammar()
    var prepositionalPhraseGrammar = ContextFreeGrammar()
    var adjectivePhraseGrammar = ContextFreeGrammar()
}

