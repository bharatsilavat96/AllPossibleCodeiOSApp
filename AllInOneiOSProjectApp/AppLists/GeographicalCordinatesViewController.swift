//
//  GeographicalCordinatesViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import MapKit

class GeographicalCordinatesViewController: UIViewController,MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let map = MKMapView(frame: self.view.bounds)
        map.showsUserLocation = true
        map.mapType = .satellite
        map.showsCompass = true
        map.showsScale = true
        map.showsTraffic = true
        map.isScrollEnabled = true
        map.isRotateEnabled = true
        map.isZoomEnabled = true
        map.isPitchEnabled = true
        
        let cordinate2D = CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629)
        let zoomLevel = 0.02
        let region = MKCoordinateRegion(center: cordinate2D, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        map.setRegion(map.regionThatFits(region), animated: true)
        map.isZoomEnabled = true
        self.view.addSubview(map)
    }

}
