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
            vc.title = "Beer Collection"
            let backItem = UIBarButtonItem(title: "Back", style: .bordered, target: nil, action: nil)
            navigationItem.backBarButtonItem = backItem
        
            
        
            let vc2 = UINavigationController(rootViewController: UserNewsController())
        
            let storyboard2 = UIStoryboard(name: "ProfileInfo", bundle: nil)
            let vc3 = storyboard2.instantiateViewController(withIdentifier: "ProfileID") as! UserProfileController
            
            
            vc.tabBarItem.image = UIImage(systemName: "house")
            vc2.tabBarItem.image = UIImage(systemName: "play.circle")
            vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
            
            // цвет отдельной иконки таббара
//            tabBar.tintColor = .label
            
            // заголовки элементов таббара
            vc.title = "Home"
            vc2.title = "Coming soon"
            vc3.title = "Profile"
      
            setViewControllers([vc,vc2,vc3], animated: true)
        }


    }

