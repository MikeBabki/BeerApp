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
        self.title = "Beer Collection"
        let nib = UINib(nibName: "BeerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "beerCelId")
        

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCelId", for: indexPath) as! BeerViewCell
        
        let model = massive[indexPath.row]
        cell.configure(withModel: model)
        
        return cell
        
//        let beeer = massive[indexPath.row]
//
//        cell.beerName?.text = beeer.name
//        cell.beerDescription?.text = beeer.description
//        cell.beerVolume?.text = String(beeer.volume.value)
////        cell.beerImage?.image = UIImage(beeer.image_url)
//        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        massive.count
    }
}

extension BeerInfoController: UITableViewDelegate {
    
    
}
