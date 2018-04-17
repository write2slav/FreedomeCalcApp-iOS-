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
    
    
    //Unwind segue destination
    @IBAction func myToSecondViewUnwindAction(unwindSegue: UIStoryboardSegue){
    }
    @IBOutlet weak var salaryPicker: UIPickerView!
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if salaryChoosen == true{
          performSegue(withIdentifier: "goToThirdView", sender: self)
        }else{
            
            let alert = UIAlertController(title: "Salary has not been selected", message: "Please select a salary and press NEXT", preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
                
            }
            
            alert.addAction(dismissAction)
            //Presenting Alert View
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK - Instance Methods
    let salaryArray = ["1000","1500","2000","2500","3000","3500","4000","4500","5000"]
    var pickedSalary = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("secondViewLoaded")
        
        salaryPicker.delegate = self
        salaryPicker.dataSource = self
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        print(salaryArray[row])
        pickedSalary = salaryArray[row]
        salaryChoosen = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ThirdViewController
        destinationVC.salary = pickedSalary
    }
    
    
    
    
}
