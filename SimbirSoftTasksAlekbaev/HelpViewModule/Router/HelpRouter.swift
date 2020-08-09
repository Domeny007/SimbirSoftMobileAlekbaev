
//
//  HelpRouter.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

protocol HelpViewWireframe: class {
    
    var viewController: UIViewController? { get }
    
}

class HelpRouter: HelpViewWireframe {
    var viewController: UIViewController?
    
}

