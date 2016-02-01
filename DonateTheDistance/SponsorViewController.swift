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

        // Do any additional setup after loading the view.
        _ = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "showWorkoutResults", userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWorkoutResults() {
        self.performSegueWithIdentifier("toWorkoutResults", sender: self)
    }

}
