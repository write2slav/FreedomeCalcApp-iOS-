//
//  SecondViewController.swift
//  FreedomCalc
//
//  Created by admin on 4/13/18.
//  Copyright © 2018 admin. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate{
    

    //MARK -Outlets and Properties
    var salaryChoosen : Bool = false
    let salaryArray = ["1000","1500","2000","2500","3000","3500","4000","4500","5000"]
    var pickedSalary = ""
    
    @IBOutlet weak var salaryPicker: UIPickerView!

    //Setting this Controller as Unwind segue destination
    @IBAction func myToSecondViewUnwindAction(unwindSegue: UIStoryboardSegue){}
   
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if salaryChoosen {
          performSegue(withIdentifier: "goToThirdView", sender: self)
        } else {
            print("SALARY HAS NOT BEEN SELECTED")
            let alert = UIAlertController(title: "Salary has not been selected", message: "Please select a salary and press NEXT", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            }
            alert.addAction(dismissAction)
            //Presenting Alert View "Salary has not been selected"
            self.present(alert, animated: true, completion: nil)
        }
    }
    //MARK - Instance Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        salaryPicker.delegate = self
        salaryPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK - Delgates and Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salaryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salaryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedSalary = salaryArray[row]
        salaryChoosen = true
        print("SALARY HAS BEEN SELECTED")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ThirdViewController
        destinationVC.salary = pickedSalary
    }
}
