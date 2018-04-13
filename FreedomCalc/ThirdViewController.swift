//
//  ThirdViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK -Outlets and Properties

    var salary : String? {
        didSet{
            
        }
    }
    
    @IBAction func q(_ sender: Any) {
        print("Going back to second View")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("READY THIRD VIEW")
        print("Picked salary\(salary)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}

