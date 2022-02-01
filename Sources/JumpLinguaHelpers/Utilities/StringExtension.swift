//
//  StringExtension.swift
//  StringExtension
//
//  Created by Charles Diggins on 12/8/21.
//

import Foundation

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter(){
        self = self.capitalizingFirstLetter()
    }
}
