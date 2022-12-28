//
//  WelcomePageController.swift
//  NewApp5.11
//
//  Created by Макар Тюрморезов on 28.12.2022.
//

import UIKit

class TabBarConroller: UITabBarController {
   
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemYellow
            
        let storyboard = UIStoryboard(name: "BeerInfo", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "BeerInfoController") as! BeerInfoController
            
            let backItem = UIBarButtonItem(title: "dddd", style: .bordered, target: nil, action: nil)
            navigationItem.backBarButtonItem = backItem
            navigationController?.pushViewController(vc, animated: true)
//            let vc1 = UINavigationController(rootViewController: BeerInfoController())
            let vc2 = UINavigationController(rootViewController: UserNewsController())
            let vc3 = UINavigationController(rootViewController: UserProfileController())
            
            vc.tabBarItem.image = UIImage(systemName: "house")
            vc2.tabBarItem.image = UIImage(systemName: "play.circle")
            vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
            
            // цвет отдельной иконки таббара
//            tabBar.tintColor = .label
            
            // заголовки элементов таббара
            vc.title = "Home"
            vc2.title = "Coming soon"
            vc3.title = "Top Search"
      
            setViewControllers([vc,vc2,vc3], animated: true)
        }


    }

