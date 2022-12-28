//
//  Networker.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import Foundation

class URLManage {
    
    static let urlString = "https://api.punkapi.com/v2"
    
    static func beerURLCreator(page: Int, perPage: Int) -> String {
       
       return urlString + "/beers?page=\(page)&per_page=\(perPage)"
        
    }
}
///beers?page=2&per_page=80
