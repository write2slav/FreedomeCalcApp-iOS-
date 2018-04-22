//
//  ForthViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Social
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
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var resultTextField: UILabel!
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        
        shareButton.isHidden = true
        goBackButton.isHidden = true
        let image = self.view.asImage()
        shareButton.isHidden = false
        goBackButton.isHidden = false
        
        let activityVC =  UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
    
        self.present(activityVC, animated: true, completion: nil)
        

       
    }
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
    }
    //Function that saves result to Realm DB
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
extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
