//
//  UserProfileController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import UIKit

class UserProfileController: UIViewController {
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var passwordSymbolImage: UIImageView!
    @IBOutlet weak var emailSymbolImage: UIImageView!
    @IBOutlet weak var phoneSymbolImage: UIImageView!
    @IBOutlet weak var surnameSymbolImage: UIImageView!
    @IBOutlet weak var nameSymbolImage: UIImageView!
    @IBOutlet weak var secondSurnameUserLabel: UILabel!
    @IBOutlet weak var secondNameUserLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var passwordUserLabel: UILabel!
    @IBOutlet weak var emailUserLabel: UILabel!
    @IBOutlet weak var phoneUserLabel: UILabel!
    @IBOutlet weak var surnameUserLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupText()
    }
    
    @IBAction func buttonTappedAction(_ sender: Any) {
        
    }
}

extension UserProfileController {
    func setupText() {
        
        nameUserLabel.text = UserDefaults.standard.string(forKey: "name") ?? ""
        surnameUserLabel.text = UserDefaults.standard.string(forKey: "subName") ?? ""
        
        secondNameUserLabel.text = UserDefaults.standard.string(forKey: "name") ?? ""
        secondSurnameUserLabel.text = UserDefaults.standard.string(forKey: "subName") ?? ""
        
        emailUserLabel.text = UserDefaults.standard.string(forKey: "email") ?? ""
        
        phoneUserLabel.text = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
        
        passwordUserLabel.text = UserDefaults.standard.string(forKey: "password") ?? ""
        userProfileImage.image = UIImage(systemName: "person.crop.circle.fill")
        
        nameSymbolImage.image = UIImage(systemName: "person.crop.circle")
        surnameSymbolImage.image = UIImage(systemName: "person.crop.circle.fill")
        phoneSymbolImage.image = UIImage(systemName: "phone")
        emailSymbolImage.image = UIImage(systemName: "envelope")
        passwordSymbolImage.image = UIImage(systemName: "lock.circle.fill")
        
        editProfileButton.setTitle("Edit profile", for: .normal)
    }
}
