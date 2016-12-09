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
}


class OhWordApiClient {
    func getWordsForSong(_ completion: @escaping (Data?) -> Void, song_id: String) {
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
    
    func getSongFromApi(song_id: String, completion: @escaping (Data?) -> Void) {
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/songs/" + song_id, headers: headers).response { response in
            if let error = response.error {
                print("Error getting song information: \(error)")
                completion(response.data)
                return
            }
            completion(response.data)
        }
    }
}

class EnterWordsViewModel {
    
    //var words = [Word]()
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
//    func loadWordsFromApi(completion: @escaping (([Word]) -> Void)) {
//        client.getWordsForSong({ [unowned self] response in
//            if let allWords = self.parser.wordsFromApiResponse(response: response!) {
//                //self.words = allWords
////                print("test2:\(self.words)")
//                completion(allWords)
//            }
//            
//        }, song_id: "1")
////        print("test3:\(self.words)")
//    }
    
    func getSongFromApi(song_id: String, completion: @escaping (Song) -> Void) {
        self.client.getSongFromApi(song_id: song_id, completion: { [unowned self] response in
            if let song = self.parser.parseSongData(response: response) {
                completion(song)
            }
        })
    }
}

let test: EnterWordsViewModel = EnterWordsViewModel()
test.getSongFromApi(song_id: "1", completion: { data in
    print(data)
})

Float(1)/18

