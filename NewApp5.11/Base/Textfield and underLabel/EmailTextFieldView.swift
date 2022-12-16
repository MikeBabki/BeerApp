//
//  EmailTextFieldView.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 09.12.2022.
//

import UIKit
protocol EmailProtocol: AnyObject {

    func takeString(textField: UITextField, emailLabel: UILabel, wrongEmailLabel: UILabel)
    
}

class EmailTextFieldView: UIView {
    

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var wrongEmailLabel: UILabel!
   
    
    var tfDelegate: EmailProtocol?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("EmailTextFieldView", owner: self, options: nil)
        addSubview(contentView)
                contentView.frame = bounds
                contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupText()
        contentView.backgroundColor = .clear
        wrongEmailLabel.text = "sosa"
//        setupUI()
        emailTextfield.addTarget(self, action: #selector(haveDogInAdress(_:)), for: .editingChanged)
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("EmailTextFieldView", owner: self, options: nil)
        addSubview(contentView)
                contentView.frame = bounds
                contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        setupUI()
        setupText()
        wrongEmailLabel.text = "sosa"
        emailTextfield.addTarget(self, action: #selector(haveDogInAdress(_:)), for: .editingChanged)
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func haveDogInAdress(_ textField: UITextField) {
        
        if textField.text!.contains("@") {
            wrongEmailLabel.isHidden = true
        }else {
            wrongEmailLabel.isHidden = false
            wrongEmailLabel.text = "Поле должно содержать - @"
        }
}
    @objc func textFieldDidChange(_ textField: UITextField) {
       
        tfDelegate?.takeString(textField: textField, emailLabel: emailLabel, wrongEmailLabel: wrongEmailLabel)
    }
}

extension EmailTextFieldView {
    
    func setupText() {
        wrongEmailLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wrongEmailLabel.textColor = .red
        emailLabel.text = "E-mail adress"
        emailLabel.shadowColor = .gray
        emailTextfield.autocorrectionType = .no
        wrongEmailLabel.font =  UIFont.systemFont(ofSize: 10, weight: .bold)
    }
    
}

//extension EmailTextFieldView {
//
//    func setupUI() {
//    wrongEmailLabel.isHidden = true
//
//    }
//}
