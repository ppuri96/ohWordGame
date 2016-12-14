//
//  EnterWordsViewModelTests.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/14/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import Foundation
import XCTest

@testable import ohWordGame

class EnterWordsViewModelTests: XCTestCase {
    
    func test_saveWord() {
        let viewModel = EnterWordsViewModel()
        
        let words = createWordsList()
        XCTAssertEqual(3, words.count)
        viewModel.words = words
        viewModel.curWordIndex = 2
        
        let newWord: Word = Word(id: 4, index: 24, description: "Adjective")
        viewModel.saveWord(word: newWord)
        XCTAssertEqual(3, viewModel.curWordIndex)
    }
    
    func test_getCurrentWord() {
        let viewModel = EnterWordsViewModel()
        
        let words = createWordsList()
        XCTAssertEqual(3, words.count)
        viewModel.words = words
        viewModel.curWordIndex = 2
        
        let newWord: Word = Word(id: 4, index: 24, description: "Adjective")
        viewModel.saveWord(word: newWord)
        
        if let curWord: Word = viewModel.getCurrentWord() {
            XCTAssertEqual(curWord.id, 4)
        }
        
    }
    
    
    func createWordsList() -> [Word] {
        var words = [Word]()
        let word1: Word = Word(id: 1, index: 10, description: "Plural Noun")
        let word2: Word = Word(id: 2, index: 15, description: "Noun")
        let word3: Word = Word(id: 3, index: 23, description: "Verb")
        words.append(word1)
        words.append(word2)
        words.append(word3)
        return words
    }
    
}
