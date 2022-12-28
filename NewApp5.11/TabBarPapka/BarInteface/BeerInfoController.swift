//
//  BeerInfoController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import UIKit

class BeerInfoController: UIViewController {
    
    var massive = [BeerModel]()
    var pageNumber = 1
    var elementCount = 50
    var networkEkz = NetworkManager()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

    }
    @objc func loadBeers() {
        networkEkz.getResult(page: pageNumber, perPage: elementCount) { networkInfo in
            switch networkInfo {
            case .success(let data):
                DispatchQueue.main.async {
                    self.massive = data
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Hop")
                
            }
        }
    }
}
extension BeerInfoController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.massive[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
    }
}

extension BeerInfoController: UITableViewDelegate {
    
    
}
