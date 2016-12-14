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

/// This class is meant to parse Alamofire responses into existing project models
class ApiParser {
    
    /// Parse information for one song to get all words
    /// - parameters:
    ///     - response: song data passed in
    /// - returns: Word array representing extracted words for the song
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
    
    /// Parse information for a GameWords array with the users inputs
    /// - parameters:
    ///     - response: game word data passed in
    /// - returns: GameWords array
    func gameWordsFromApi(response: Data?) -> [GameWord]? {
        var gameWords = [GameWord]()
        let swiftyReturn = JSON(data: response!)
        
        for gameWord in swiftyReturn {
            let index   = gameWord.1["index"]
            let id      = gameWord.1["id"]
            let game_id = gameWord.1["game_id"]
            let word_id = gameWord.1["word_id"]
            let text    = gameWord.1["text"]

            let tempGameWord: GameWord = GameWord(index: index.int!, id: id.int!, game_id: game_id.int!, word_id: word_id.int!,
                                                  text: text.string!)
            gameWords.append(tempGameWord)
        }
        return gameWords
    }
    
    /// Parse information for a song
    /// - parameters:
    ///     - response: song data passed in
    /// - returns: Song object with corresponding details
    func parseSongData(response: Data?) -> Song? {
        let swiftyReturn = JSON(data: response!)
        
        var songResponse = swiftyReturn
        
        let id = songResponse["id"]
        let title = songResponse["title"]
        let artist = songResponse["artist"]
        let lyrics = songResponse["lyrics"]
        
        let song: Song = Song(id: id.int!, title: title.string!, artist: artist.string!,
                              lyrics: lyrics.string!)
        return song
    }
    
    /// Parse information for new game
    /// - parameters:
    ///     - response: new game data
    /// - returns: Game object of new game details
    func parseNewGameData(response: Data?) -> Game? {
        let swiftyReturn = JSON(data: response!)
        
        let id = swiftyReturn["id"]
        let user_id = swiftyReturn["user_id"]
        let song_id = swiftyReturn["song_id"]
        
        let game: Game = Game(id: id.int!, user_id: user_id.int!, song_id: song_id.int!)
        return game
    }
    
    /// Send the users response to the API
    /// - parameters:
    ///     - response: gameWord data belonging to the user
    /// - returns: description of the response indicating status
    func postGameWordResponse(response: Data?) -> String {
        let swiftyReturn = JSON(data: response!)
        return swiftyReturn.description
    }
}
