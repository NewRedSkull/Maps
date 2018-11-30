//
//  ViewController.swift
//  Map
//
//  Created by Andrii on 11/30/18.
//  Copyright © 2018 Andrii. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        var spaun:MKCoordinateSpan = MKCoordinateSpan()
        spaun.latitudeDelta = 0.05
        spaun.longitudeDelta = 0.05
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        var region: MKCoordinateRegion = MKCoordinateRegion()
        region.center = myLocation
        region.span = spaun
        
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        let location2:CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.803543, -122.418683)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location2
        annotation.title = "SOMEWHERE"
        annotation.subtitle = "Stand-up comedy is a comic style in which a comedian performs in front of a live audience, usually speaking directly to them. The performer is commonly known."
        
        map.addAnnotation(annotation)

    }


}

