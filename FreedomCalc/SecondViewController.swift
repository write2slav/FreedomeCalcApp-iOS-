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
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }

    
    

    @IBOutlet weak var salaryPicker: UIPickerView!
    
    //MARK - Instance Methods
    let salaryArray = ["10000","15000","20000","25000","30000","35000"]
    var pickedSalary = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("secondVievLoaded")
        
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
        print("Z")
        return salaryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salaryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(salaryArray[row])
        pickedSalary = salaryArray[row]
        performSegue(withIdentifier: "goToThirdView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ThirdViewController
        destinationVC.salary = pickedSalary
    }
    
    
    
    
}
