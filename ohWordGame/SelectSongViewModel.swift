//
//  SelectSongViewModel.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/7/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

class SelectSongViewModel {
    
    let client = OhWordApiClient()
    let parser = ApiParser()
    
    func loadWordsFromApi(song_id: String, completion: @escaping (([Word]) -> Void)) {
        client.getWordsForSong(song_id: song_id, completion: { [unowned self] response in
            if let allWords = self.parser.wordsFromApiResponse(response: response!) {
                completion(allWords)
            }
        })
    }
    
}
