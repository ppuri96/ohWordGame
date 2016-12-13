//
//  gameTests.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/13/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest
@testable import ohWordGame

class gameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let game = Game(id: 1, user_id: 2, song_id: 98)
        XCTAssertEqual(game.id, 1)
        XCTAssertEqual(game.user_id, 2)
        XCTAssertEqual(game.song_id, 98)
        
    }
    
}
