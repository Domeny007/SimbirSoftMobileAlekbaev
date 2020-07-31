//
//  SelectedCategoryCellModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class SelectedCategoryModel: Object, Decodable {
    @objc dynamic var categoryId:Int = 0
    @objc dynamic var eventId:Int = 0
    @objc dynamic var eventImageUrl:String = ""
    @objc dynamic var eventName:String = ""
    @objc dynamic var eventDescription:String = ""
    @objc dynamic var eventFinishDate:String = ""
}
