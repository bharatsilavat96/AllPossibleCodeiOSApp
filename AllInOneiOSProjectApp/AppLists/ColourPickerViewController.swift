//
//  ColourPickerViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 14/04/23.
//

import UIKit

class ColourPickerViewController: UIViewController {
    
    
    @IBOutlet weak var section: UIButton!
    @IBOutlet weak var normalview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        normalview.layer.masksToBounds = true
        normalview.layer.cornerRadius = normalview.layer.frame.width/2
        normalview.layer.borderWidth = 5
        normalview.layer.borderColor = UIColor.blue.cgColor
        normalview.backgroundColor = .cyan
        section.layer.masksToBounds = true
        section.layer.cornerRadius = 10
    }
    
    @IBAction func selction(_ sender: Any) {
        let colorpicker = UIColorPickerViewController()
        colorpicker.delegate = self
        present(colorpicker, animated: true, completion: nil)
    }
}
extension ColourPickerViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
}
