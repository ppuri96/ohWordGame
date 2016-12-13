//
//  gameWordTests.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/13/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest
@testable import ohWordGame

class gameWordTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let gw = GameWord(index: 9, id: 1, game_id: 2, word_id: 3, text: "Balogna")
        XCTAssertEqual(gw.index, 9)
        XCTAssertEqual(gw.id, 1)
        XCTAssertEqual(gw.game_id, 2)
        XCTAssertEqual(gw.word_id, 3)
        XCTAssertEqual(gw.text, "Balogna")
        
    }
    
}
