//
//  DatePickerViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myDatePickerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myDatePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
           let dateFormatter = DateFormatter()

           // Set different date styles
           dateFormatter.dateStyle = .full
           //dateFormatter.dateStyle = .long
           //dateFormatter.dateStyle = .medium
           //dateFormatter.dateStyle = .short

           let dateString = dateFormatter.string(from: sender.date)
           myDatePickerLabel.text = dateString
       }
}
