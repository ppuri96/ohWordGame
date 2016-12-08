//
//  ResultsViewModel.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/8/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

class ResultsViewModel {
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
    var song: Song? = nil
    var gameWords = [GameWord]()
    var lyricsArry: [String]? = [String]?()
    
    
    func createLyricsArray() {
        if let gameSong = song {
            lyricsArry = gameSong.lyrics.components(separatedBy: " ")
        }
    }
    
    func populateNewSongLyrics() {
        createLyricsArray()
        for gameWord in gameWords {
            var curIndex = gameWord.index
            var curText = gameWord.text
            self.lyricsArr[curIndex] = curText
        }
    }
    
}
