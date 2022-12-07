//
//  SecondViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var createNewLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgottenButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var loginLabel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
    }
}
extension SecondViewController {
    
    func setupText() {
        
        createNewLabel.text = "CREATE A NEW ACCOUNT"
        
        forgottenButton.setTitle("Forgotten password?", for: .normal)
        
        loginButton.setTitle("LOGIN", for: .normal)
        
        passwordLabel.text = "Password"
        emaillabel.text = "E-mail adress"
        
        rightLabel.text = "LOGIN"
        
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .systemPink
        
        forgottenButton.layer.cornerRadius = 20
        forgottenButton.setTitleColor(.white, for: .normal)
        
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
        {
            textField.resignFirstResponder()
            return true;
        }
    
}
