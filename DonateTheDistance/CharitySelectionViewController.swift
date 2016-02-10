//
//  CharitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/19/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class CharitySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var registrationComplete : Bool = false
    
    let charities: [String] = ["The Humane Society","Charity: Water","Stand Up 2 Cancer","Habitat for Humanity"]
    let charityIconNames: [String] = ["TheHumaneSocietyIcon.jpg", "CharityWaterIcon.png", "StandUpToCancerIcon.png", "HabitatForHumanity.png"]
    
    var activitySelection = ActivitySelectionViewController()
    var charitySelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CharityTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CharityTableViewCell
        cell.charityNameLabel.text = charities[indexPath.row]
        cell.charityImageView.image = UIImage(named: charityIconNames[indexPath.row])
        //charitySelected = charities[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        charitySelected = charities[indexPath.row]
        //activitySelection.charityName = charitySelected
        //performSegueWithIdentifier("toCharityDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! ActivitySelectionViewController
        destinationViewController.charityName = charitySelected
    }
}
