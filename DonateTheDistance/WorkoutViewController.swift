//
//  WorkoutViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import CoreLocation
import HealthKit
import UIKit
import CoreData

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    
    //Tracks the duration of the run, in seconds
    var seconds = 0.0
    //Holds the cumulative distance of the run, in meters
    var distance = 0.0
    
    var managedObjectContext: NSManagedObjectContext?
    
    
    //The object you’ll tell to start or stop reading the user’s location
    lazy var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        //Tracks the best and most precise location readings
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Intelligently helps the device save power throughout a user’s run (if they stop)
        _locationManager.activityType = .Fitness
        
        // Movement threshold for new events
        _locationManager.distanceFilter = 10.0
        return _locationManager
    }()
    
    //An array to hold all the Location objects that will roll in
    lazy var locations = [CLLocation]()
    
    //Will fire each second and update the UI accordingly
    lazy var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        //Request the location usage authorization from your users
        locationManager.requestAlwaysAuthorization()
        
        startButton.hidden = false
        stopButton.hidden = true
        
        timeLabel.hidden = true
        distanceLabel.hidden = true
        paceLabel.hidden = true
    }
    
    //The timer is stopped when the user navigates away from the view
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startLocationUpdates() {
        //The location manager will be lazily instantiated
        locationManager.startUpdatingLocation()
    }
    
    // This method will be called every second, by using an NSTimer. Each time this method is called, you increment the second count and update each of the statistics labels accordingly.
    func eachSecond(timer: NSTimer) {
        seconds++
        let secondsQuantity = HKQuantity(unit: HKUnit.secondUnit(), doubleValue: seconds)
        timeLabel.text = "Time: " + secondsQuantity.description
        let distanceQuantity = HKQuantity(unit: HKUnit.meterUnit(), doubleValue: distance)
        distanceLabel.text = "Distance: " + distanceQuantity.description
        
        let paceUnit = HKUnit.secondUnit().unitDividedByUnit(HKUnit.meterUnit())
        let paceQuantity = HKQuantity(unit: paceUnit, doubleValue: seconds / distance)
        paceLabel.text = "Pace: " + paceQuantity.description
    }
    
//    func saveRun() {
//        // 1
//        let savedRun = NSEntityDescription.insertNewObjectForEntityForName("Run",
//            inManagedObjectContext: managedObjectContext!) as! Run
//        savedRun.distance = distance
//        savedRun.duration = seconds
//        savedRun.timestamp = NSDate()
//        
//        // 2
//        var savedLocations = [Location]()
//        for location in locations {
//            let savedLocation = NSEntityDescription.insertNewObjectForEntityForName("Location",
//                inManagedObjectContext: managedObjectContext!) as! Location
//            savedLocation.timestamp = location.timestamp
//            savedLocation.latitude = location.coordinate.latitude
//            savedLocation.longitude = location.coordinate.longitude
//            savedLocations.append(savedLocation)
//        }
//        
//        savedRun.locations = NSOrderedSet(array: savedLocations)
//        run = savedRun
//    }

    @IBAction func walkButton(sender: AnyObject) {
        performSegueWithIdentifier("toSponsor", sender: self)
    }
    
    @IBAction func startPressed(sender: AnyObject) {
        startButton.hidden = true
        stopButton.hidden = false
        
        timeLabel.hidden = false
        distanceLabel.hidden = false
        paceLabel.hidden = false
        
        seconds = 0.0
        distance = 0.0
        locations.removeAll(keepCapacity: false)
        timer = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: "eachSecond:",
            userInfo: nil,
            repeats: true)
        startLocationUpdates()
    }
    
    @IBAction func stopPressed(sender: AnyObject) {
        let refreshAlert = UIAlertController(title: "Refresh", message: "Workout finished.", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Discard", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
    }

}

//Class extension to conform to the CLLocationManagerDelegate protocol
extension WorkoutViewController: CLLocationManagerDelegate {
    
    //Method that is called each time there are new location updates to provide the app
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            //Make sure the device has a confident reading within 20 meters of the user's device
            if location.horizontalAccuracy < 20 {
                //Update the user's distance
                if self.locations.count > 0 {
                    distance += location.distanceFromLocation(self.locations.last!)
                }
                
                //Save the user's location
                self.locations.append(location)
            }
        }
    }
}
