//
//  EmailTextFieldView.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 09.12.2022.
//

import UIKit
import InputMask

public protocol PhoneNumberDelegate: AnyObject {
    func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String)
    func textFieldDidEndEditing(_ textField: UITextField)
    
    func takeString(textField: UITextField, phoneLabel: UILabel, wrongPhoneLabel: UILabel)
}

class PhoneNumberView: UIView {
    
// MARK: - Outlets
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var wrongPhoneLabel: UILabel!
    
// MARK: - Public properties
    
    var maskedDelegate: MaskedTextFieldDelegate!
    var tfDelegate: PhoneNumberDelegate?
    var phone: String?
    
// MARK: - Init
    
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
        Bundle.main.loadNibNamed("PhoneNumberView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupUI()
        setupText()
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        maskedDelegate = MaskedTextFieldDelegate(primaryFormat: "+{7} ([000]) [000] [00]-[00]", autocomplete: false, autocompleteOnFocus: false, autoskip: false, rightToLeft: false, affineFormats: [], affinityCalculationStrategy: .wholeString, customNotations: [], onMaskedTextChangedCallback: nil, allowSuggestions: false)
                maskedDelegate.listener = self
        phoneTextField.delegate = maskedDelegate
        
    }
    
// MARK: - Actions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        tfDelegate?.takeString(textField: textField, phoneLabel: phoneLabel, wrongPhoneLabel: wrongPhoneLabel)
    }
}

// MARK: - Extension for layout

extension PhoneNumberView {
    
    func setupText() {
        wrongPhoneLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wrongPhoneLabel.textColor = .red
        phoneLabel.shadowColor = .gray
        phoneTextField.autocorrectionType = .no
        wrongPhoneLabel.font =  UIFont.systemFont(ofSize: 10, weight: .bold)
        phoneLabel.text = "Phone number"
    }
}

extension PhoneNumberView {
    
    func setupUI() {
        phoneTextField.keyboardType = .numberPad
        wrongPhoneLabel.isHidden = true
    }
}

extension PhoneNumberView: MaskedTextFieldDelegateListener {
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        tfDelegate?.textFieldDidEndEditing(textField)
    }
    
    public func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        if value == "78" && textField.text == "+7 (8" {
            textField.text = "+7"
            phone = "7"
        }
        else {
            phone = value
        }
        tfDelegate?.textField(textField, didFillMandatoryCharacters: complete, didExtractValue: value)
    }
}
