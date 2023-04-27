//
//  NetworkManager.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import Foundation

class NetworkManager {
    
    func getResult(page: Int, perPage: Int,completion: @escaping(Result<[BeerModel]?, Error>) -> Void) {
    
        var urlString = URLManager.beerURLCreator(page: page, perPage: perPage)
        var url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode([BeerModel].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
