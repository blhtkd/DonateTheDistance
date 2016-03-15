//
//  WorkoutData.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 3/10/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit

class WorkoutData: NSObject {
    var run = Run()
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.run = (decoder.decodeObjectForKey("run") as? Run)!
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.run, forKey: "run")
    }
}
