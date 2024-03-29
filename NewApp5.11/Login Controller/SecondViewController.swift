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
        
        initializeSetup()
        setupUI()
        setupText()
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "RegistrationViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
            
            let backItem = UIBarButtonItem(title: "Back", style: .bordered, target: nil, action: nil)
            navigationItem.backBarButtonItem = backItem
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButtoAction(_ sender: Any) {
        
        if passwordView.wrongPasswordLabel.isHidden && emailView.wrongEmailLabel.isHidden {
            let vc = TabBarConroller()
            vc.navigationItem.setHidesBackButton(true, animated: true)
            navigationController?.pushViewController(vc, animated: true)
        } else if passwordView.wrongPasswordLabel.isHidden == false && emailView.wrongEmailLabel.isHidden == false {
            showAlert(text: "Вы не заполнили оба поля")
        } else if emailView.wrongEmailLabel.isHidden == false {
            showAlert(text: "Вы некорректно заполнили логин")
        } else {
            showAlert(text: "Вы некорректно заполнили пароль")
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
        let emailProfile = UserDefaults.standard.string(forKey: "email") ?? ""
        if emailProfile == "" {
            emailView.emailTextfield.placeholder = "enter your email"
        } else {
            emailView.emailTextfield.text = emailProfile
        }
        let passwordProfile = UserDefaults.standard.string(forKey: "password") ?? ""
        if passwordProfile == "" {
            passwordView.passwordTextField.placeholder = "enter your password"
        }else {
            passwordView.passwordTextField.text = passwordProfile
        }
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
    func take(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel) {
        if textField.text!.count >= 6 {
            errorLabel.isHidden = true
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.cornerRadius = 5
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Поле должно содержать минимум 6 символов"
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 3.0

        }
    }
}

extension SecondViewController: EmailTextFieldDelegate {
    func takeString(textField: UITextField) {
        if textField.text!.contains("@") {
            emailView.wrongEmailLabel.isHidden = true
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.cornerRadius = 5
        } else {
            emailView.wrongEmailLabel.isHidden = false
            emailView.wrongEmailLabel.text = "Поле должно содержать - @"
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 3.0
        }
    }
    
    
//    func takeString(textField: UITextField, emailLabel: UILabel, wrongEmailLabel: UILabel) {
//        if textField.text!.contains("@") {
//            wrongEmailLabel.isHidden = true
//            textField.layer.borderColor = UIColor.white.cgColor
//            textField.layer.cornerRadius = 5
//        } else {
//            wrongEmailLabel.isHidden = false
//            wrongEmailLabel.text = "Поле должно содержать - @"
//            textField.layer.borderColor = UIColor.red.cgColor
//            textField.layer.borderWidth = 3.0
//        }
//    }
}

// MARK: - Extension for hidden label setupUI
    

