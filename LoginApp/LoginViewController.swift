//
//  ViewController.swift
//  LoginApp
//
//  Created by Василий Пронин on 24.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileVC = segue.destination as? WelcomeViewController else { return }
        profileVC.welcomeValue = "Welcome, \(username)!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
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
    
    private func configureTextFields() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
            performSegue(withIdentifier: "SegueOne", sender: nil)
        }
        return true
    }
}

