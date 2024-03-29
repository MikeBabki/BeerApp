//
//  BeerDescriptionViewController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 11.01.2023.
//

import UIKit
import Kingfisher

class BeerDescriptionViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ingridientsTableView: UITableView!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    
    var imageForBeer: String?
    var nameOfBeer: String?
    var massive = [Malt]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alowVolume()
        
        let nib = UINib(nibName: "BeerkaViewCell", bundle: nil)
                ingridientsTableView.register(nib, forCellReuseIdentifier: "beerkaID")
        ingridientsTableView.dataSource = self
        ingridientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
}

// MARK: - Extentions

extension BeerDescriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerkaID", for: indexPath) as! BeerTableViewCell

        let model = massive[indexPath.row]
        cell.configure(withModel: model)

                return cell
    }
}

extension BeerDescriptionViewController {
    
    func alowVolume() {
        beerNameLabel.text = nameOfBeer
        ingridientsTableView.reloadData()
        beerImage.kf.setImage(with: URL(string: imageForBeer ?? ""), completionHandler:  { [weak self] result in
        guard let self = self else { return }
            switch result {
                    case .success(let value):
                                    self.beerImage.image = value.image
                    case .failure(_):
                                    self.beerImage.image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
                    }
                })
    }
}
