//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Василий Пронин on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    @IBOutlet var logOutButton: UIButton!
    
    var welcomeValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.textColor = .white
        welcomeLabel.text = welcomeValue
        emojiLabel.text = "\u{1F44B}"
        
        logOutButton.tintColor = .white
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemTeal.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
