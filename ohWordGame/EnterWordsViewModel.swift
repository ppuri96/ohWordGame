//
//  EnterWordsViewModel.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/6/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

class EnterWordsViewModel {
    
    var words = [Word]()
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
//    func loadWordsFromApi() {
//        client.getWordsForSong({ [unowned self] response in
//            if let allWords = self.parser.wordsFromApiResponse(response: response!) {
//                self.words = allWords
//            }
//        }, song_id: "1")
//    }
    
//    func loadWordsFromApi(_ completion: @escaping ([Word]) -> Void) {
//        client.getWordsForSong({ [unowned self] response in
//            if let allWords = self.parser.wordsFromApiResponse(response: response!) {
//                self.words = allWords
//                completion(allWords)
//                //                print("test2:\(self.words)")
//            }
//            completion(self.words)
//            return
//            }, song_id: "1")
//        //        print("test3:\(self.words)")
//    }
    
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
