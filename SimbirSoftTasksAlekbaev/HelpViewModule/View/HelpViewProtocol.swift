//
//  HelpViewProtocol.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation

protocol HelpView: class {
    
    func set(currentCellsCount count: Int)
    
    func set(currentCellModel model: HelpCellModel)
    
}
