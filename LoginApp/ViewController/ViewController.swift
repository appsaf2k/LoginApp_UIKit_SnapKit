//
//  ViewController.swift
//  LoginApp
//
//  Created by @andreev2k on 06.01.2023.
//

import UIKit
import SnapKit

//MARK: For send text on WelcomeVC
protocol FirstViewControllerDelegate {
    func update(userName: String)
}

class ViewController: UIViewController, FirstViewControllerDelegate, UITextFieldDelegate {
    func update(userName: String) {
        self.userName.text = userName
    }
    
    //MARK: Login View
    let userName: UITextField = {
        let userName = UITextField()
        userName.placeholder = "User Name"
        userName.borderStyle = .roundedRect
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    let password: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    lazy var logInButton: UIButton = {
        let logIn = UIButton(type: .system)
        logIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        logIn.setTitle("Log In", for: .normal)
        logIn.addTarget(self, action: #selector(tabBar), for: .touchUpInside)
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()
    
    //MARK: Buttons from Forgot
    lazy var forgotUserName: UIButton = {
        let forgotUserName = UIButton(type: .system)
        forgotUserName.setTitle("Forgot User Name?", for: .normal)
        forgotUserName.addTarget(self, action: #selector(forgotUserNameAlert), for: .touchUpInside)
        forgotUserName.translatesAutoresizingMaskIntoConstraints = false
        return forgotUserName
    }()
    lazy var forgotPassword: UIButton = {
        let forgotPassword = UIButton(type: .system)
        forgotPassword.setTitle("Forgot Password?", for: .normal)
        forgotPassword.addTarget(self, action: #selector(forgotPasswordAlert), for: .touchUpInside)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        return forgotPassword
    }()
    
    @objc func forgotUserNameAlert() {
        showAlert(title: "Oops!", message: "Your name is 'User'")
    }
    
    @objc func forgotPasswordAlert() {
        showAlert(title: "Oops!", message: "Yuor password is 'User'")
    }
    
    //MARK: StackView
    let stackViewVertical = UIStackView()
    let stackViewHorizontal = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stackViewConfig()
        makeConstraints()
        closeKeyboard()
    }
    
    //MARK: adding Tabbar for WelcomeVC and DetailVC
    @objc private func tabBar() {
        if userName.text == "User" && password.text == "User" {
            let tabBar = UITabBarController()
            let welcome = WelcomeViewController()
            
            if let text = userName.text {
                welcome.text = text
                welcome.delegate = self
            }
            let detail = DetailViewController()
            welcome.title = "Welcome"
            detail.title  = "Detail"
            
            tabBar.setViewControllers([welcome, detail], animated: true)
            
            //MARK: adding icons in the tabBar
            guard let items = tabBar.tabBar.items else { return }
            let images = ["person", "gear"]
            
                items[1].badgeValue = "1"
            
            for x in 0..<items.count {
                items[x].image = UIImage(systemName: images[x])
            }
            
            tabBar.modalPresentationStyle = .fullScreen
            present(tabBar, animated: true)
            
        } else {
            if userName.text!.isEmpty  {
                showAlert(title: "Name is ampty!", message: "Enter your Name")
            }
            if userName.text != "User" {
                showAlert(title: "Bad name!", message: "Name '\(String(describing: userName.text!))' not Valid!")
            }
            if password.text!.isEmpty {
                showAlert(title: "Password is ampty!", message: "Enter your Password")
            }
            if password.text != "User" {
                showAlert(title: "Bad password!", message: "Password '\(String(describing: password.text!))' not Valid!")
            }
        }
    }
}

