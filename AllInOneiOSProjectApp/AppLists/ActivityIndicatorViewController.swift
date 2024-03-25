//
//  ActivityIndicatorViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var stopActivityButton: UIButton!
    
    var timer: Timer?
    var stopButtonGradientLayer: CAGradientLayer?
    var mainViewGradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicatorView.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeButtonBorderColor), userInfo: nil, repeats: true)
        stopActivityButton.layer.masksToBounds = true
        stopActivityButton.layer.cornerRadius = 12
        stopActivityButton.layer.borderWidth = 2
    }
    
    @objc func changeButtonBorderColor() {
        
        if myActivityIndicatorView.isAnimating {
            // Remove previous gradient layers
            stopButtonGradientLayer?.removeFromSuperlayer()
            mainViewGradientLayer?.removeFromSuperlayer()
            
            // Generate random gradient colors
            let randomColor1 = UIColor.random().cgColor
            let randomColor2 = UIColor.random().cgColor
            myActivityIndicatorView.color = .random()
            
//            // Change border color of stopActivityButton using gradient
//            let stopButtonGradientLayer = CAGradientLayer()
//            stopButtonGradientLayer.frame = stopActivityButton.bounds
//            stopButtonGradientLayer.colors = [randomColor1, randomColor2]
//            stopButtonGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
//            stopButtonGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
//            stopActivityButton.layer.addSublayer(stopButtonGradientLayer)
//            view.bringSubviewToFront(stopActivityButton)
            // Change background color of mainView using gradient
            let mainViewGradientLayer = CAGradientLayer()
            mainViewGradientLayer.frame = view.bounds
            mainViewGradientLayer.colors = [randomColor1, randomColor2]
            mainViewGradientLayer.startPoint = CGPoint(x: 0, y: 0)
            mainViewGradientLayer.endPoint = CGPoint(x: 1, y: 1)
            view.layer.insertSublayer(mainViewGradientLayer, at: 0)
            
            // Update references to new gradient layers
//            self.stopButtonGradientLayer = stopButtonGradientLayer
            self.mainViewGradientLayer = mainViewGradientLayer
        }
    }
    
    @IBAction func stopActivityIndicator(sender: UIButton) {
        
        // Stop the activity indicator
        myActivityIndicatorView.stopAnimating()
        
        // Stop changing the border color of stopActivityButton
        timer?.invalidate()
        
        // Reset the border color of stopActivityButton to default
        stopActivityButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        // Change background color of mainView
        view.backgroundColor = UIColor.yellow
    }
}
