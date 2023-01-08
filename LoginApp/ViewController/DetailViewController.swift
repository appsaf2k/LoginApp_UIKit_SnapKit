//
//  DetailViewController.swift
//  LoginApp
//
//  Created by @andreev2k on 07.01.2023.
//

import UIKit


class DetailViewController: UIViewController {
    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = """
This mini app, creating in learn process. Thank you from Andreev Sergey

🥳 👻 👍 🐣
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
    }
}
