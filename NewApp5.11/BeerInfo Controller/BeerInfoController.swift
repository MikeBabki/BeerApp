//
//  BeerInfoController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import UIKit

class BeerInfoController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var massive = [BeerModel]()
    private var pageNumber = 1
    private var elementCount = 50
    private var networkEkz = NetworkManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Beer Collection"
        let nib = UINib(nibName: "BeerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "beerCelId")
    }
    
    // MARK: - Actions
    
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        massive.count
    }
}

extension BeerInfoController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "BeerDescriptionStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BeerDescript") as! BeerDescriptionViewController
        
        var nameItem = massive[indexPath.row]
        vc.imageForBeer = nameItem.image_url
        vc.nameOfBeer = nameItem.name
        vc.massive = nameItem.ingredients.malt
        
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
