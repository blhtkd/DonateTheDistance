//
//  WorkoutViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {

    var selectedButton = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func walkButton(sender: AnyObject) {
        selectedButton = 1;
        performSegueWithIdentifier("toSponsor", sender: self)
    }
    
    @IBAction func runButton(sender: AnyObject) {
        selectedButton = 2;
    }
    
    @IBAction func bikeButton(sender: AnyObject) {
        selectedButton = 3;
    }
    

}
