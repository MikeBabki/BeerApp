//
//  RegistrationViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 19.12.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: PasswordTextFiledView!
    @IBOutlet weak var subNameView: UIView!
    @IBOutlet weak var secondPasswordView: PasswordTextFiledView!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
