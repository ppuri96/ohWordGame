//
//  Game.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/9/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

struct Game {
    var id: Int
    var user_id: Int
    var song_id: Int
    
    init(id: Int, user_id: Int, song_id: Int) {
        self.id = id
        self.user_id = user_id
        self.song_id = song_id
    }
}
