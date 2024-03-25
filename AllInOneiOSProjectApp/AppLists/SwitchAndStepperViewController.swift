//
//  SwitchAndStepperViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class SwitchAndStepperViewController: UIViewController {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var stepperButton: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchButton.setOn(true, animated: true)
        switchButton.addTarget(self, action:#selector(SwitchAndStepperViewController.switchChanged(_ :)), for: UIControl.Event.valueChanged)
        let frame = CGRect(x: self.view.frame.midX, y: 120, width: 60, height: 30)
        let label = UILabel(frame: frame)
        label.text = "0"
        label.tag = 1
        self.view.addSubview(label)
        stepperButton.value = 0
        stepperButton.minimumValue = 0
        stepperButton.maximumValue = 20
        stepperButton.stepValue = 1
        stepperButton.addTarget(self, action: #selector(switchChnagedToStep(_:)), for: .valueChanged)
    }
    @objc func switchChanged(_ switchChange: UISwitch) {
        var message = "Turn On The Switch"
        if !switchChange.isOn{
            message = "Turn Off The Switch"
            let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
    }
    
    @objc func switchChnagedToStep(_ stepper: UIStepper) {
        let value = stepper.value
        let label = self.view.viewWithTag(1) as! UILabel
        label.text = "\(value)"
    }
}
