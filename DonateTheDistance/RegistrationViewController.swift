//
//  RegistrationViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var heightFeetField: UITextField!
    @IBOutlet weak var heightInchesField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    var firstName : String = ""
    var lastName : String = ""
    var heightFeet : String = ""
    var heightInches : String = ""
    var weight : String = ""
    
    var archiver = UserData()
    
    var heightFeetPicker = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var heightInchesPicker = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFields()
        picker.hidden = true;
        heightFeetField.text = heightFeetPicker[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Set the delegate and keyboard types for each input text field
    func initFields() {
        firstNameField.delegate = self
        firstNameField.keyboardType = UIKeyboardType.ASCIICapable
        
        lastNameField.delegate = self
        lastNameField.keyboardType = UIKeyboardType.ASCIICapable
        
        weightField.delegate = self
        weightField.keyboardType = UIKeyboardType.NumberPad
        
        heightFeetField.delegate = self
        heightFeetField.keyboardType = UIKeyboardType.NumberPad
        
        weightField.delegate = self
    }

    @IBAction func submit(sender: AnyObject) {
        firstName = firstNameField.text!
        if ((firstName) == "") {
            print("1")
        } else {
            archiver.firstName = firstName
        }
        
        lastName = lastNameField.text!
        if ((lastName) == "") {
            print("2")
        } else {
            archiver.lastName = lastName
        }
        
        heightFeet = heightFeetField.text!
        if ((heightFeet) == "") {
            print("3")
        } else {
            archiver.height = Int(heightFeet)!
        }
        
        heightInches = heightInchesField.text!
        if ((heightInches) == "") {
            print("4")
        } else {
            archiver.height = Int(heightInches)!
        }
        
        weight = weightField.text!
        if ((weight) == "") {
            print("5")
        } else {
            //archiver.weight = Int(weight)!
        }

        archiver.registrationDate = NSDate()
        
        archiver.registrationComplete = true
        performSegueWithIdentifier("toCharityTable", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! CharitySelectionViewController
        destinationViewController.registrationComplete = true
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return heightFeetPicker.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return heightFeetPicker[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        heightFeetField.text = heightFeetPicker[row]
        picker.hidden = true;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        picker.hidden = false
        return false
    }

    
}
