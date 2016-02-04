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
    
    var archiver = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFields()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        if ((firstNameField.text?.isEmpty) == nil) {
            
            print("1")
        } else {
            archiver.firstName = firstNameField.text!
        }
        
        if ((lastNameField.text?.isEmpty) == nil) {
                        print("2")
        } else {
            archiver.lastName = lastNameField.text!
        }
        
        if ((heightFeetField.text?.isEmpty) == nil) {
            
            print("3")
        } else {
            print("3")
            print(heightFeetField.text)
            //archiver.height = Int(heightField.text!)!
        }
        
        if ((weightField.text?.isEmpty) == nil) {
            
            print("4")
        } else {
            //archiver.weight = Int(weightField.text!)!
        }

        archiver.registrationDate = NSDate()
        print(archiver.registrationDate)
        performSegueWithIdentifier("toCharityTable", sender: self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
}
