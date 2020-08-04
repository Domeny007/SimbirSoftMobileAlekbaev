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
    
    let cagegoriesURL = "https://simbirsoftintershipproject.firebaseio.com/Categories.json"
    let eventsURL = "https://simbirsoftintershipproject.firebaseio.com/Events.json"
    
    func getAllCategories(completion: @escaping ([SelectedCategoryModel]?, Error?) -> Void) {
        
        guard let url = URL(string: cagegoriesURL) else { fatalError("URL is invalid") }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
                    completion(categories, nil)
                    
                } catch {
                    completion(nil, error)
                    
                }
                
            }
            if let error = error {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func getAllEvents(completion: @escaping ([SelectedEventModel]?, Error?) -> Void) {
        guard let url = URL(string: eventsURL) else { fatalError("URL is invalid") }
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
        AF.request(eventsURL)
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
        AF.request(cagegoriesURL)
            .response { (response) in
                guard let data = response.data else { return }
                do {
                    let category = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
                    completion(category, nil)
                    
                } catch {
                    completion(nil, error)
                    
                }
        }
    }
    
}
