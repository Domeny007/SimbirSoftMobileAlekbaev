//
//  SelectedEventModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 24.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

class SelectedEventModel: NSObject, Decodable {
    @objc var categoryId = 0
    @objc var eventId = 0
    @objc var eventName = ""
    @objc var eventTillDoneDate = ""
    @objc var eventLocation = ""
    @objc var eventDescription = ""
    @objc var eventPhoneNumbers = [String]()
    var eventImagesUrl: [String?] = []
    var eventSubsImagesUrl: [String?] = []
    @objc var eventCompanyName = ""
    @objc var eventSubsCount = 0
    
}
