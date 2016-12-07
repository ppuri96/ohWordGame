//
//  ApiParser.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/6/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiParser {
    
    func wordsFromApiResponse(response: DataResponse<Any>) -> [Word] {
        var words = [Word]()
        let swiftyReturn = JSON(response.result.value!)
        
        for word in swiftyReturn {
            let id          = word.1["id"]
            let index       = word.1["index"]
            let description = word.1["description"]
            
            let tempWord: Word = Word(id: id.int!, index: index.int!, description: description.string!)
            words.append(tempWord)
        }
        return words
    }
    
    
}
