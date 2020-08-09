//
//  TabBarController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 17.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.selectedIndex = 2
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        
        let helpView = HelpConfigurator.assembleModule()
        viewControllers![2] = helpView!
        viewControllers![2].tabBarItem.selectedImage = #imageLiteral(resourceName: "green heart")
        viewControllers![2].tabBarItem.image = #imageLiteral(resourceName: "red heart")
        viewControllers![2].tabBarItem.title = "Помочь"
        viewControllers![2].tabBarItem.imageInsets.top = -11
        viewControllers![2].tabBarItem.imageInsets.bottom = 11
        viewControllers![2].tabBarItem.imageInsets.left = -26
        viewControllers![2].tabBarItem.imageInsets.right = -26
        
    }

}
