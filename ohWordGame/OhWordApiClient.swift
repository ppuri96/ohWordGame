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
    
    static func createNewGame(auth_token: String, songId: String) -> String {
        //TODO: finish this function
        return "foo"
    }
    
    /**
     Returkn all of the words for a particular song
     
     - parameters: 
        - song_id: the ID for which we wish to retrieve words
     
     - returns: 
        JSON data object to be handled by parser
    */

    func getWordsForSong(song_id: String, completion: @escaping (Data?) -> Void) {
        let params: Parameters = ["word[song_id]" : song_id]
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/wordsforsong", parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }
    
    func getGameWordsForResults(game_id: String, completion: @escaping (Data?) -> Void) {
        let params: Parameters = ["game_word[game_id]" : game_id]
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/game_words", parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
        
    }
    
//    func postGameWord(word_id: String, game_id: String, text: String,_ completion: @escaping (Data?) -> Void) {
//        let params: Parameters = [
//            "game_word[word_id]" : word_id,
//            "game_word[game_id]" : game_id,
//            "game_word[text]" : text
//        ]
//        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
//        
//        Alamofire.request("http://api.ohwordapp.com/game_words", method: .post, parameters: params, headers: headers).response { response in
//            if let error = response.error {
//                print("Error getting words: \(error)")
//                completion(response.data)
//                return
//            }
//            completion(response.data)
//        }
//    }
    
    func postGameWord(word_id: Int, game_id: String, text: String) {
        let params: Parameters = [
            "game_word[word_id]" : word_id,
            "game_word[game_id]" : game_id,
            "game_word[text]" : text
        ]
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/game_words", method: .post, parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error getting words: \(error)")
                return
            }
        }
    }
    
    
    func postNewGame( song_id: String, user_id: String, _ completion: @escaping (Data?) -> Void) {
        let params: Parameters = [
            "game[song_id]" : song_id,
            "game[user_id]" : user_id
        ]
        
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/games", method: .post, parameters: params, headers: headers).response { response in
            if let error = response.error {
                print("Error Creating: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }

    func register(_ completion: @escaping (DefaultDataResponse?) -> Void, username: String, password: String, password_confirmation: String) {
        let params: Parameters = [
            "user[username]" : username,
            "game_word[password]" : password,
            "game_word[password_confirmation]" : password_confirmation
        ]
        
        Alamofire.request("http://localhost:3000/users", method: .post, parameters: params).response { response in
            if let error = response.error {
                print("Error Creating: \(error)")
                completion(response)
                return
            }
            completion(response)
        }
    }
    
    func login(_ completion: @escaping (DefaultDataResponse?) -> Void, username: String, password: String, password_confirmation: String) {
        let params: Parameters = [
            "user[username]" : username,
            "game_word[password]" : password,
            "game_word[password_confirmation]" : password_confirmation
        ]
        
        Alamofire.request("http://localhost:3000/login", method: .post, parameters: params).response { response in
            if let error = response.error {
                print("Error Creating: \(error)")
                completion(response)
                return
            }
            completion(response)
        }
    }
    
    
    
    
   
    
}
