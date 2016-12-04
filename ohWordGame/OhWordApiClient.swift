//
//  OhWordApiClient.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/4/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import Alamofire

class OhWordApiClient {
    
//    static func createNewUser(_ ) {
//        //POST request to api
//        //response is the user_id and auth_token
//        
//    }
    
    static func createNewGame(auth_token: String, songId: String) -> String {
        
        let url = URL(string: "https://github.com/Alamofire/Alamofire.git")
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        return "hi"
    }
    
    
    static func testApi(auth_token: String) {
        let headers: HTTPHeaders = ["Authorization": auth_token]
        
        Alamofire.request("http://api.ohwordapp.com/songs.json"
        
    }
    
    
   
    
}
