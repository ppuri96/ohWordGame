//: Playground - noun: a place where people can play

import UIKit
import Alamofire

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"
let headers:HTTPHeaders = ["Authorization": "Token badee2f295c0d9b340d21ced7a21ef85"]

Alamofire.request("http://api.ohwordapp.com/songs", headers: headers).responseJSON {response in
    
    print(response.request)  // original URL request
    print(response.response) // HTTP URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
    
    if let JSON = response.result.value {
        print("JSON: \(JSON)")
    }
}


