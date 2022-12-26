//
//  EmailTextFieldView.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 09.12.2022.
//

import UIKit

protocol EmailTextFieldDelegate: AnyObject {
    func takeString(textField: UITextField)
}

class EmailTextFieldView: UIView {
    
// MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var wrongEmailLabel: UILabel!
    
// MARK: - Public properties
    
    weak var tfDelegate: EmailTextFieldDelegate?
    
// MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func showError() {
        wrongEmailLabel.isHidden = false
        wrongEmailLabel.text = "Поле должно содержать - @"
        emailTextfield.layer.borderColor = UIColor.red.cgColor
        emailTextfield.layer.borderWidth = 3.0
    }
    
    func hideError() {
        wrongEmailLabel.isHidden = true
        emailTextfield.layer.borderColor = UIColor.white.cgColor
        emailTextfield.layer.cornerRadius = 5
    }
    
// MARK: - Private methods
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("EmailTextFieldView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupText()
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        setupUI()
    }
    
// MARK: - Actions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        tfDelegate?.takeString(textField: textField)
    }
}

// MARK: - Extension for layout

extension EmailTextFieldView {
    
    func setupText() {
        wrongEmailLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wrongEmailLabel.textColor = .red
        emailLabel.shadowColor = .gray
        emailTextfield.autocorrectionType = .no
        wrongEmailLabel.font =  UIFont.systemFont(ofSize: 10, weight: .bold)
    }
    
}
extension EmailTextFieldView {
    
    func setupUI() {
        emailTextfield.layer.borderColor = UIColor.white.cgColor
        emailTextfield.layer.cornerRadius = 5
        wrongEmailLabel.isHidden = true
        emailLabel.text = "Email Adress"
    }
}
