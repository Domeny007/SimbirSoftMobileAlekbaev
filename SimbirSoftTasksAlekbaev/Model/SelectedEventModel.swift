//
//  SelectedEventModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 24.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class SelectedEventModel: Object, Decodable {
    
    @objc dynamic var categoryId = 0
    @objc dynamic var eventId = 0
    @objc dynamic var eventName = ""
    @objc dynamic var eventTillDoneDate = ""
    @objc dynamic var eventLocation = ""
    @objc dynamic var eventDescription = ""
    var eventPhoneNumbers = List<String>()
    var eventImagesUrl = List<String>()
    var eventSubsImagesUrl = List<String>()
    @objc dynamic var eventCompanyName = ""
    @objc dynamic var eventSubsCount = 0
}
