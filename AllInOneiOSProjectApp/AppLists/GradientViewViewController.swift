//
//  GradientViewViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class GradientViewViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add gradient to firstView
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.frame = firstView.bounds
        gradientLayer1.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // Set the colors for the gradient
        firstView.layer.addSublayer(gradientLayer1)
        
        // Add gradient to secondView
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = secondView.bounds
        gradientLayer2.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor] // Set the colors for the gradient
        secondView.layer.addSublayer(gradientLayer2)
        
    }
    
}
