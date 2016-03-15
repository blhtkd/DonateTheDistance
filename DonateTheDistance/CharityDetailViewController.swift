//
//  CharitySelectionViewController.swift
//  DonateTheDistance
//
//  Created by Brooke Haile-Mariam on 12/19/15.
//  Copyright © 2015 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class CharityDetailViewController: UIViewController {
    

    var descArray : [String] = ["This charity saves the world", "This charity went to the market", "This charity is so last year", "This charity is the shit"]
    let charities: [String] = ["The Humane Society","Charity: Water","Stand Up 2 Cancer","Habitat for Humanity"]
    var archiver = UserData()
    var charityName = ""
    var desc = ""
    @IBOutlet weak var picture: UIImageView!
    
    
    @IBOutlet weak var detail: UITextView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        charityName = archiver.charity
        for(var i = 0; i < 4; i++){
            if(charityName == charities[i]){
                desc = descArray[i]
            }
        }
        detail.text = desc

        //detail.text = descA
        picture.image = UIImage(named: archiver.charityPic)
        
        // Do any additional setup after loading the view.
        
    }
    

}
