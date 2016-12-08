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
    var lyricsArr: [String] = [String]()
    
    func getNewSongLyrics() -> String {
        createLyricsArray()
        populateNewSongLyrics()
        return concatLyricArray()
    }
    
    
    //Helper functions
    func createLyricsArray() {
        if let gameSong = song {
            lyricsArr = gameSong.lyrics.components(separatedBy: " ")
        }
    }
    
    func populateNewSongLyrics() {
        for gameWord in gameWords {
            let curIndex = gameWord.index
            let curText = gameWord.text
            self.lyricsArr[curIndex] = curText
        }
    }
    
    func concatLyricArray() -> String {
        var retString = ""
        for word in lyricsArr {
            retString = retString + word
        }
        return retString
    }
    
}
