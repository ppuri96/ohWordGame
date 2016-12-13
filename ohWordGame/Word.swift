//
//  Word.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/5/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

struct Word {
    
    var id: Int
    var description: String
    var index: Int
    var text: String?
    
    init (id: Int, index: Int, description: String) {
        self.id = id
        self.index = index
        self.description = description
    }

    
}
