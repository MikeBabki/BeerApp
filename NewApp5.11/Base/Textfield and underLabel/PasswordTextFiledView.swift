//
//  PasswordTextFiledView.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 09.12.2022.
//

import UIKit

protocol PasswordTextFieldDelegate: AnyObject {

    func take(textField: UITextField, mainLabel: UILabel, errorLabel: UILabel)
}

class PasswordTextFiledView: UIView {

    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    
    // MARK: - Public properties
    
    var tfDelegate: PasswordTextFieldDelegate?
    
    // MARK: - Private methods
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            
            commonInit()
        }
            
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            commonInit()
        }

    // MARK: - Private methods
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PasswordTextFieldView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        configureShowTextButton()
        setupUI()
        setupText()
    }
        
    // MARK: - Actions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
       
        tfDelegate?.take(textField: textField, mainLabel: passwordLabel, errorLabel: wrongPasswordLabel)
       
    }
    @objc func showTextButtonTapped(_ sender: UIButton) {
        sender.setImage((passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash.fill"))?.withRenderingMode(.alwaysTemplate), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    // MARK: - Private methods
    
    private func configureShowTextButton() {
            let showTextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        showTextButton.setImage((passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye.slash.fill") : UIImage(systemName: "eye.slash.fill"))?.withRenderingMode(.alwaysTemplate), for: .normal)
        
            showTextButton.tintColor = .darkGray
            showTextButton.addTarget(self, action: #selector(showTextButtonTapped), for: .touchUpInside)
        passwordTextField.rightView = showTextButton
        passwordTextField.rightViewMode = .always
    }
}

// MARK: - Extension for layout
extension PasswordTextFiledView {
    
    func setupText() {
        wrongPasswordLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wrongPasswordLabel.textColor = .red
    }
}

extension PasswordTextFiledView {
    func setupUI() {
        passwordTextField.isSecureTextEntry = true
        passwordLabel.text = "Password"
        passwordLabel.shadowColor = .gray
        wrongPasswordLabel.isHidden = true
        wrongPasswordLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    }
}

extension PasswordTextFiledView{

    func buttonIsEnabled() {

        if wrongPasswordLabel.isHidden && passwordTextField.text != "" {
//            loginButton.isEnabled = true
            print("Helsso")
        } else {
//            loginButton.isEnabled = false
            print("HOrao")
        }

    }
}
