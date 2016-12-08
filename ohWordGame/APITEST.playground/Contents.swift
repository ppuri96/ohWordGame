//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"
//let headers:HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]

//Alamofire.request("http://api.ohwordapp.com/songs/1", headers: headers).responseJSON {response in
//    
//    //print(response.request)  // original URL request
//    //print(response.response) // HTTP URL response
//    //print(response.data)     // server data
//    print(response.result)   // result of response serialization
//    
//    let swiJ = JSON(response.result.value!)
//    print(swiJ["artist"])
//    
////    if let JSON = response.result.value {
////        print("JSON: \(JSON)")
////    }
//}

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
    
    func wordsFromApiResponse(response: Data?) -> [Word]? {
        var words = [Word]()
//        print("this is: \(response)")
//
//        let otherReturn = try? JSONSerialization.jsonObject(with: response!, options: [])
//        print(otherReturn)
        let swiftyReturn = JSON(data: response!)
//        print("this is: \(swiftyReturn)")
        for word in swiftyReturn {
            let id          = word.1["id"]
            let index       = word.1["index"]
            let description = word.1["description"]
            
            let tempWord: Word = Word(id: id.int!, index: index.int!, description: description.string!)
            words.append(tempWord)
        }
//        print(words)
        return words
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
}

class EnterWordsViewModel {
    
    //var words = [Word]()
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
    func loadWordsFromApi(completion: @escaping (([Word]) -> Void)) {
        client.getWordsForSong({ [unowned self] response in
            if let allWords = self.parser.wordsFromApiResponse(response: response!) {
                //self.words = allWords
//                print("test2:\(self.words)")
                completion(allWords)
            }
            
        }, song_id: "1")
//        print("test3:\(self.words)")
    }
}

let testClass = EnterWordsViewModel()
testClass.loadWordsFromApi() { data in
    print(data)
}



//let params: Parameters = ["word[song_id]" : 1]
//let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
//
//Alamofire.request("http://api.ohwordapp.com/wordsforsong", parameters: params, headers: headers).responseJSON { response in
//    
//    let swiftyReturn = JSON(response.result.value!)
//    print(swiftyReturn)
//    
//    for word in swiftyReturn {
//        
//        let id          = word.1["id"]
//        let index       = word.1["index"]
//        let description = word.1["description"]
//        
//        let testid = id.int!
//        
//        print(word.1["index"])
//    }
//}

var lyrics: String = "Straight outta _LOCATION_, crazy _OCCUPATION_ named _PERSON_IN_ROOM_ \\n  From the _NOUN_ called _PLURAL_NOUN_ With _PLURAL_NOUN_ \\n  When I'm called off, I got a sawed off \\n  _VERB_ the _NOUN_, and _PLURAL_NOUN_ are hauled off \\n  You too, boy, if ya _VERB_ with me \\n The _PLURAL_NOUN_ are gonna hafta come and get me"

let lyricsArray = lyrics.components(separatedBy: " ")
print(lyricsArray)




