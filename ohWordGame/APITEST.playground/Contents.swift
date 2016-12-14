//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct Song {
    
    var id: Int
    var title: String
    var artist: String
    var lyrics: String
    
    init(id: Int, title: String, artist: String, lyrics: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.lyrics = lyrics
    }
    
}

struct GameWord {
    
    var index: Int
    var id: Int
    var game_id: Int
    var word_id: Int
    var text: String
    
    init(index: Int, id: Int, game_id: Int, word_id: Int, text: String) {
        self.index = index
        self.id = id
        self.game_id = game_id
        self.word_id = word_id
        self.text = text
    }
    
}

struct Word {
    
    var id: Int
    var description: String
    var index: Int
    var text: String?
    
    init (id: Int, index: Int, description: String) {
        self.id = id
        self.index = index
        self.description = description
    }
    
    mutating func setText(text: String) {
        self.text = text
    }
    
}

class ApiParser {
    
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
//        print("these are the parsed game words: \(gameWords)")
        return gameWords
    }
}


class OhWordApiClient {
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
}

class EnterWordsViewModel {
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
    func loadGameWordsFromApi(game_id: Int, completion: @escaping (([GameWord]) -> Void)) {
        self.client.getGameWordsForResults(game_id: game_id, completion: { [unowned self] response in
            if let gameWords = self.parser.gameWordsFromApi(response: response) {
//                print("the gamewords being returned are: \(gameWords)")
                completion(gameWords)
            }
        })
    }
    
}

let test: EnterWordsViewModel = EnterWordsViewModel()
test.loadGameWordsFromApi(game_id: 8, completion: { data in
    print("DATA ISSSS: \(data)")
})


let words = [Word]()
words.count 
