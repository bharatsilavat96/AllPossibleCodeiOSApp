//
//  HTMLToSwiftConverterViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit
import WebKit

class HTMLToSwiftConverterViewController: UIViewController, WKUIDelegate {
    
    
    @IBOutlet weak var pastHtmlStringTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: CGRect.zero)
        view.addSubview(webView)
        webView.isHidden = true
        webView.uiDelegate = self
        
        // Add constraints to the WKWebView to determine its position and size
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    @IBAction func goToSwift(sender: UIButton) {
        print("goToSwift button tapped")
            let html = pastHtmlStringTextField.text ?? ""
            let js = "alert('Hello Xcode and Swift');"
            webView.evaluateJavaScript(js) { (info, error) in
                if let convertedString = info as? String {
                    print("Converted Swift String: \(convertedString)")
                } else {
                    print("Failed to convert to Swift string")
                }
                self.webView.loadHTMLString(html, baseURL: nil)
            }
            self.view.addSubview(webView)
        }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert) // Fix: Use 'message' parameter in the alert
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            completionHandler()
        }))
        self.present(alert, animated: true)
    }
}

