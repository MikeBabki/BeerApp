//
//  SecondViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
   
    // MARK: - Outlets
    
  
    @IBOutlet weak var createANewButton: UIButton!
    
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
// MARK: - Extension for SecondViewController
extension SecondViewController {
    
    func setupText() {
        
        createANewButton.setTitle("CREATE A NEW ACCOUNT", for: .normal)
        createANewButton.setTitleColor(.white, for: .normal)
        
        forgottenButton.setTitle("Forgotten password?", for: .normal)
        
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        
        passwordLabel.text = "Password"
        passwordLabel.shadowColor = .gray
        emaillabel.text = "E-mail adress"
        emaillabel.shadowColor = .gray
        
//        rightLabel.text = "LOGIN"
        
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
