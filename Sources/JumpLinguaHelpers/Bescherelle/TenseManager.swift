//
//  TenseManager.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/20/21.
//

import Foundation

public struct TenseManager {
    public var activated = [Bool]()
    public var tenseList = [Tense]()
    public var activatedIndex = 0
    public var currentTense = Tense.present
    public var currentTenseIndex = 0
    public var activeTenseList = [Tense.present, .preterite, .imperfect, .conditional, .future, .imperative, .presentSubjunctive, .imperfectSubjunctiveRA, ]
    
    //var currentTense = Tense.present
    
    public init(){
        for tense in Tense.allCases {
            activated.append(false)
            tenseList.append(tense)
        }
        //turn on all simple indicative tenses and all simple subjunctive tenses
        toggleAllSimpleIndicativeTenses()
//        toggleTense(tense: .presentPerfect)
        toggleTense(tense: .presentSubjunctive)
        toggleTense(tense: .imperfectSubjunctiveSE)
        toggleTense(tense: .imperative)
//        dumpTenseList()
    }

    public func dumpTenseList(){
        print("TenseManager.dumpTenseList")
        for tense in Tense.allCases {
            print("tense: \(tense.rawValue) ... activated \(isActivated(tense: tense))")
        }
    }
    
    public func getRandomTense()->Tense{
        let i = Int.random(in: 0 ..< activeTenseList.count)
        return activeTenseList[i]
    }
    
    public mutating func getNextTense()->Tense{
        if currentTenseIndex < activeTenseList.count-1 {
            currentTenseIndex = currentTenseIndex + 1
        } else {
            currentTenseIndex = 0
        }
        return activeTenseList[currentTenseIndex]
    }
    
    public func getCurrentTense()->Tense{
        currentTense
    }
    
    public func isActivated(tense: Tense)->Bool{
        return activated[tense.getIndex()]
    }
    
    public func getTense(tenseIndex: Int)->Tense{
        return tenseList[tenseIndex]
    }
    
   
    
    public func getActiveTenseList()->[Tense]{
        var outputTenseList = [Tense]()
        var index = 0
        for active in activated {
            if active {
                outputTenseList.append(tenseList[index])
            }
            index += 1
        }
        return outputTenseList
    }
    
    public func areActivated(tenseList: [Tense])->[Bool]{
        var activatedList = [Bool]()
        
        for tense in tenseList {
            activatedList.append(isActivated(tense: tense))
        }
        return activatedList
    }

    public mutating func toggleTense(tense: Tense){
        activatedIndex = 0
        activated[tense.getIndex()].toggle()
    }
    
    public mutating func toggleAllSimpleIndicativeTenses(){
        for tense in Tense.indicativeAll {
            activated[tense.getIndex()].toggle()
        }
    }
    
    public mutating func toggleAllCompoundIndicativeTenses(){
        for tense in Tense.perfectIndicativeAll {
            activated[tense.getIndex()].toggle()
        }
    }

    public mutating func toggleAllSimpleSubjunctiveTenses(){
        for tense in Tense.subjunctiveAll {
            activated[tense.getIndex()].toggle()
        }
    }
    
    public mutating func toggleAllCompoundSubjunctiveTenses(){
        for tense in Tense.perfectSubjunctiveAll {
            activated[tense.getIndex()].toggle()
        }
    }


    public func getActivatedCount() -> Int {
        var activatedCount = 0
        for active in activated {
            if active {activatedCount += 1}
        }
        return activatedCount
    }

}
