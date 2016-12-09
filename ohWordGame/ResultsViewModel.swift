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
    var finalLyrics: String?
    var accentLang: String = "en-US"
    
    func toggleAccent() {
        if accentLang == "en-US" {
            self.accentLang = "en-GB"
        } else {
            self.accentLang = "en-US"
        }
    }
    
    func getNewSongLyrics() {
        createLyricsArray()
        populateNewSongLyrics()
        concatLyricArray()
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
    
    func concatLyricArray(){
        var retString = ""
        for word in lyricsArr {
            retString = retString + " " + word
        }
        self.finalLyrics = retString
    }
    
}
