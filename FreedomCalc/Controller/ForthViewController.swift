//
//  ForthViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import RealmSwift
class FourthViewController: UIViewController {
    var realmDB = try! Realm()
    var result: String?{
    didSet{
    print("Result received")
        
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.text = result!+"\nUSD"
        savingResultToDB(itemTosave: result!)
    }
    
    
    @IBOutlet weak var resultTextField: UILabel!
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
    }
    func savingResultToDB(itemTosave: String){
        let realmObject = DataModel()
        realmObject.amountOfMoneyToBeFree = itemTosave
        do {
            try realmDB.write {
                realmDB.deleteAll()
                realmDB.add(realmObject)
            }
        } catch{
            print("ERROR\(error)")
        }
        
    }
}
