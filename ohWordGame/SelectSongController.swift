//
//  SelectSongController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/4/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit

class SelectSongController: UIViewController {
    
    let viewModel = SelectSongViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEnterView" {
            let enterWordController:EnterWordController = segue.destination as! EnterWordController
            viewModel.loadWordsFromApi(song_id: "1", completion: { data in
                //populate the viewModel with the words from the API
                enterWordController.viewModel.words = data
                enterWordController.wordDescription.text = data[0].description
            })
            viewModel.postNewGame(song_id: "1", user_id: "1", completion: { data in
                print("setting to: \(data.id)")
                enterWordController.game_id = data.id
            })
        }
    }
    
}
