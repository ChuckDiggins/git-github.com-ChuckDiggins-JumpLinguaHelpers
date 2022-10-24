//
//  VerbModelJson.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 5/28/21.
//

import UIKit
import JumpLinguaHelpers


public struct JsonVerbModel: Codable, CustomStringConvertible {
    var idNum: Int
    public var modelVerbString: String
    public var specialPatternList: [SpecialPattern]
    public var modelExceptionList : [Exception]
    var includeSuffixList = [String]()
    var excludeSuffixList = [String]()
    var standAlone = false
    
    public var description: String{
        return "\(self.idNum):  \(self.modelVerbString)"
    }
    
    public init(idNum: Int, modelVerbString: String, specialPatterns: [SpecialPattern], modelExceptions: [Exception]){
        self.idNum = idNum
        self.modelVerbString = modelVerbString
        self.specialPatternList = specialPatterns
        self.modelExceptionList = modelExceptions
    }
    
    public init(rvm : RomanceVerbModel){
        self.idNum = rvm.id
        self.modelVerbString = rvm.modelVerb
        self.specialPatternList = [SpecialPattern]()
        self.modelExceptionList = [Exception]()
        self.includeSuffixList = rvm.includeSuffixList
        self.excludeSuffixList  = rvm.excludeSuffixList
        for sp in rvm.specialPatternList{
            let specialPattern = SpecialPattern(tenseStr: sp.tenseStr, patternStr: sp.patternStr)
            specialPatternList.append(specialPattern)
        }
        for exception in rvm.exceptionList {
            let modelException = Exception(exceptionPattern: exception.exceptionPattern, tense: exception.tense, exceptionPerson: exception.person ?? "", from: exception.from ?? "", to: exception.to ?? "")
            modelExceptionList.append(modelException)
        }
    }
    
    public func printThyself(){
        print("\(idNum) - \(modelVerbString)")
        var i = 0
        for spt in specialPatternList {
            print("Special pattern - tense \(spt.tenseStr), pattern \(spt.patternStr)")
        }
        
        for me in modelExceptionList {
            print("Exception \(i)- \(me.exceptionPattern)")
            i += 1
        }
        for inc in  includeSuffixList {
            print("includes \(inc)")
        }
        for exc in  excludeSuffixList {
            print("excludes \(exc)")
        }
        print("\n")
    }

    public func convertToRomanceVerbModel()->RomanceVerbModel{
        var rvm = RomanceVerbModel(id: idNum, modelVerb: modelVerbString, exceptionList: modelExceptionList, specialPatternList: specialPatternList, includeWord: "", includeSuffixList: includeSuffixList, excludeSuffixList: excludeSuffixList)
        for except in modelExceptionList {
            if ( except.exceptionPattern == "STANDALONE"){
                rvm.standAlone = true
            }
            if ( except.exceptionPattern == "SPECIAL"){
                rvm.special = true
                rvm.specialVerb = except.from!
            }
        }
        return rvm
    }
 
}

//create json from
public struct  JsonVerbModelManager {
    var language = LanguageType.Spanish
    var myVerbModelList = [JsonVerbModel]()
    public init(){}
    
    mutating public func encodeVerbModel(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedVerbs = try? encoder.encode(myVerbModelList){
            //print(String(data: encodedVerbs, encoding: .utf8)!)
            try? encodedVerbs.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    mutating public func setLanguage(language: LanguageType){
        self.language = language
    }
    
    mutating public func getVerbModelData(sourcesURL: URL )->JsonVerbModel{
        guard let data = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let verbModelData = try? decoder.decode(JsonVerbModel.self, from: data) else {
            fatalError("There was a problem decoding the data ... ")
        }
        return verbModelData
    }
    
    mutating public func justAppendVerbModel(verbModel: JsonVerbModel){
        myVerbModelList.append(verbModel)
        encodeVerbModel()
    }

    mutating public func appendVerbModel(verbModel: JsonVerbModel){
        var appendThis = true
        
        //first, see if this verbModel exists already in the list
        
        for i in 0..<myVerbModelList.count {
            let vm = myVerbModelList[i]
            if vm.modelVerbString == verbModel.modelVerbString {
                myVerbModelList.remove(at: i)
                myVerbModelList.insert(verbModel, at:i)
                appendThis = false
                break
            }
        }
        
        //if new, append
        if ( appendThis ){myVerbModelList.append(verbModel)}
        encodeVerbModel()
    }
    
    mutating public func clearVerbModels(){
        myVerbModelList.removeAll()
        encodeVerbModel()
    }
    
    public func getVerbModelAt(index: Int)->JsonVerbModel{
        if index > myVerbModelList.count-1 { return myVerbModelList[0] }
        return myVerbModelList[index]
    }
    
    mutating public func getRomanceVerbModelAt(index: Int)->RomanceVerbModel{
        let jvm = getVerbModelAt(index:index)
        let rvm = jvm.convertToRomanceVerbModel()
        return rvm
    }
    
    public func getVerbModelCount()->Int{
        return myVerbModelList.count
    }
    
    public func getURL()->URL{
        var languageString = ""
        switch language {
        case .Spanish: languageString = "SpanishVerbModels"
        case .French: languageString = "FrenchVerbModels"
        case .English: languageString = "EnglishVerbModels"
        default: break
        }
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent(languageString).appendingPathExtension("json")
        /*
        guard let sourcesURL = Bundle.main.url(forResource: languageString, withExtension: "json") else {
            fatalError("Could not find \(languageString).json")
        }
        return sourcesURL
 */
        
    }
    
}

