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
        tabBar.barTintColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.selectedItem?.selectedImage = #imageLiteral(resourceName: "green heart")
    }

}
