//
//  Word.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/5/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

struct Word {
    
    var description: String
    var index: Int
    var text: String?
    
    init (index: Int, description: String) {
        self.index = index
        self.description = description
    }
    
    mutating func setText(text: String) {
        self.text = text
    }
    
}
