//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by @andreev2k on 06.01.2023.
//

import UIKit


class WelcomeViewController: UIViewController {
    var text = ""
    var delegate: FirstViewControllerDelegate?
    
    let userName: UILabel = {
        let userName = UILabel()
        userName.font = UIFont.boldSystemFont(ofSize: 35)
        userName.textColor = .darkGray
        userName.textAlignment = .center
        userName.numberOfLines = 0
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    //NARK: Botton LogOut
    lazy var logOutButton: UIButton = {
        let logOut = UIButton(type: .system)
        logOut.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        logOut.setTitle("Log Out", for: .normal)
        logOut.addTarget(self, action: #selector(dismissLog), for: .touchUpInside)
        logOut.translatesAutoresizingMaskIntoConstraints = false
        return logOut
    }()
    
    @objc private func dismissLog() {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeConstraints()
        userName.text = """
Welcome, \(text)!

👋
"""
    }
}
