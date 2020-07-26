//
//  SelectedCategoryCellModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit
class SelectedCellModel: Decodable {
    var categoryId:Int = 0
    var eventId:Int = 0
    var eventImageUrl:String = ""
    var eventName:String = ""
    var eventDescription:String = ""
    var eventFinishDate:String = ""
}
