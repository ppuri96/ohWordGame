//
//  OhWordApiClient.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/4/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OhWordApiClient {
    
    // MARK: - GET REQUESTS
    
    /// Make a get request to get words data for a particular song
    /// - parameters:
    ///     - song_id: id for the song you wish to get data for
    /// - returns: data for the song_id
    func getWordsForSong(song_id: String, completion: @escaping (Data?) -> Void) {
        let params: Parameters = ["word[song_id]" : song_id]
        let headers: HTTPHeaders = ["Authorization": "Token d73212b2a5eaf3b007bd6991c828a057"]
        
        Alamofire.request("http://api.ohwordapp.com/wordsforsong", parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }
    
    /// Make a get request to get GameWords data for gameResults, used to assemble results
    /// - parameters:
    ///     - game_id: game id used to get all gameWords for that game
    /// - returns: data for the gameWords belonging to the game
    func getGameWordsForResults(game_id: Int, completion: @escaping (Data?) -> Void) {
        let params: Parameters = ["game_word[game_id]" : game_id]
        let headers: HTTPHeaders = ["Authorization": "Token d73212b2a5eaf3b007bd6991c828a057"]
        
        Alamofire.request("http://api.ohwordapp.com/gamewordsforgame", parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
        
    }
    
    /// Make a get request to get song data for a particular song
    /// - parameters:
    ///     - song_id: id for the song you wish to get data for
    /// - returns: data for the song_id
    func getSongFromApi(song_id: String, completion: @escaping (Data?) -> Void) {
        let headers: HTTPHeaders = ["Authorization": "Token d73212b2a5eaf3b007bd6991c828a057"]
        
        Alamofire.request("http://api.ohwordapp.com/songs/" + song_id, headers: headers).response { response in
            if let error = response.error {
                print("Error getting song information: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }
    
    // MARK: - POST REQUESTS
    
    /// Make a post request to save gameWord information to the API for a specific game
    /// - parameters:
    ///     - word_id: id for the word you are saving
    ///     - game_id: id for the game you are saving the word for
    ///     - text: the users input for the particular word
    func postGameWord(word_id: Int, game_id: Int, text: String) {
        let params: Parameters = [
            "game_word[word_id]" : word_id,
            "game_word[game_id]" : game_id,
            "game_word[text]" : text
        ]
        let headers: HTTPHeaders = ["Authorization": "Token d73212b2a5eaf3b007bd6991c828a057"]
        
        Alamofire.request("http://api.ohwordapp.com/game_words", method: .post, parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                return
            }
        }
    }
    
    /// Make a post request to create a new game
    /// - parameters:
    ///     - song_id: id for the song you are playing this game with
    ///     - user_id: id for the user you are playing as
    func postNewGame( song_id: String, user_id: String, _ completion: @escaping (Data?) -> Void) {
        let params: Parameters = [
            "game[song_id]" : song_id,
            "game[user_id]" : user_id
        ]
        
        let headers: HTTPHeaders = ["Authorization": "Token d73212b2a5eaf3b007bd6991c828a057"]
        
        Alamofire.request("http://api.ohwordapp.com/games", method: .post, parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error Creating: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }

}
