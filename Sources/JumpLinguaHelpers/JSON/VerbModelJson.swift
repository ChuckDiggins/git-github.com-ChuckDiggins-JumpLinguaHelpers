//
//  VerbModelJson.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 5/28/21.
//

import UIKit

struct JsonVerbModel: Codable, CustomStringConvertible {
    var idNum: Int
    var modelVerbString: String
    var modelExceptionList : [Exception]
    var includeSuffixList = [String]()
    var excludeSuffixList = [String]()
    var standAlone = false
    
    var description: String{
        return "\(self.idNum):  \(self.modelVerbString)"
    }
    
    init(idNum: Int, modelVerbString: String, modelExceptions: [Exception]){
        self.idNum = idNum
        self.modelVerbString = modelVerbString
        self.modelExceptionList = modelExceptions
    }
    
    init(rvm : RomanceVerbModel){
        self.idNum = rvm.id
        self.modelVerbString = rvm.modelVerb
        self.modelExceptionList = [Exception]()
        self.includeSuffixList = rvm.includeSuffixList
        self.excludeSuffixList  = rvm.excludeSuffixList
        for exception in rvm.exceptionList {
            let modelException = Exception(exceptionPattern: exception.exceptionPattern, tense: exception.tense, exceptionPerson: exception.person ?? "", from: exception.from ?? "", to: exception.to ?? "")
            modelExceptionList.append(modelException)
        }
    }
    
    func printThyself(){
        print("\(idNum) - \(modelVerbString)")
        var i = 0
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

    func convertToRomanceVerbModel()->RomanceVerbModel{
        var rvm = RomanceVerbModel(id: idNum, modelVerb: modelVerbString, exceptionList: modelExceptionList, includeWord: "", includeSuffixList: includeSuffixList, excludeSuffixList: excludeSuffixList)
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
class JsonVerbModelManager {
    var language = LanguageType.Spanish
    var myVerbModelList = [JsonVerbModel]()
    
    func encodeVerbModel(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedVerbs = try? encoder.encode(myVerbModelList){
            //print(String(data: encodedVerbs, encoding: .utf8)!)
            try? encodedVerbs.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    func setLanguage(language: LanguageType){
        self.language = language
    }
    
    func getVerbModelData(sourcesURL: URL )->JsonVerbModel{
        guard let data = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let verbModelData = try? decoder.decode(JsonVerbModel.self, from: data) else {
            fatalError("There was a problem decoding the data ... ")
        }
        return verbModelData
    }
    
    func justAppendVerbModel(verbModel: JsonVerbModel){
        myVerbModelList.append(verbModel)
        encodeVerbModel()
    }

    func appendVerbModel(verbModel: JsonVerbModel){
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
    
    func clearVerbModels(){
        myVerbModelList.removeAll()
        encodeVerbModel()
    }
    
    func getVerbModelAt(index: Int)->JsonVerbModel{
        if index > myVerbModelList.count-1 { return myVerbModelList[0] }
        return myVerbModelList[index]
    }
    
    func getRomanceVerbModelAt(index: Int)->RomanceVerbModel{
        let jvm = getVerbModelAt(index:index)
        let rvm = jvm.convertToRomanceVerbModel()
        return rvm
    }
    
    func getVerbModelCount()->Int{
        return myVerbModelList.count
    }
    
    func getURL()->URL{
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

