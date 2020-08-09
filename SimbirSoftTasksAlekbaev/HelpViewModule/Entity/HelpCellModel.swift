//
//  HelpCellModel.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 20.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

struct HelpCellModel {
    var cellName = ""
    var cellImage = UIImage()
    
    init(cellName: String, cellImage: UIImage) {
        self.cellName = cellName
        self.cellImage = cellImage
        
    }
}
