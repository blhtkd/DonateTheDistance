//
//  RegistrationViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit
//import EasyTipView

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var heightFeetField: UITextField!
    @IBOutlet weak var heightInchesField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    var firstName : String = ""
    var lastName : String = ""
    var heightFeet : String = ""
    var heightInches : String = ""
    var weight : String = ""
    
    var archiver = UserData()
    
    let letters = NSCharacterSet.letterCharacterSet()
    let digits = NSCharacterSet.decimalDigitCharacterSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFields()
        
        /*var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.whiteColor()
        preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.Top*/
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
        
        heightInchesField.delegate = self
        heightInchesField.keyboardType = UIKeyboardType.NumberPad
    }

    @IBAction func submit(sender: AnyObject) {
        firstName = firstNameField.text!
        if !(firstName == "") {
            archiver.firstName = firstName
        }
        
        lastName = lastNameField.text!
        if !(lastName == "") {
            archiver.lastName = lastName
        }
        
        heightFeet = heightFeetField.text!
        heightInches = heightInchesField.text!
        if !(heightFeet == "") {
            if !(heightInches == "") {
                archiver.height = Int(heightInches)! + (12 * Int(heightFeet)!)
            }
        }
        
        weight = weightField.text!
        if !(weight == "") {
            archiver.weight = Int(weight)!
        }

        archiver.registrationDate = NSDate()
        
        archiver.registrationComplete = true
        performSegueWithIdentifier("toCharityTable", sender: self)
    }
    
    
    @IBAction func editingChangedFirstName(sender: UITextField) {
        for char in (sender.text?.unicodeScalars)! {
            if !(letters.longCharacterIsMember(char.value)) {
                //show error
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! CharitySelectionViewController
        destinationViewController.registrationComplete = true
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Dismiss the keyboard when the user taps the Return key while editing a text field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    // returns the number of columns to display
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
}
