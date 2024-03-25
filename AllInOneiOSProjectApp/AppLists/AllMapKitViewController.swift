//
//  AllMapKitViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class AllMapKitViewController: UIViewController {

    @IBOutlet weak var mapKitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func mapKitReaderAction(sender: UIButton) {
        let basicMapkitViewController = self.storyboard?.instantiateViewController(withIdentifier: "BasicMapkitViewController") as! BasicMapkitViewController
        self.navigationController?.pushViewController(basicMapkitViewController, animated: true)
    }

    @IBAction func geographicalCoordinateAction(sender: UIButton) {
        let geographicalCordinatesViewController = self.storyboard?.instantiateViewController(withIdentifier: "GeographicalCordinatesViewController") as! GeographicalCordinatesViewController
        self.navigationController?.pushViewController(geographicalCordinatesViewController, animated: true)
    }
    
    @IBAction func pointAnnotationAction(sender: UIButton) {
        let pointAnnotationViewController = self.storyboard?.instantiateViewController(withIdentifier: "PointAnnotationViewController") as! PointAnnotationViewController
        self.navigationController?.pushViewController(pointAnnotationViewController, animated: true)
    }
    
    @IBAction func reverceGeocodeAction(sender: UIButton) {
        let reverseGeoCodeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReverseGeoCodeViewController") as! ReverseGeoCodeViewController
        self.navigationController?.pushViewController(reverseGeoCodeViewController, animated: true)
    }
    @IBAction func basicMapKitAction(sender: UIButton) {
        let mapKitVC = self.storyboard?.instantiateViewController(withIdentifier: "MapKitViewController") as! MapKitViewController
        self.navigationController?.pushViewController(mapKitVC, animated: true)
    }
}
