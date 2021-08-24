//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Василий Пронин on 24.08.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    var welcomeValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcomeValue
        emojiLabel.text = "\u{1F44B}"
    }
    
}
