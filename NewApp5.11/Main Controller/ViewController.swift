//
//  ViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var logotipImage: UIImageView!
    @IBOutlet weak var alredyAcardButton: UIButton!
    @IBOutlet weak var buttonTapped: UIButton!
    @IBOutlet weak var acceptLabel: UILabel!
    @IBOutlet weak var receiveLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var fundLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupText()
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func getCardButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrationViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        
        let backItem = UIBarButtonItem(title: "Назад", style: .bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func alredyACardTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        let backItem = UIBarButtonItem(title: "Назад", style: .bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
    }
    
}
// MARK: - Extension for ViewController

extension ViewController {
    
    func setupText() {
        welcomeLabel.text = "Welcome"
        
        acceptLabel.text = "Accepted at 1000+ stores"
        receiveLabel.text = "Receive discounts whenever you shop"
        fundLabel.text = "Fund local community project"
        
        buttonTapped.setTitle("GET YOUR CARD NOW!", for: .normal)
    
        alredyAcardButton.setTitle("I already have a card*", for: .normal)
        
        if UIScreen.main.bounds.size.width < 375 {
            acceptLabel.font = .systemFont(ofSize: 15, weight: .medium);
            receiveLabel.font = .systemFont(ofSize: 15, weight: .medium);
            fundLabel.font = .systemFont(ofSize: 15, weight: .medium)
            welcomeLabel.font = .systemFont(ofSize: 10, weight: .light)
        } else {
            acceptLabel.font = .systemFont(ofSize: 20, weight: .medium);
            receiveLabel.font = .systemFont(ofSize: 20, weight: .medium);
            fundLabel.font = .systemFont(ofSize: 20, weight: .medium)
            welcomeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }
    
}

// MARK: - Extention for UI

extension ViewController {
    
    func setupUI() {
        
        welcomeLabel.font = .systemFont(ofSize: 17, weight: .medium)
        
        buttonTapped.backgroundColor = .white
        buttonTapped.layer.cornerRadius = 20
        
        logotipImage.layer.cornerRadius = 60
        
        alredyAcardButton.layer.cornerRadius = 15
        alredyAcardButton.setTitleColor(.white, for: .normal)
    }
}
