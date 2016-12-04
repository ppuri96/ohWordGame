//
//  OhWordApiClient.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/4/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation

class OhWordApiClient {
    
    static func createNewGame(_ songId: String) -> String {
        
        let url = URL(string: "https://github.com/Alamofire/Alamofire.git")
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
    }
   
    
}
