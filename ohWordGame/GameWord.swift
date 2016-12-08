//
//  GameWord.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/8/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

struct GameWord {
    
    var index: Int
    var id: Int
    var game_id: Int
    var word_id: Int
    var text: String
    var url: String
    
    init(index: Int, id: Int, game_id: Int, word_id: Int, text: String, url: String) {
        self.index = index
        self.id = id
        self.game_id = game_id
        self.word_id = word_id
        self.text = text
        self.url = url
    }
    
}
