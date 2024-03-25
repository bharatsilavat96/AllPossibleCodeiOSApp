//
//  PointAnnotationViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import MapKit

class PointAnnotationViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: self.view.frame)
        mapView.mapType = MKMapType.standard
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.pointOfInterestFilter = MKPointOfInterestFilter.init(excluding: [.airport])
        mapView.isScrollEnabled = true
        mapView.isRotateEnabled = true
        mapView.isZoomEnabled = true
        mapView.isPitchEnabled = true
        
        let cordinate2D = CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629)
        let zoomLevel = 0.02
        let region = MKCoordinateRegion(center: cordinate2D, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        let objectNotation = MKPointAnnotation()
        objectNotation.coordinate = cordinate2D
        objectNotation.title = "Nagpur"
        objectNotation.subtitle = "Maharastras City"
        
        mapView.addAnnotation(objectNotation)
        self.view.addSubview(mapView)
        
    }
    
}
