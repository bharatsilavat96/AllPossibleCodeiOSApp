//
//  MapKitViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import MapKit
import CoreLocation


class MapKitViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the initial location and zoom level
        let initialLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
        let regionRadius: CLLocationDistance = 1000 // 1 kilometer
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // Add a pin annotation to the map
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "San Francisco"
        annotation.subtitle = "California, USA"
        mapView.addAnnotation(annotation)
        
        // Set the map view delegate
        mapView.delegate = self
        
        // Request location authorization and start updating user location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MKMapViewDelegate method to customize the pin annotation view
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil // Return nil for the user's current location annotation
        }
        
        let reuseIdentifier = "PinAnnotationView"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pinView?.canShowCallout = true
            pinView?.animatesDrop = true
            pinView?.pinTintColor = .red // Customize the pin color
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    // CLLocationManagerDelegate method to update map view with user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: 1000,
                                                      longitudinalMeters: 1000)
            mapView.setRegion(coordinateRegion, animated: true)
            locationManager.stopUpdatingLocation() // Stop updating location after the initial update
        }
    }
}
