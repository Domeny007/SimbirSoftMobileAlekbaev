//
//  SelectedCategoryCellModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit
class SelectedCellModel {
    var eventId = 0
    var eventImage = UIImage()
    var eventName = ""
    var eventDescription = ""
    var eventFinishDate = ""
    
    init(eventId: Int, eventImage: UIImage, eventName: String, eventDescription: String, eventFinishDate: String) {
        self.eventId = eventId
        self.eventImage = eventImage
        self.eventName = eventName
        self.eventDescription = eventDescription
        self.eventFinishDate = eventFinishDate
    }
}
