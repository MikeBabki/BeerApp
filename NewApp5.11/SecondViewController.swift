//
//  SecondViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
   
    // MARK: - Outlets
    
  
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    @IBOutlet weak var createANewButton: UIButton!
    @IBOutlet weak var wrongLoginLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgottenButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var loginLabel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        wrongLoginLabel.isHidden = true
        wrongPasswordLabel.isHidden = true

        passwordTextField.isSecureTextEntry = true
        
        configureShowTextButton()
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        emailTextField.addTarget(self, action: #selector(haveDogInAdress(_:)), for: .editingChanged)
        
        setupText()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
       
        if textField.text!.count >= 6 {
            wrongPasswordLabel.isHidden = true
        }else {
        wrongPasswordLabel.isHidden = false
        wrongPasswordLabel.text = "Поле должно содержать минимум 6 символов"
        
    }
    }
    
    @objc func haveDogInAdress(_ textField: UITextField) {
        
        if textField.text!.contains("@") {
        wrongLoginLabel.isHidden = true
        }else {
        wrongLoginLabel.isHidden = false
        wrongLoginLabel.text = "Поле должно содержать - @"
        }
        
    }
    @objc private func showTextButtonTapped(_ sender: UIButton) {
        sender.setImage((passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash.fill"))?.withRenderingMode(.alwaysTemplate), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        }
    
    private func configureShowTextButton() {
            let showTextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        showTextButton.setImage((passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye.slash.fill") : UIImage(systemName: "eye.slash.fill"))?.withRenderingMode(.alwaysTemplate), for: .normal)
        
            showTextButton.tintColor = .darkGray
            showTextButton.addTarget(self, action: #selector(showTextButtonTapped), for: .touchUpInside)
        
//            passwordTextField.right += 20
            passwordTextField.rightView = showTextButton
            passwordTextField.rightViewMode = .always
        }
    @IBAction func loginButtoAction(_ sender: Any) {
        buttonIsEnabled()
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
        
        emailTextField.autocorrectionType = .no
        
        wrongLoginLabel.font =  UIFont.systemFont(ofSize: 10, weight: .bold)
        wrongPasswordLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    
    }
    
//    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
//        {
//            textField.resignFirstResponder()
//            return true;
//        }
    
    


// MARK: - Extension for two textfield (validate, is not a nil)
//extension SecondViewController {
//
//    func textFieldNotNil(textField: UITextField) {
//        if passwordTextField.text!.isEmpty || emailTextField.text!.isEmpty {
//            //Disable button
//        } else {
//            return
//        }
//    }
//}

// MARK: - Extension for PasswordTextField (hide password textfield)
extension SecondViewController {

    func buttonIsEnabled() {

        if wrongPasswordLabel.isHidden && wrongLoginLabel.isHidden {
            loginButton.isEnabled = true
            print("Helo")
        } else {
            loginButton.isEnabled = false
        }

    }
}
