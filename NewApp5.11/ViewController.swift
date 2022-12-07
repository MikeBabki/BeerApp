//
//  ViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 05.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var haveAcardLabel: UILabel!
    @IBOutlet weak var buttonTapped: UIButton!
    @IBOutlet weak var acceptLabel: UILabel!
    @IBOutlet weak var receiveLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var fundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
    let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ViewController {
    
func setupText() {
    welcomeLabel.text = "Welcome"
    welcomeLabel.font = .systemFont(ofSize: 17, weight: .medium)
    
    acceptLabel.text = "Accepted at 1000+ stores"
    receiveLabel.text = "Receive discounts whenever you shop"
    fundLabel.text = "Fund local community project"
    
    buttonTapped.backgroundColor = .white
    buttonTapped.layer.cornerRadius = 20
    buttonTapped.setTitle("GET YOUR CARD NOW!", for: .normal)
    
    haveAcardLabel.font = .systemFont(ofSize: 15, weight: .medium)
    haveAcardLabel.text = "I already have a card*"
    }
    
}


