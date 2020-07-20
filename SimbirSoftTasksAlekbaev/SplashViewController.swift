//
//  SplashViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 20.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.style = .gray
        activityIndicator.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true, completion: nil)
        }
    }
}
