//
//  RegistrationViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 19.12.2022.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
// MARK: - Outlets
    
    @IBOutlet weak var buttonConentView: UIView!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var wrongSunName: UILabel!
    @IBOutlet weak var subNameTextField: UITextField!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var wrongNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var phoneNumberView: PhoneNumberView!
    @IBOutlet weak var emailView: EmailTextFieldView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: PasswordTextFiledView!
    @IBOutlet weak var subNameView: UIView!
    @IBOutlet weak var secondPasswordView: PasswordTextFiledView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSetup()
//        setupUI()
        setupText()
        
        // Do any additional setup after loading the view.
    }
// MARK:  - Actions
    
    @IBAction func regButtonTapped(_ sender: Any) {
        
        if nameTextField.text == "" || subNameTextField.text == ""{
            let alert = UIAlertController(title: "Вы неправильно заполнили поле", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             
            }))
             
            self.present(alert, animated: true)
            
        }else {
           
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.navigationItem.setHidesBackButton(true, animated: true)
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = nil
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
// MARK: - Private methods
    
    private func initializeSetup() {
        phoneNumberView.tfDelegate = self
        emailView.tfDelegate = self
        passwordView.tfDelegate = self
    }
}
// MARK: - Extension for SecondViewController

extension RegistrationViewController {
    
    func setupText() {
        
        regButton.setTitle("Register", for: .normal)
    
        regButton.layer.cornerRadius = 20
        regButton.backgroundColor = .systemPink
    }
}
// MARK: - Extension for textField delegate
    
extension RegistrationViewController: PhoneNumberDelegate {
    func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
//    @objc(takeStringWithTextField:mainLabel:errorLabel:) func takeString(textField: UITextField, mainLabel phoneLabel: UILabel, errorLabel wrongPhoneLabel: UILabel) {
//        if textField.text!.count < 11 {
//                    wrongPhoneLabel.isHidden = false
//            wrongPhoneLabel.text = "Opa"
//                    textField.layer.borderColor = UIColor.white.cgColor
//                    textField.layer.cornerRadius = 5
//                } else {
//                    wrongPhoneLabel.isHidden = false
//                    wrongPhoneLabel.text = "Неверно введен номер"
//                    textField.layer.borderColor = UIColor.red.cgColor
//                    textField.layer.borderWidth = 3.0
//                }
//    }
}

extension RegistrationViewController: EmailTextFieldDelegate {
    func takeString(textField: UITextField) {
        print(textField.text)
    }
    
    
    @objc(takeStringWithTextField:phoneLabel:wrongPhoneLabel:) func takeString(textField: UITextField, phoneLabel emailLabel: UILabel, wrongPhoneLabel wrongEmailLabel: UILabel) {
        
        print(textField.text)
    }
}

extension RegistrationViewController: PasswordTextFieldDelegate {
    
    func takeString(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel) {
        print(textField.text)
    }

}
