//
//  ThirdViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK - Outlets and Properties
    
    let ageArray = Array(18...120).map { String($0) }

    var tempCurAgeInt : Int = 0
    var tempExpAgeInt : Int = 0
    
    var ageFromUserString : String = ""
    var curAgeChoosen : Bool = false
    var expAgeChoosen : Bool = false

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
        if (curAgeChoosen && expAgeChoosen) && (tempCurAgeInt < tempExpAgeInt) == true{
           performSegue(withIdentifier: "goToFourthViewController", sender: self)
            
        }    else if tempCurAgeInt >= tempExpAgeInt {
            let alertAgeNotChoosen = UIAlertController(title: "Current age is greater than/or equal to Exepectation age", message: "Please select correct values and press NEXT", preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            }
            alertAgeNotChoosen.addAction(dismissAction)
            self.present(alertAgeNotChoosen, animated: true, completion: nil)
            print(curAgeChoosen && expAgeChoosen)
            print(tempCurAgeInt < tempExpAgeInt)
            
        } else {
            let alertAgeNotChoosen = UIAlertController(title: "Current age or Exepectation age has not been selected", message: "Please select both values and press NEXT", preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            }
            alertAgeNotChoosen.addAction(dismissAction)
            self.present(alertAgeNotChoosen, animated: true, completion: nil)
            print(curAgeChoosen || expAgeChoosen)
            print(curAgeChoosen && expAgeChoosen)
            print(tempCurAgeInt > tempExpAgeInt)
            print(tempExpAgeInt)
            print(tempCurAgeInt)
            
        }
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
    //MARK - Delgates and Data Source

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
            tempCurAgeInt = Int(ageArray[row])!
            curAgeChoosen = true
            
        }else{
            print("EXPECTED AGE SELECTED")
            print(ageArray[row])
            tempExpAgeInt = Int(ageArray[row])!
            expAgeChoosen = true
        }
        print(ageArray[row])
        
    }
    //Preparing for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if  segue.identifier == "goBackToViewTwo"{
            print("HERE WE ARE")
       }else {
                let destinationVC = segue.destination as! FourthViewController
                destinationVC.result = calcMoney(salary: self.salary!, curentAge: self.tempCurAgeInt, expectedAge: self.tempExpAgeInt)

        }

    }
    //Calculating amount needed never to work
    func calcMoney(salary: String, curentAge: Int, expectedAge: Int)-> String{
        
        let salaryInt = Int(salary)
        let result = 12 * (expectedAge - curentAge) * salaryInt!
        print(result)
        return String(result)
    }
    
    
    
    
}

