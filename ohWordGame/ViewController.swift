//
//  ViewController.swift
//  ohWordGame
//
//  Created by Piyush Puri on 12/3/16.
//  Copyright © 2016 Piyush Puri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var rapNameField: UITextField!
    @IBOutlet weak var usernmae: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func startGame(_sender: UIButton) {
        //move to next screen? anything else to do here?
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.delegate = self 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return true
    }

}

