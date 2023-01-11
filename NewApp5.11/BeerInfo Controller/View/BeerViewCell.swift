//
//  BeerViewCell.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 09.01.2023.
//

import UIKit
import Kingfisher 

class BeerViewCell: UITableViewCell {

    @IBOutlet weak var beerVolume: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    var model: BeerModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func configure(withModel model: BeerModel) {
    
    self.model = model
    
    beerName.text = model.name
    beerDescription.text = model.description
    beerVolume.text = String(model.volume.value)
    
    beerImage.kf.setImage(with: URL(string: model.image_url ?? ""), completionHandler:  { [weak self] result in
    guard let self = self else { return }
        switch result {
                case .success(let value):
                                self.beerImage.image = value.image
                case .failure(_):
                                self.beerImage.image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
                }
            })
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BeerViewCell {
    
    func setupUI() {

        beerImage.layer.cornerRadius = 35
        beerImage.backgroundColor = .systemGray5
        
        beerDescription.font = UIFont.systemFont(ofSize: 10, weight: .light)
    }
}

extension BeerViewCell {
    
    func setupText() {
            
    }
}
