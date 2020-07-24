//
//  SelectedEventModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 24.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

class SelectedEventModel {
    var eventName = ""
    var eventTillDoneDate = ""
    var eventLocation = ""
    var eventDescription = ""
    var eventPhoneNumbers = ""
    var eventImages = [UIImage()]
    var eventSubsImages = [UIImage()]
    var eventCompanyName = ""
    var eventSubsCount = 0
    
    init(eventName: String, eventTillDoneDate: String, eventLocation: String, eventDescription: String, eventPhoneNumbers: String, eventImages: [UIImage], eventSubsImages: [UIImage], eventCompanyName: String, eventSubsCount: Int ) {
        self.eventName = eventName
        self.eventTillDoneDate = eventTillDoneDate
        self.eventLocation = eventLocation
        self.eventDescription = eventDescription
        self.eventPhoneNumbers = eventPhoneNumbers
        self.eventImages = eventImages
        self.eventSubsImages = eventSubsImages
        self.eventCompanyName = eventCompanyName
        self.eventSubsCount = eventSubsCount
    }
}
