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
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotNameButton.titleLabel?.minimumScaleFactor = 0.5
        forgotPasswordButton.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotPasswordButton.titleLabel?.minimumScaleFactor = 0.5
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileVC = segue.destination as? WelcomeViewController else { return }
        profileVC.usernameValue = username
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(false)
    }
    
    @IBAction func remindNameOrPassword(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your username is \(username) \u{1F609}")
            : showAlert(title: "Oops!", message: "Your password is \(password) \u{1F609}")
    }
    
    @IBAction func logIn() {
        if usernameTextField.text != username || passwordTextField.text != password {
            showAlert(
                title: "Invalid username or password",
                message: "Enter correct username and password"
            )
        }
    }
    
    @IBAction func logOut(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = "" }
        

        alert.addAction(okAction)
        present(alert, animated: true)
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

