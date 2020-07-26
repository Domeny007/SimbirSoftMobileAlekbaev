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
    func getCategoryEventsById(categoryId: Int) -> [SelectedCellModel] {
        var allEvents = [SelectedCellModel]()
        let filePath = Bundle.main.path(forResource: "CategoryData", ofType: "json")!
        var categoryEvents = [SelectedCellModel]()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            allEvents = try JSONDecoder().decode([SelectedCellModel].self, from: data)
            
        }
        catch{
            print(error)
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
            
        }
        catch{
            print(error)
        }
        for item in events {
            if item.categoryId == categoryId && item.eventId == eventId {
                let event = item
                return event
            }
        }
        return SelectedEventModel()
    }

}
