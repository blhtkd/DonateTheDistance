//
//  RegistrationViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var heightFeetField: UITextField!
    @IBOutlet weak var heightInchesField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerInches: UIPickerView!
    
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
        pickerInches.hidden = true;
        
        heightFeetField.text = heightFeetPicker[0]
        heightInchesField.text = heightInchesPicker[0]
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
        heightFeetField.inputView = picker
        
        heightInchesField.delegate = self
        heightInchesField.inputView = pickerInches
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
    
    // Dismiss the keyboard when the user taps the "Return" key while editing a text field.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (pickerView.tag == 0) {
            return heightFeetPicker.count
        } else {
            return heightInchesPicker.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0) {
            return heightFeetPicker[row] 
        } else {
            return heightInchesPicker[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (pickerView.tag == 0) {
            heightFeetField.text = heightFeetPicker[row]
            picker.hidden = true
        } else {
            heightInchesField.text = heightInchesPicker[row]
            pickerInches.hidden = true
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if (textField == heightFeetField) {
            picker.hidden = false
        } else if (textField == heightInchesField) {
            pickerInches.hidden = false
        } else {
            picker.hidden = true
            pickerInches.hidden = true
        }
        
        return false
    }
    
}
