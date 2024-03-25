//
//  CustomActivityIndicatorViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 18/04/23.
//

import UIKit

class CustomActivityIndicatorViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Progress"
        label.font = .systemFont(ofSize: 36, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi/2), // ex to start animate from 12 Clock
                                      endAngle: .pi*2,
                                      clockwise: true)
        
        
        let trackShapLayer = CAShapeLayer()
        trackShapLayer.path = circlePath.cgPath
        trackShapLayer.fillColor = UIColor.clear.cgColor
        trackShapLayer.strokeColor = UIColor.lightGray.cgColor
        trackShapLayer.lineWidth = 15
        view.layer.addSublayer(trackShapLayer)
        
        self.shapeLayer.path = circlePath.cgPath
        self.shapeLayer.lineWidth = 15
        self.shapeLayer.strokeColor = UIColor.systemPink.cgColor
        self.shapeLayer.fillColor = UIColor.clear.cgColor
        self.shapeLayer.strokeEnd = 0  // on this we apply animation -
        view.layer.addSublayer(shapeLayer)
        
        let button = UIButton(frame: CGRect(x: view.frame.midX - 100, y: self.view.frame.maxY - 100, width: 200, height: 50))
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        button.contentMode = .center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
        
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
    
    @objc func didTapButton() {
        print("Button Tapped")
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false // it should be false to freex the Animation at any point
        animation.fillMode = .forwards // so that AnimatedView Will Remain in mainView
        shapeLayer.add(animation, forKey: "animationForCircularLine")
        
    }
}
