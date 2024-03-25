//
//  ShowWebsiteViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import WebKit

class ShowWebsiteViewController: UIViewController {
    
    @IBOutlet weak var pastUrltextField: UITextField!
    @IBOutlet weak var goToWebsiteButton: UIButton!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a WKWebView instance
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        webView.isHidden = true // Hide the web view initially
        
    }
    
    @IBAction func goToWebsite(sender: UIButton) {
        if let urlString = pastUrltextField.text, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request) // Load the website in the web view
            
            // Show the web view and hide the keyboard
            webView.isHidden = false
            pastUrltextField.resignFirstResponder()
        }
    }
}

