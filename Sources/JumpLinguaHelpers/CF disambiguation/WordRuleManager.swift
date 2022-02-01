//
//  EnglishGrammarExamples.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/3/21.
//

import Foundation

//this is a list of ContextFreeSymbolStructs

public struct WordRuleManager {
    var phraseType : ContextFreeSymbol
    var phraseHead : ContextFreeSymbolStruct
    var ruleList = Array<ContextFreeRule>()
    
    public init(phraseType: ContextFreeSymbol, cfss: ContextFreeSymbolStruct){
        self.phraseType = phraseType
        phraseHead = cfss
    }
    
    public mutating func initial(cfss: ContextFreeSymbolStruct){
        ruleList.removeAll()
        phraseHead = cfss
        //phraseList.append(ContextFreeSymbol.arrow)
    }
    
    public mutating func appendRule(cfr: ContextFreeRule){
        ruleList.append(cfr)
    }
    
    public mutating func getRuleCount()->Int{
        ruleList.count
    }
    
    /*
    mutating func sentenceHasRule(sentence: dSentence, cfRule : ContextFreeRule, startIndex : Int)->Int{
        let cfSymbolStructCount = cfRule.getSymbolStructCount()
        var matchCount = 0
        let wordTypeList = cfRule.getRuleWordTypes()
        var headWordStruct = cfRule.getHeadCFSymbolStruct()
        var headWord = Word()
        let clusterCount = sentence.getClusterCount()
        let clusterList = sentence.getClusterList()
        var newPhrase : dPhrase
        
        for i in startIndex ..< clusterCount {
            matchCount = 0
            for j in 0 ..< cfSymbolStructCount{
                if (i + j) >= clusterCount {break}
                if clusterList[i+j].getWordType() == wordTypeList[j]{
                    matchCount += 1
                }
                else {
                    break
                }
            }
            //if match, then fill this current rule shell with word data
            
            if matchCount == cfSymbolStructCount {
                newPhrase = dPhrase(word: headWordStruct.getWord(), clusterType: headWordStruct.getSymbol())
                for j in 0 ..< cfSymbolStructCount{
                    newPhrase.appendCluster(cluster: clusterList[i+j])
                }
                sentence.replaceClusterRange(firstIndex: i, lastIndex: i+matchCount-1, cluster: newPhrase)
                return startIndex + 1
            }
        }
        return -1
    }
    */
    /*
    mutating func replaceCluster(sentence: dSentence, indexFrom : Int, indexTo : Int, replaceRule : ContextFreeRule)->ContextFreeRule{
        
        var replaceRuleCopy = replaceRule
        var rp = replaceRuleCopy.getHeadWordType()
        for i in indexFrom...indexTo {
            var rh = ruleList[indexFrom].getHeadWordType()
            if rh == rp {
                replaceRuleCopy.setHeadWord(word: ruleList[indexFrom].getHeadWord())
            }
            ruleList.remove(at: indexFrom)
        }
        ruleList.insert(replaceRuleCopy, at: indexFrom)
        return replaceRuleCopy
    }
    */

       
    public func getRuleString()->String{
        var ruleString = ""
        ruleString = phraseHead.getSymbolString()
        ruleString += " -> "
        for rule in ruleList {
            let str = rule.getSymbolString()
            ruleString.append(str)
        }
        return ruleString
    }
    

}//
