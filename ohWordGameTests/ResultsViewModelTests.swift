//
//  ResultsViewModelTests.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/14/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest

@testable import ohWordGame

class ResultsViewModelTests: XCTestCase {
    
    func test_toggleAccent() {
        let viewModel = ResultsViewModel()
        XCTAssertEqual(viewModel.accentLang, "en-US")
        viewModel.toggleAccent()
        XCTAssertEqual(viewModel.accentLang, "en-GB")
        viewModel.toggleAccent()
        XCTAssertEqual(viewModel.accentLang, "en-US")
    }
    
    func test_createLyricsArray() {
        let viewModel = ResultsViewModel()
        let testSong = Song(id: 1, title: "TestSong", artist: "Tester", lyrics: "Prof H talked about sparkly seahorses during our presentation")
        viewModel.song = testSong
        viewModel.createLyricsArray()
        XCTAssertEqual(viewModel.lyricsArr.count, 9)
    }
    
    func test_concatLyricArray() {
        let viewModel = ResultsViewModel()
        let testSong = Song(id: 1, title: "TestSong", artist: "Tester", lyrics: "Prof H talked about sparkly seahorses during our presentation")
        viewModel.song = testSong
        viewModel.createLyricsArray()
        viewModel.concatLyricArray()
        XCTAssertEqual(viewModel.finalLyrics!, " Prof H talked about sparkly seahorses during our presentation")
    }
    
}
