//
//  ServerService.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 03.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

class ServerService {
    
    func getAllCategories(completion: @escaping ([SelectedCategoryModel]?, Error?) -> Void) {
        guard let url = URL(string: "https://simbirsoftintershipproject.firebaseio.com/Categories.json") else { fatalError("URL is invalid") }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
                    completion(categories, nil)
                    
                } catch {
                    print(error)
                    completion(nil, error)
                }
                
            }
            if let error = error {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func getAllEvents(completion: @escaping ([SelectedEventModel]?, Error?) -> Void) {
        guard let url = URL(string: "https://simbirsoftintershipproject.firebaseio.com/Events.json") else { fatalError("URL is invalid") }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let events = try JSONDecoder().decode([SelectedEventModel].self, from: data)
                        completion(events, nil)
                    
                } catch {
                    completion(nil, error)
                }
                
            }
            if let error = error {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func getAllEventsAlamofire(completion: @escaping ([SelectedEventModel]?, Error?) -> Void) {
        AF.request("https://simbirsoftintershipproject.firebaseio.com/Events.json")
            .response { (response) in
                guard let data = response.data else { return }
                do {
                    let events = try JSONDecoder().decode([SelectedEventModel].self, from: data)
                    completion(events, nil)
                } catch {
                    completion(nil, error)
                }
                
        }
    }
    
    func getAllCategoriesAlamofire(completion: @escaping ([SelectedCategoryModel]?, Error?) -> Void) {
        AF.request("https://simbirsoftintershipproject.firebaseio.com/Categories.json")
            .response { (response) in
                guard let data = response.data else { return }
                do {
                    let category = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
                    print(category)
                    completion(category, nil)
                } catch {
                    completion(nil, error)
                }
                
        }
    }
    
    
}
