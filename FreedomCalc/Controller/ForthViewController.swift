//
//  ForthViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var result: String?{
    didSet{
    print("Result received")
        
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.text = result!+"\nUSD"
    }
    
    
    @IBOutlet weak var resultTextField: UILabel!
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
    }
   
}
