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
    private var elementCount = 10
    private var networkEkz = NetworkManager()
    
    let networkDataFetcher = NetworkManager()
    var searchResponse = [BeerModel]()

    let refreshControl: UIRefreshControl = {
      let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadBeers), for: .valueChanged)
        return refreshControl
        
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "BeerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "beerCelId")

        self.tableView.refreshControl = self.refreshControl

    }
 
    // MARK: - Actions (refreshing)
    
    @objc func loadBeers() {
        self.refreshControl.beginRefreshing()
        networkEkz.getResult(page: pageNumber, perPage: elementCount) { (searchResponse) in
            switch searchResponse {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.pageNumber += 1
                    self.elementCount = 5
                    data?.forEach {
                        self.massive.append($0)
                    }
                    self.tableView.reloadData()
                }
            case .failure(let error):
                      print("Hop")
            }
        }
    }
    
}
    // MARK: - Extentions

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
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            
        }
    }
    
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

//extension BeerInfoController: UIScrollViewDelegate {
//
//
//    }
