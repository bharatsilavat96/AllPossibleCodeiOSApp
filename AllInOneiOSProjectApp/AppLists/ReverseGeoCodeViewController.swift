//
//  ReverseGeoCodeViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import MapKit

class ReverseGeoCodeViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            let geoCoder = CLGeocoder()
            let location = CLLocation(latitude: 20.5937, longitude: 78.9629)

            geoCoder.reverseGeocodeLocation(location) { (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let placemark = placemarks?.first {
                    print(placemark.name ?? "")
                }
            }
        }
}
