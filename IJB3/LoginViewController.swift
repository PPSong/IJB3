//
//  ViewController.swift
//  IJB3
//
//  Created by Penn on 17/10/2017.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import Toaster

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func attemptLogin(_ sender: UIButton) {
        guard let username = username.text, let password = password.text, !(username.isEmpty), !(password.isEmpty) else {
            Toast(text: "empty").show()
            return
        }
        
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        present(mainViewController!, animated: true, completion: nil)
    }
    
}

