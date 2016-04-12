//
//  ActivitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/21/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class ActivitySelectionViewController: UIViewController {

    var charityName:String = String()
    var workoutType = WorkoutType.Default
    
    @IBOutlet weak var charityDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charityDetailButton.setTitle(charityName, forState: UIControlState.Normal)
        
    }

    @IBAction func showCharityDetail(sender: AnyObject) {
        performSegueWithIdentifier("toCharityDetail", sender: self)
    }
    
    @IBAction func walkButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func runButton(sender: AnyObject) {
        workoutType = WorkoutType.Run
        performSegueWithIdentifier("toWorkout", sender: self)
    }
    
    @IBAction func bikeButton(sender: AnyObject) {
        workoutType = WorkoutType.Bike
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! WorkoutViewController
        destinationViewController.workoutType = workoutType
    }
}
