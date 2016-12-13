//
//  songTests.swift
//  ohWordGame
//
//  Created by Glen Wise on 12/13/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest
@testable import ohWordGame

class songTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let song = Song(id: 1, title: "Song 1", artist: "Glen", lyrics: "one two three four 5 six 7 ate nine")
        XCTAssertEqual(song.id, 1)
        XCTAssertEqual(song.title, "Song 1")
        XCTAssertEqual(song.artist, "Glen")
        XCTAssertEqual(song.lyrics, "one two three four 5 six 7 ate nine")

        
    }
    
    
}
