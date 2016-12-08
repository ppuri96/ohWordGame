//
//  Song.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/8/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

struct Song {
    
    var id: Int
    var title: String
    var artist: String
    var lyrics: String
    var url: String
    
    init(id: Int, title: String, artist: String, lyrics: String, url: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.lyrics = lyrics
        self.url = url
    }
    
}
