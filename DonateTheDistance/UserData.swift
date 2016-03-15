//
//  UserData.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/3/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class UserData: NSObject {
    var firstName = ""
    var lastName = ""
    var height = 0
    var weight = 0
    
    var totalDistance = 0.0
    var totalDonated = 0.0
    var charity = ""
    var charityPic = ""
    var registrationDate = NSDate()
    var registrationComplete = false
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.firstName = (decoder.decodeObjectForKey("firstName") as? String)!
        self.lastName = (decoder.decodeObjectForKey("lastName") as? String)!
        
        self.height = decoder.decodeIntegerForKey("height")
        self.weight = decoder.decodeIntegerForKey("weight")
        
        self.totalDistance = decoder.decodeDoubleForKey("totalDistance")
        self.totalDonated = decoder.decodeDoubleForKey("totalDonated")
        self.charity = (decoder.decodeObjectForKey("charity") as? String)!
        self.charityPic = (decoder.decodeObjectForKey("charityPic") as? String)!
        self.registrationDate = (decoder.decodeObjectForKey("registrationDate") as? NSDate)!
        self.registrationComplete = (decoder.decodeBoolForKey("registrationComplete"))
    }

    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.firstName, forKey: "firstName")
        coder.encodeObject(self.lastName, forKey: "lastName")
        
        coder.encodeInteger(self.height, forKey: "height")
        coder.encodeInteger(self.weight, forKey: "weight")
        
        coder.encodeDouble(self.totalDistance, forKey: "totalDistance")
        coder.encodeDouble(self.totalDonated, forKey: "totalDonated")
        
        coder.encodeObject(self.charity, forKey: "charity")
        coder.encodeObject(self.charityPic, forKey: "charityPic")
        
        coder.encodeObject(self.registrationDate, forKey: "registrationDate")
        coder.encodeBool(self.registrationComplete, forKey: "registrationComplete")
    }

}
