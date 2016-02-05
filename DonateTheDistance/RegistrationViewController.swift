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
    
    var firstName : String = ""
    var lastName : String = ""
    var heightFeet : String = ""
    var heightInches : String = ""
    var weight : String = ""
    
    var archiver = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFields()
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
        weightField.keyboardType = UIKeyboardType.NumberPad
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
            archiver.weight = Int(weight)!
        }

        archiver.registrationDate = NSDate()
        print(archiver.registrationDate)
        
        archiver.registrationComplete = true
         print(archiver.registrationComplete)
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
    
}
