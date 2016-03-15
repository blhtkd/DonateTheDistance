//
//  WorkoutResultsViewController.swift
//  DonateTheDistance
//
//  Created by MU IT Program on 2/1/16.
//  Copyright © 2016 Brooke Haile-Mariam. All rights reserved.
//

import UIKit
import HealthKit
import MapKit

class WorkoutResultsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var archiver = WorkoutData()
    
    var run = Run()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        run = archiver.run
        
        
        
        print("Distance:  \(archiver.run.distance) Duration: \(archiver.run.duration)")
        configureView()
    }

    // Sets up the details of the run and puts them in the labels
    func configureView() {
        let distanceQuantity = HKQuantity(unit: HKUnit.meterUnit(), doubleValue: run.distance)
        distanceLabel.text = "Distance: " + distanceQuantity.description
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateLabel.text = dateFormatter.stringFromDate(run.timestamp)
        
        let secondsQuantity = HKQuantity(unit: HKUnit.secondUnit(), doubleValue: run.duration)
        timeLabel.text = "Time: " + secondsQuantity.description
        
        let paceUnit = HKUnit.secondUnit().unitDividedByUnit(HKUnit.meterUnit())
        let paceQuantity = HKQuantity(unit: paceUnit, doubleValue: run.duration / run.distance)
        paceLabel.text = "Pace: " + paceQuantity.description
        
        loadMap()
    }
    
    // Returns the MKCoordinateRegion of the run (An MKCoordinateRegion represents the display region for the map using a center point and a span that defines horizontal and vertical ranges)
    func mapRegion() -> MKCoordinateRegion {
        let initialLoc = run.locations[0] 
        
        var minLat = initialLoc.latitude
        var minLng = initialLoc.longitude
        var maxLat = minLat
        var maxLng = minLng
        
        let locations = run.locations as [Location]
        
        for location in locations {
            minLat = min(minLat, location.latitude)
            minLng = min(minLng, location.longitude)
            maxLat = max(maxLat, location.latitude)
            maxLng = max(maxLng, location.longitude)
        }
        
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: (minLat + maxLat)/2,
                longitude: (minLng + maxLng)/2),
            span: MKCoordinateSpan(latitudeDelta: (maxLat - minLat)*1.1,
                longitudeDelta: (maxLng - minLng)*1.1))
    }
    
    // Whenever the map comes across a request to add an overlay, it should check if it’s an MKPolyline
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if !overlay.isKindOfClass(MKPolyline) {
            return nil
        }
        
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = UIColor.blackColor()
        renderer.lineWidth = 3
        return renderer
    }
    
    // Update the data from the Location objects into an array of CLLocationCoordinate2D, the required format for polylines
    func polyline() -> MKPolyline {
        var coords = [CLLocationCoordinate2D]()
        
        let locations = run.locations
        for location in locations {
            coords.append(CLLocationCoordinate2D(latitude: location.latitude,
                longitude: location.longitude))
        }
        
        return MKPolyline(coordinates: &coords, count: run.locations.count)
    }
    
    // Check if there are points to draw, set the map region, and add the polyline overlay
    func loadMap() {
        if run.locations.count > 0 {
            mapView.hidden = false
            
            // Set the map bounds
            mapView.region = mapRegion()
            
            // Make the line(s!) on the map
            mapView.addOverlay(polyline())
        } else {
            // No locations were found!
            mapView.hidden = true
            //******can add an alert later
            print("no locations")
        }
    }
    
    @IBAction func toProfile(sender: AnyObject) {
        performSegueWithIdentifier("toProfile", sender: self)
        
    }
}
