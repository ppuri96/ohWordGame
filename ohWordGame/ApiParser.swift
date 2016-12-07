//
//  ApiParser.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/6/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiParser {
    func parseWords(_ result: Result<Any>) {
        do {
            if let result = result,
            let json = try JSON(result.value!)
        } catch {
            print("Could no parse JSON")
        }
    }
}
