//
//  SecondViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
   
    // MARK: - Outlets
    
    @IBOutlet weak var emailView: EmailTextFieldView!
    @IBOutlet weak var passwordView: PasswordTextFiledView!
    
    @IBOutlet weak var createANewButton: UIButton!
    @IBOutlet weak var forgottenButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordView.tfDelegate = self
        emailView.tfDelegate = self
      
        emailView.wrongEmailLabel.isHidden = true
        
        emailView.emailLabel.text = "Login"
        emailView.wrongEmailLabel.text = "Sasa"
        
        passwordView.wrongPasswordLabel.text = "Koka"
        passwordView.passwordLabel.text = "Password"
//        configureShowTextButton()
        setupText()
    }
    
    @IBAction func loginButtoAction(_ sender: Any) {
//        buttonIsEnabled()
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
    
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .systemPink
        
        forgottenButton.layer.cornerRadius = 20
        forgottenButton.setTitleColor(.white, for: .normal)
    }
}

// MARK: - Extension for textField delegate
    
extension SecondViewController: PasswordTextFieldProtocol{
    func takeString(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel) {
        if textField.text!.count >= 6 {
            errorLabel.isHidden = true
        }else {
        errorLabel.isHidden = false
        errorLabel.text = "Поле должно содержать минимум 6 символов"
        }
    }
    
    
}
extension SecondViewController: EmailProtocol {
    
    func takeString(textField: UITextField, emailLabel: UILabel, wrongEmailLabel: UILabel) {
        if textField.text!.contains("@") {
            wrongEmailLabel.isHidden = true
        }else {
            wrongEmailLabel.isHidden = false
            wrongEmailLabel.text = "Поле должно содержать - @"
        }
    }
}
// MARK: - Extension for hidden label setupUI
    


// MARK: - Extension for PasswordTextField (hide password textfield)
//extension SecondViewController {
//
//    func buttonIsEnabled() {
//
//        if wrongPasswordLabel.isHidden && wrongLoginLabel.isHidden && passwordTextField.text != "" && emailTextField.text != "" {
//            loginButton.isEnabled = true
//            print("Helsso")
//        } else {
//            loginButton.isEnabled = false
//        }
//
//    }
//}

