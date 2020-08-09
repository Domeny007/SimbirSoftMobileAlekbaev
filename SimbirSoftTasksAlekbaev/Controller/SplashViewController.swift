//
//  SplashViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 20.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
import RealmSwift
class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.style = .gray
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .background).sync { [weak self] in
            self?.readAndSaveInformationToRealm(completion: { [weak self] in
                DispatchQueue.main.async {
                    self?.showCategoriesController()
                        
                }
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    private func showCategoriesController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier") as? UITabBarController
        tabBarViewController?.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController!, animated: true, completion: nil)
    }
    
    private func saveRealmArray(_ objects: [Object]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(objects)
        }
    }
    
    private func readAndSaveInformationToRealm(completion: @escaping () -> Void) {
        let realm = try! Realm()
        try! realm.write {
            let events = realm.objects(SelectedEventModel.self)
            realm.delete(events)
            let categories = realm.objects(SelectedCategoryModel.self)
            realm.delete(categories)
        }
        
        ServerService().getAllCategories(completion: { [weak self] (array, error) in
            if let categoriesArray = array {
                self?.saveRealmArray(categoriesArray)
            }
            
            if error != nil {
                let allCategories = JsonService().getAllCategories()
                self?.saveRealmArray(allCategories)
            }
            
        })
        
        ServerService().getAllEvents { [weak self] (array, error) in
            
            if let eventsArray = array {
                self?.saveRealmArray(eventsArray)
                completion()
            }
            
            if error != nil {
                let allEvents = JsonService().getAllEvents()
                self?.saveRealmArray(allEvents)
                completion()
            }
        }
        
        ServerService().getAllEventsAlamofire { (eventsArray, error) in
            print(eventsArray as Any)
        }
        ServerService().getAllCategoriesAlamofire { (categoryArray, error) in
            print(categoryArray as Any)
        }
        
    }
    
}
