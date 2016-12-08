//
//  EnterWordController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/5/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit

class EnterWordController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wordDescription: UILabel!
    @IBOutlet weak var wordText: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel = EnterWordsViewModel()
    
    @IBAction func nextWord(_ sender: UIButton) {
        if viewModel.curWordIndex == viewModel.words.count - 1 {
            sender.setTitle("Finish", for: .normal)
            // TODO: navigate to next scene
        }
        saveWord()
        displayDescription()
        clearTextField()
    }
    
    func clearTextField() {
        wordText.text = nil
    }
    
    func displayDescription() {
        if let curWord: Word     = viewModel.getCurrentWord() {
            wordDescription.text = curWord.description
        }
    }
    
    func saveWord() {
        if let curWord  = viewModel.getCurrentWord() {
            curWord.text = wordText.text
            viewModel.saveWord(word: curWord)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wordText.delegate = self
        self.wordText.clearsOnInsertion = true
        self.wordText.clearsOnBeginEditing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wordText.resignFirstResponder()
        nextWord(nextButton)
        return true
    }
    
    

}
