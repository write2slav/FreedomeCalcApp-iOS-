//
//  ViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.

//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var topLable: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("READY Button")
        performSegue(withIdentifier: "goToSecondView", sender: self)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("READY")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    


}

