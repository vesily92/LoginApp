//
//  ViewController.swift
//  LoginApp
//
//  Created by Василий Пронин on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func remindNameOrPassword(_ sender: UIButton) {
        switch sender {
        case forgotNameButton:
            showAlert(withTitle: "Oops!", andMessage: "Your username is User \u{1F609}")
        default:
            showAlert(withTitle: "Oops!", andMessage: "Your password is Password \u{1F609}")
        }
    }
    @IBAction func logIn() {
        showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in self.passwordTextField.text = "" })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

