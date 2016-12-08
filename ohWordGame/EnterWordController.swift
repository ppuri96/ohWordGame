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
    
    let viewModel = EnterWordsViewModel()
    
    @IBAction func nextWord(_ sender: UIButton) {
//        currentWord.text = wordText.text
        self.wordDescription.text = self.viewModel.words[0].description
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wordText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wordText.resignFirstResponder()
        
        return true
    }
    
    

}
