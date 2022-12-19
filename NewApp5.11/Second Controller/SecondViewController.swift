//
//  SecondViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
   
    // MARK: - Outlets
    
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var emailView: EmailTextFieldView!
    @IBOutlet weak var passwordView: PasswordTextFiledView!
    @IBOutlet weak var createANewButton: UIButton!
    @IBOutlet weak var forgottenButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var loginLabel: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.wrongEmailLabel.isHidden = true
        
        initializeSetup()
        setupUI()
        setupText()
        
    }
    
    @IBAction func loginButtoAction(_ sender: Any) {

        if passwordView.wrongPasswordLabel.isHidden && emailView.wrongEmailLabel.isHidden{
            loginButton.isEnabled = true
            
        }else if passwordView.wrongPasswordLabel.isHidden == false && emailView.wrongEmailLabel.isHidden == false  {
            let alert = UIAlertController(title: "Вы не заполнили оба поля", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             
            }))
             
            self.present(alert, animated: true)
        }else if emailView.wrongEmailLabel.isHidden == false{
            let alert = UIAlertController(title: "Вы некорректно заполнили логин", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             
            }))
             
            self.present(alert, animated: true)
            
        }else if passwordView.wrongPasswordLabel.isHidden == false  {
            
            let alert = UIAlertController(title: "Вы некорректно заполнили пароль", message: nil, preferredStyle: .alert)
             
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             
            }))
             
            self.present(alert, animated: true)
        }else {
            print("opa")
        }
    }
    
    // MARK: - Private methods
    
    private func initializeSetup() {
        passwordView.tfDelegate = self
        emailView.tfDelegate = self
    }
}

// MARK: - Extension for SecondViewController

extension SecondViewController {
    
    func setupText() {
        
        emailView.emailLabel.text = "Login"
        emailView.wrongEmailLabel.text = "Sasa"
        
        passwordView.wrongPasswordLabel.text = "Koka"
        passwordView.passwordLabel.text = "Password"
        
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

// MARK: - Extension for layout

extension SecondViewController {
    
    func setupUI() {
        if UIScreen.main.bounds.width < 375 {
            buttonsStackView.setCustomSpacing(6, after: loginButton)
        }
        else {
            buttonsStackView.setCustomSpacing(66, after: loginButton)
        }
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .horizontal
        
    }
}

// MARK: - Extension for textField delegate
    
extension SecondViewController: PasswordTextFieldDelegate{
    func takeString(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel) {
        if textField.text!.count >= 6 {
            errorLabel.isHidden = true
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Поле должно содержать минимум 6 символов"
        }
    }
}

extension SecondViewController: EmailTextFieldDelegate {
    
    func takeString(textField: UITextField, emailLabel: UILabel, wrongEmailLabel: UILabel) {
        if textField.text!.contains("@") {
            wrongEmailLabel.isHidden = true
        } else {
            wrongEmailLabel.isHidden = false
            wrongEmailLabel.text = "Поле должно содержать - @"
        }
    }
}

// MARK: - Extension for hidden label setupUI
    


// MARK: - Extension for PasswordTextField (hide password textfield)
//extension SecondViewController{
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

