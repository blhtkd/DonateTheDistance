//
//  ActivitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/21/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class ActivitySelectionViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    var charityName:String = String();
    var pictureName: String = "TheHumaneSocietyIcon.jpg"
    var archiver = UserData()
    
    @IBOutlet weak var charityDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charityName = archiver.charity
        charityDetailButton.setTitle(charityName, forState: UIControlState.Normal)
        picture.image = UIImage(named: pictureName);
        
    }



}
