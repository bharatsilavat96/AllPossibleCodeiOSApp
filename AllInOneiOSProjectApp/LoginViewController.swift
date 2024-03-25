//
//  LoginViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 13/04/23.
//

import UIKit

class LoginViewController: UIViewController {
  
    var appLogoImageView = UIImageView()
    var loginView = UIView()
    var passWordView = UIView()
    var loginIdOrEmailTextField = UITextField()
    var loginPassTextFild = UITextField()
    var loginButton = UIButton ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
    }
}
extension LoginViewController {
    
    func addSubviews(){
        self.view.addSubview(loginView)
        self.view.addSubview(loginIdOrEmailTextField)
        self.view.addSubview(passWordView)
        self.view.addSubview(loginPassTextFild)
        self.view.addSubview(loginView)
        self.view.addSubview(appLogoImageView)
    }
    func setupUI() {
        
        loginView.frame = CGRect(x: 12, y: view.frame.midY - 56, width: view.frame.width - 24, height: 40)
        passWordView.frame = CGRect(x: 12, y: loginView.frame.maxY + 20, width: loginView.frame.width, height: 40)
        appLogoImageView.frame = CGRect(x: 12, y: 80, width: view.frame.width - 24, height: 120)
        appLogoImageView.backgroundColor = .yellow
        let changeByLayer = [loginView,passWordView,loginIdOrEmailTextField,loginPassTextFild,loginButton]
        changeByLayer.forEach { $0.layer.masksToBounds = true}
        changeByLayer.forEach { $0.layer.cornerRadius = 5 }
        loginView.layer.borderColor = UIColor.gray.cgColor
        passWordView.layer.borderColor = UIColor.gray.cgColor
        loginView.layer.borderWidth = 1
        passWordView.layer.borderWidth = 1
        loginIdOrEmailTextField.borderStyle = .none
        loginPassTextFild.borderStyle = .none
        loginIdOrEmailTextField.frame = CGRect(x: loginView.frame.minX + 8, y: loginView.frame.minY + 5, width: loginView.frame.width - 12, height: 30)
        loginPassTextFild.frame = CGRect(x: passWordView.frame.minX + 8, y: passWordView.frame.minY + 5, width: passWordView.frame.width - 12, height: 30)
        loginIdOrEmailTextField.placeholder = "Write Id Here ..."
        loginPassTextFild.placeholder = "Write Pass Here ..."
    }
}
