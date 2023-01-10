//
//  Alerts.swift
//  NewApp5.11
//
//  Created by Anton Redkozubov on 10.01.2023.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func showAlert(text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true)
    }
}
