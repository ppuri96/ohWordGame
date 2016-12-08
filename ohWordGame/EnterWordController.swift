//
//  EnterWordController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/5/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit

class EnterWordController: UIViewController {
    
    @IBOutlet weak var wordDescription: UILabel!
    @IBOutlet weak var wordText: UITextField! 
    
    var words     = [Word]()
    let viewModel = EnterWordsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.loadWordsFromApi{ data in
            self.words = data
            print(self.words)
            self.wordDescription.text = self.words[0].description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
