//
//  ActivitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/21/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class ActivitySelectionViewController: UIViewController {

    var charityName:String = String();
    
    @IBOutlet weak var charityDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charityDetailButton.setTitle(charityName, forState: UIControlState.Normal)
        
    }

    @IBAction func showCharityDetail(sender: AnyObject) {
        performSegueWithIdentifier("toCharityDetail", sender: self)
    }
    
    @IBAction func bikeButton(sender: AnyObject) {
        performSegueWithIdentifier("toWorkout", sender: self)
    }

}
