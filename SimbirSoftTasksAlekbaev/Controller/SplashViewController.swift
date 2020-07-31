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
    func readAndSaveInformationToRealm() {
            let realm = try! Realm()
            try! realm.write {
                let events = realm.objects(SelectedEventModel.self)
                realm.delete(events)
                let categories = realm.objects(SelectedCategoryModel.self)
                realm.delete(categories)
            }
            let allEvents = JsonService().getAllEvents()
            let allCategories = JsonService().getAllCategories()
            self.saveRealmArray(allCategories)
            self.saveRealmArray(allEvents)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.style = .gray
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            DispatchQueue.global(qos: .background).sync {
                self.readAndSaveInformationToRealm()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
                tabBarViewController.modalPresentationStyle = .fullScreen
                self.present(tabBarViewController, animated: true, completion: nil)
            }
        }
    }
}
