//
//  ResultsViewController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/8/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let viewModel: ResultsViewModel = ResultsViewModel()
    
    @IBOutlet weak var resultText: UITextView!
    
    @IBAction func displaySong(sender: UIButton) {
        getNewSongLyrics()
    }
    
    func getNewSongLyrics() {
        viewModel.getNewSongLyrics()
        if let newSongLyrics = viewModel.finalLyrics {
            resultText.text = newSongLyrics
            print(newSongLyrics)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
