//
//  wordTests.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/13/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest
@testable import ohWordGame

class wordTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var word = Word(id: 1, index: 9, description: "Noun")
        XCTAssertEqual(word.id, 1)
        XCTAssertEqual(word.index, 9)
        XCTAssertEqual(word.description, "Noun")
        XCTAssertNotEqual(word.id, 0)
        XCTAssertNil(word.text)
        word.text = "Frog Protection"
        XCTAssertEqual(word.text, "Frog Protection")
        
    }
    
    
}
