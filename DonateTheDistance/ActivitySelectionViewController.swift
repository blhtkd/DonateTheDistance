//
//  ActivitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/21/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class ActivitySelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showCharityDetail(sender: AnyObject) {
        performSegueWithIdentifier("toCharityDetail", sender: self)
    }
    
    @IBAction func bikeButton(sender: AnyObject) {
        performSegueWithIdentifier("toWorkout", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
