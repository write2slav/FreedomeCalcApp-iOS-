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
            print("RECEIVED SALARY FROM THIRDVIEWCONTROLLER \(result!)")
        }
    }
    override func viewWillAppear(_ animated: Bool) {


        if realmDB.isEmpty{
            print("USER DOES NOT HAVE A SAVED RESULT")
            saveButton.isHidden = false
            
        } else {
            print("USER HAS A SAVED RESULT \(realmDB.objects(DataModel.self).first?.amountOfMoneyToBeFree)")
            saveButton.isHidden = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.text = result!+"\nUSD"
    }
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var resultTextField: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        savingResultToDB(itemTosave: result!)
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        saveButton.isHidden = true
        shareButton.isHidden = true
        goBackButton.isHidden = true
        
        let image = self.view.asImage()
        
        shareButton.isHidden ? true : false
        saveButton.isHidden ? true : false
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
                saveButton.isHidden = true

            }
        } catch{
            print("ERROR\(error)")
        }
    }
}
// MARK extension to save screen image with function asImage
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
