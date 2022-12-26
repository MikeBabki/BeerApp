//
//  RegistrationViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 19.12.2022.
//

import UIKit

class RegistrationViewController: UIViewController{
    
// MARK: - Outlets
    
    @IBOutlet weak var buttonConentView: UIView!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var wrongSunName: UILabel!
    @IBOutlet weak var subNameTextField: UITextField!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var wrongNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var phoneNumberView: PhoneNumberView!
    @IBOutlet weak var emailView: EmailTextFieldView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: PasswordTextFiledView!
    @IBOutlet weak var subNameView: UIView!
    @IBOutlet weak var secondPasswordView: PasswordTextFiledView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var emailAdress: String?
    private var userName: String?
    private var userSubName: String?
    private var userPhone: String?
    private var userPassword: String?
    private var userPassword2: String?
    
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSetup()
        setupName()
        setupText()
        setupUI()
//        canTapButton()
        
    }
// MARK:  - Actions
    
    @IBAction func regButtonTapped(_ sender: Any) {
 
        canRegister()
    }
    
    
// MARK: - Private methods
    
    private func initializeSetup() {
        phoneNumberView.tfDelegate = self
        emailView.tfDelegate = self
        passwordView.tfDelegate = self
        nameTextField.delegate = self
        subNameTextField.delegate = self
    }
}
// MARK: - Extension for SecondViewController

extension RegistrationViewController {
    
    func setupText() {
        
        regButton.setTitle("Register", for: .normal)
        regButton.layer.cornerRadius = 20
        regButton.backgroundColor = .systemPink
        regButton.setTitleColor(.black, for: .normal)
    }
}
extension RegistrationViewController {
    
    func setupUI() {
        
        buttonConentView.backgroundColor = .clear
        buttonConentView.layer.opacity = 20
    }
}
// MARK: - Extension for textField delegate
    
extension RegistrationViewController: EmailTextFieldDelegate {
    func takeString(textField: UITextField) {
        
        if textField.text!.contains("@") {
            emailView.hideError()
            emailAdress = textField.text
        } else {
            emailView.showError()
        }
//        тернарный
//        textField.text == "" ? emailView.showError() : emailView.hideError()
    }
}

extension RegistrationViewController: PhoneNumberDelegate {
    func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        
        userPhone = textField.text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    //срабатывает только тогда когда нажимает на клавиатуре ретерн
    }
}

extension RegistrationViewController: PasswordTextFieldDelegate {
    
    func take(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel) {
        if textField.text!.count >= 6 {
            passwordView.hideError()
            if textField == passwordView.passwordTextField {
                userPassword = textField.text
            } else {
                userPassword2 = textField.text
            }
        } else {
            passwordView.showError()
        }
    }
}
// MARK: - Extension for name and subname

extension RegistrationViewController {
    func setupName() {
        nameLabel.text = "Your Name"
        wrongNameLabel.text = ""
        
        subNameLabel.text = "Your Subjective Name"
        wrongSunName.text = ""
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            userName = textField.text
        } else {
            userSubName = textField.text
        }
    }
}
extension RegistrationViewController {
    
    func canRegister() {
        //is empty
        if emailAdress == "" {
           showAlert(text: "Неправильно заполнена почта")
        } else if userName == "" {
            showAlert(text: "Неверно заполнено имя")
        } else if userSubName == "" {
            showAlert(text: "Неверно заполнена фамилия")
        } else if userPhone == "" {
            showAlert(text: "Неверно заполнен телефон")
        } else if userPassword == "" {
            showAlert(text: "Неверно заполнен пароль")
        } else if userPassword2 == "" {
            showAlert(text: "Неверно заполнен пароль")
        } else {
            let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                
                let backItem = UIBarButtonItem(title: "dddd", style: .bordered, target: nil, action: nil)
                vc.navigationItem.setHidesBackButton(true, animated: true)
                navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension RegistrationViewController {
    func showAlert(text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
         
        }))
         
        self.present(alert, animated: true)
    }
}
