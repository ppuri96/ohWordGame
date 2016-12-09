//
//  ResultsViewController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/8/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit
import AVFoundation

class ResultsViewController: UIViewController {
    
    let viewModel: ResultsViewModel = ResultsViewModel()
    let speechSynthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var accentSwitch: UISwitch! 
    
    @IBAction func displaySong(sender: UIButton) {
        getNewSongLyrics()
        speechButton.isHidden = false
    }
    
    @IBAction func toggleAccent() {
        viewModel.toggleAccent()
    }
    
    @IBAction func siriReadSong(sender: UIButton) {
        if let text = viewModel.finalLyrics {
            let speechUtterance = AVSpeechUtterance(string: text)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: viewModel.accentLang)
            speechSynthesizer.speak(speechUtterance)
        }
    }
    
    func getNewSongLyrics() {
        viewModel.getNewSongLyrics()
        if let newSongLyrics = viewModel.finalLyrics {
            resultText.text = newSongLyrics
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        speechButton.isHidden = true 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
