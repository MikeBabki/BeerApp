//
//  BeerViewCell.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 12.01.2023.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var volumeBeerLabel: UILabel!
    
//    @IBOutlet weak var nameBeerLabel: UILabel!

    
    var model: Malt?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    func configure(withModel model: Malt?) {
    
    self.model = model
        var beerValue = model?.amount.value ?? 0.0
//        var beerName = model?.name ?? ""
        
//        nameBeerLabel.text = String(model?.amount.value ?? 0.0)
        volumeBeerLabel.text = model?.name ?? ""
    
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
