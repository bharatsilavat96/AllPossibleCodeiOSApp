//
//  AlertsViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 15/04/23.
//

import UIKit

class AlertsViewController: UIViewController {
    
    @IBOutlet weak var alertActionButton: UIButton!
    @IBOutlet weak var alertSimpleButton: UIButton!
    @IBOutlet weak var alert2SimpleButton: UIButton!
    @IBOutlet weak var showToasterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func showActionSheet(sender: UIButton) {
        let alert = UIAlertController(title: "Information", message: "What's Your Favorite", preferredStyle:UIAlertController.Style.actionSheet)
        
        let fishing = UIAlertAction(title: "Fishing", style: .default, handler:{
            (alerts:UIAlertAction) -> Void in
            print("I love Fishing")
        })
        
        let hunting = UIAlertAction(title: "Hunting", style: .destructive, handler: {
            (alerts:UIAlertAction) -> Void in
            print("I like Hunting")
        })
        
        let nothing = UIAlertAction(title: "Nothing", style: .cancel, handler:{(alerts:UIAlertAction) -> Void in
            print("A Life id Non-sence")
            
        })
        
        alert.addAction(fishing)
        alert.addAction(hunting)
        alert.addAction(nothing)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showSimpleAlert(sender: UIButton) {
        print("Show Simple Alert ")
        // Create an alert controller
        let alertController = UIAlertController(title: "Alert", message: "This is a simple alert.", preferredStyle: .alert)
        
        // Add an action to the alert
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Present the alert
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func showSimpleAlert2(sender: UIButton) {
        // Create an alert controller
        let alertController = UIAlertController(title: "Alert", message: "This is an alert.", preferredStyle: .alert)
        
        // Add actions to the alert
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let destructiveAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alertController.addAction(destructiveAction)
        
        // Present the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showToasterButtonSction(sender: UIButton) {
        let toastView = ToastView(message: "This is a toast message.")
        toastView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(toastView)
        
        // Set toast view constraints
        NSLayoutConstraint.activate([
            toastView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toastView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            toastView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toastView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Animate toast view
        UIView.animate(withDuration: 0.3, delay: 2.0, animations: {
            toastView.alpha = 0.0
        }, completion: { _ in
            toastView.removeFromSuperview()
        })
    }
    
}
class ToastView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(message: String) {
        super.init(frame: .zero)
        setupView()
        label.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 8
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
}
