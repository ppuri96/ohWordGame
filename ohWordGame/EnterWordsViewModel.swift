//
//  EnterWordsViewModel.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/6/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

class EnterWordsViewModel {
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
    var words: [Word]     = [Word]()
    var curWordIndex: Int = 0
    
    func getCurrentWord() -> Word? {
        if curWordIndex > words.count - 1 {
            return nil
        }
        return words[curWordIndex]
    }
    
    func saveWord(word: Word) {
        words[curWordIndex] = word
        curWordIndex = curWordIndex + 1
    }
    
    func postWordsToApi() {
        for word in words {
            if let text = word.text {
                client.postGameWord(word_id: word.id, game_id: "1", text: text)
            }
        }
    }
    
}
