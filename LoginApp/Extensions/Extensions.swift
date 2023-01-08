//
//  FuncModels.swift
//  LoginApp
//
//  Created by @andreev2k on 06.01.2023.
//

import Foundation
import UIKit

extension ViewController {
    func stackViewConfig() {
        view.addSubview(stackViewVertical)
        stackViewVertical.axis         = .vertical
        stackViewVertical.distribution = .fillEqually
        stackViewVertical.spacing      = 16
        stackViewVertical.addArrangedSubview(userName)
        stackViewVertical.addArrangedSubview(password)
        stackViewVertical.addArrangedSubview(logInButton)
        
        view.addSubview(stackViewHorizontal)
        stackViewHorizontal.axis         = .horizontal
        stackViewHorizontal.distribution = .fillEqually
        stackViewHorizontal.addArrangedSubview(forgotUserName)
        stackViewHorizontal.addArrangedSubview(forgotPassword)
        StackViewInStackView()
    }
    
    func StackViewInStackView() {
        stackViewVertical.addArrangedSubview(stackViewHorizontal)
    }
    
    func makeConstraints() {
        stackViewVertical.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    //MARK: Adding closed keyboard after tapped "Return"
    func closeKeyboard() {
        self.userName.delegate = self
        self.password.delegate = self
    }
    //MARK: For working this method, append "UITextFieldDelegate" to "ViewController"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension WelcomeViewController {
    func makeConstraints() {
        view.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(240)
            make.left.right.equalToSuperview().inset(16)
        }
        
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(148)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}

extension DetailViewController {
    func makeConstraints() {
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(240)
            make.left.right.equalToSuperview().inset(32)
        }
        
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(148)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}
