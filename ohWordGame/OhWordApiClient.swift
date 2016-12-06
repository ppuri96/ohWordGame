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
    
    static func getWordsForSong(song_id: String) {
        
        let params: Parameters = ["word[song_id]" : song_id]
        let headers: HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]
        
        Alamofire.request("http://api.ohwordapp.com/wordsforsong", parameters: params, headers: headers).responseJSON { response in
            
            let swiftyReturn = JSON(response.result.value!)
            
            for word in swiftyReturn {
                
            }
            
        }
        
    }
   
    
}
