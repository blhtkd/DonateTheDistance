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
    let charityIconNames: [String] = ["TheHumaneSociety.jpg", "CharityWater.png", "StandUpToCancer.png", "HabitatForHumanity.png"]
    
    @IBOutlet weak var tableView: UITableView!
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 120))
        
        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CharityTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CharityTableViewCell
        cell.charityNameLabel.text = charities[indexPath.row]
        cell.charityImageView.image = UIImage(named: charityIconNames[indexPath.row])
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        charitySelected = charities[indexPath.row]
        //performSegueWithIdentifier("toCharityDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
        
        let destinationViewController = segue.destinationViewController as! ActivitySelectionViewController
        destinationViewController.charityName = charities[(selectedIndex?.row)!]
    }
}
