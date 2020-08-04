//
//  JsonService.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 26.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation

class JsonService {
    
    //MARK:- Getting selected categories events by its ID
    func getCategoryEventsById(categoryId: Int) -> [SelectedCategoryModel] {
        var allEvents = [SelectedCategoryModel]()
        let filePath = Bundle.main.path(forResource: "CategoryData", ofType: "json")!
        var categoryEvents = [SelectedCategoryModel]()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            allEvents = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
            
        } catch {
            
        }
        for item in allEvents {
            if item.categoryId == categoryId {
                categoryEvents.append(item)
            }
        }
        return categoryEvents
    }
    
    //MARK:- Geting event by his ID
    func getEventById(categoryId: Int, eventId: Int) -> SelectedEventModel {
        var events = [SelectedEventModel]()
        let filePath = Bundle.main.path(forResource: "EventData", ofType: "json")!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            events = try JSONDecoder().decode([SelectedEventModel].self, from: data)
            
        } catch {
            
        }
        for item in events {
            if item.categoryId == categoryId && item.eventId == eventId {
                let event = item
                return event
            }
        }
        return SelectedEventModel()
    }
    
    func getAllCategories() -> [SelectedCategoryModel] {
        var allCategories = [SelectedCategoryModel]()
        let filePath = Bundle.main.path(forResource: "CategoryData", ofType: "json")!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            allCategories = try JSONDecoder().decode([SelectedCategoryModel].self, from: data)
            
        } catch {
            
        }
        return allCategories
    }
    
    func getAllEvents() -> [SelectedEventModel] {
        var allEvents = [SelectedEventModel]()
        let filePath = Bundle.main.path(forResource: "EventData", ofType: "json")!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            allEvents = try JSONDecoder().decode([SelectedEventModel].self, from: data)
                
        } catch {
            
        }
        return allEvents
    }
}
