//
//  FirstViewController.swift
//  Joinmatch-iOS
//
//  Created by Jorge Ríos on 25/06/17.
//  Copyright © 2017 Joinmatch-team. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        let span = MKCoordinateSpanMake(0.01, 0.03)
        let myLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let location = CLLocationCoordinate2D(latitude: -12.046373, longitude: -77.042754)
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, 2000, 2000), animated: true)
            
        let match = MatchAnnotation(title: "Partido de futbol", subtitle: "Plaza 2 de mayo", coordinate: location)
        
        mapView.addAnnotation(match)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

