//
//  SponsorViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class SponsorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create timer to display the sponsor to the user for a specified amount of time
        _ = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "showWorkoutResults", userInfo: nil, repeats: false)
    }
    
    func showWorkoutResults() {
        self.performSegueWithIdentifier("toWorkoutResults", sender: self)
    }

}
