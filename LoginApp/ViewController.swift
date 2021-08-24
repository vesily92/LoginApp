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
    
    private let username = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileVC = segue.destination as? ProfileViewController else { return }
        profileVC.welcomeValue = "Welcome, \(username)!"
    }
    
    @IBAction func remindNameOrPassword(_ sender: UIButton) {
        switch sender {
        case forgotNameButton:
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your username is \(username) \u{1F609}"
            )
        default:
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your password is \(password) \u{1F609}"
            )
        }
    }
    @IBAction func logIn() {
        if usernameTextField.text != username || passwordTextField.text != password {
            showAlert(
                withTitle: "Invalid username or password",
                andMessage: "Enter correct username and password"
            )
        }
    }
    
    @IBAction func logOut(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                self.passwordTextField.text = "" }
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

