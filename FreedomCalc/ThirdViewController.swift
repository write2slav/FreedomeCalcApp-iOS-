//
//  ThirdViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK -Outlets and Properties
    
    let ageArray = Array(18...120).map { String($0) }
    var tempCurAge : String = ""
    var tempExpAge : String = ""
    var ageFromUserString : String = ""
    var salary : String? {
        didSet{
        print("Salary received")
        }
    }
    //Unwind segue destination is here
    @IBAction func myThirdViewUnwindAction(unwindSegue: UIStoryboardSegue){
    }
    @IBOutlet weak var currentAgePicker: UIPickerView!
    @IBOutlet weak var expectedAgePicker: UIPickerView!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToFourthViewController", sender: self)

        
    }
    //GOING BACK TO SECOND VIEW
    @IBAction func q(_ sender: Any) {
        print("Going back to second View")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //PRINTING PASSED DATA
        print("Picked salary\(salary!)")

        currentAgePicker.dataSource = self
        currentAgePicker.delegate = self
        
        expectedAgePicker.dataSource = self
        expectedAgePicker.delegate = self
        
        currentAgePicker.tag = 1
        expectedAgePicker.tag = 2
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return ageArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            print("CURRENT AGE SELECTED")
            print(ageArray[row])
            tempCurAge = ageArray[row]
            
        }else{
            print("EXPECTED AGE SELECTED")
            print(ageArray[row])
            tempExpAge = ageArray[row]
        }
        print(ageArray[row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if  segue.identifier == "goBackToViewTwo"{
            print("HERE WE ARE")
       }else {
                let destinationVC = segue.destination as! FourthViewController
                destinationVC.result = calcMoney(salary: self.salary!, curentAge: self.tempCurAge, expectedAge: self.tempExpAge)

        }

    }
    //Calculating amount needed never to work
    func calcMoney(salary: String, curentAge: String, expectedAge: String)-> String{
        
        let salaryInt = Int(salary)
        let expectedAgeInt = Int(expectedAge)
        let currentAgeInt = Int(curentAge)
        
        let result = 12 * (expectedAgeInt! - currentAgeInt!) * salaryInt!
        print(result)
        return String(result)
    }
    
    
    
    
}

