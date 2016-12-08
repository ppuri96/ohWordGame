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
    @IBOutlet weak var resultsButton: UIButton!
    
    let viewModel = EnterWordsViewModel()
    
    @IBAction func nextWord(_ sender: UIButton) {
        if viewModel.curWordIndex < viewModel.words.count {
            saveWord()
            displayDescription()
            clearTextField()
        }
        if viewModel.curWordIndex == viewModel.words.count {
            resultsButton.isHidden = false
        }
    }
    
    func clearTextField() {
        wordText.text = nil
    }
    
    func displayDescription() {
        if let curWord: Word = viewModel.getCurrentWord() {
            wordDescription.text = curWord.description
        }
    }
    
    func saveWord() {
        if var curWord = viewModel.getCurrentWord() {
            curWord.text = wordText.text
            viewModel.saveWord(word: curWord)
        }
    }
    
    @IBAction func viewResults(_ sender: UIButton) {
        viewModel.postWordsToApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wordText.delegate = self
        self.wordText.clearsOnInsertion = true
        self.wordText.clearsOnBeginEditing = true
        resultsButton.isHidden = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let resultsViewController:ResultsViewController = segue.destination as! ResultsViewController
            viewModel.loadGameWordsFromApi(game_id: 1, completion: { data in
                resultsViewController.viewModel.gameWords = data
            })
            viewModel.getSongFromApi(song_id: "1", completion: { data in
                resultsViewController.viewModel.song = data
            })
        }
    }
    

}
