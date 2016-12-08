//
//  ApiParser.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/6/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiParser {
    
    func wordsFromApiResponse(response: Data?) -> [Word]? {
        var words = [Word]()
        let swiftyReturn = JSON(data: response!)
        
        for word in swiftyReturn {
            let id          = word.1["id"]
            let index       = word.1["index"]
            let description = word.1["description"]
            
            let tempWord: Word = Word(id: id.int!, index: index.int!, description: description.string!)
            words.append(tempWord)
        }
        return words
    }
    
    func gameWordsFromApi(response: Data?) -> [GameWord]? {
        var gameWords = [GameWord]()
        let swiftyReturn = JSON(data: response!)
        
        for gameWord in swiftyReturn {
            let index   = gameWord.1["index"]
            let id      = gameWord.1["id"]
            let game_id = gameWord.1["game_id"]
            let word_id = gameWord.1["word_id"]
            let text    = gameWord.1["text"]
            let url     = gameWord.1["url"]

            let tempGameWord: GameWord = GameWord(index: index.int!, id: id.int!, game_id: game_id.int!, word_id: word_id.int!,
                                                  text: text.string!, url: url.string!)
            gameWords.append(tempGameWord)
        }
        return gameWords
    }
    
    func parseSongData(response: Data?) -> Song? {
        let swiftyReturn = JSON(data: response!)
        
        var songResponse = swiftyReturn.first!
        let id = songResponse.1["id"]
        let title = songResponse.1["title"]
        let artist = songResponse.1["artist"]
        let lyrics = songResponse.1["lyrics"]
        let url = songResponse.1["url"]
        
        let song: Song = Song(id: id.int!, title: title.string!, artist: artist.string!,
                              lyrics: lyrics.string!, url: url.string!)
        return song
    }
    
    
    // TODO: - get the game id from this response
    func postGameWordResponse(response: Data?) -> String {
        let swiftyReturn = JSON(data: response!)
        return swiftyReturn.description
    }
}
