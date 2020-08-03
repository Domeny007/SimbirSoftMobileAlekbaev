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
    }
    func saveRealmArray(_ objects: [Object]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(objects)
        }
    }
    func readAndSaveInformationToRealm(completion: @escaping () -> Void) {
        let realm = try! Realm()
        try! realm.write {
            let events = realm.objects(SelectedEventModel.self)
            realm.delete(events)
            let categories = realm.objects(SelectedCategoryModel.self)
            realm.delete(categories)
        }
        
        ServerService().getAllCategories(completion: { (array, error) in
            if let categoriesArray = array {
                self.saveRealmArray(categoriesArray)
            }
            if let error = error {
                print(error)
                let allCategories = JsonService().getAllCategories()
                self.saveRealmArray(allCategories)
            }
            
        })
        
        ServerService().getAllEvents { (array, error) in
            if let eventsArray = array {
                self.saveRealmArray(eventsArray)
                completion()
            }
            if let error = error {
                print(error)
                let allEvents = JsonService().getAllEvents()
                self.saveRealmArray(allEvents)
                completion()
            }
        }
        
        ServerService().getAllEventsAlamofire { (eventsArray, error) in
            print(eventsArray)
        }
        ServerService().getAllCategoriesAlamofire { (categoryArray, error) in
            print(categoryArray)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.style = .gray
        activityIndicator.startAnimating()
            DispatchQueue.global(qos: .background).sync {
                self.readAndSaveInformationToRealm(completion: {
                    DispatchQueue.main.async {
                        self.showCategoriesController()
                    }
                })
        }
    }
    func showCategoriesController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController, animated: true, completion: nil)
    }
}
