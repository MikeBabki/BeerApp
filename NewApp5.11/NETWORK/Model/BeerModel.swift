//
//  BeerModel.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import Foundation


struct BeerModel: Decodable {
    
    var name: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var volume: Volume
}
struct Volume: Decodable {
    
    var value: Int
    var unit: String
}
