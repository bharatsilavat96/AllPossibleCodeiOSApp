//
//  BasicMapkitViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

import MapKit

class BasicMapkitViewController: UIViewController, MKMapViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let map = MKMapView(frame: self.view.bounds)
        map.showsUserLocation = true
        map.mapType = .satellite
        
        self.view.addSubview(map)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
