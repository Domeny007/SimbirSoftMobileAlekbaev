//
//  HelpPresenter.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

protocol HelpViewPresentation: class {
    var view: HelpView? { get }
    var router: HelpViewWireframe? { get }
    var interactor: HelpUseCase? { get }
    
    func didFinishGetCurrentHelpCellCount(_ count: Int)
    func didFinishGetCurrentCellModel(model: HelpCellModel)
    func getCurrentCellInfoCount()
    func getCurrentCellModel(indexPath: IndexPath)
}


class HelpPresenter: HelpViewPresentation {
    
    weak var view: HelpView?
    var router: HelpViewWireframe?
    var interactor: HelpUseCase?
    
    func didFinishGetCurrentCellModel(model: HelpCellModel) {
        view?.set(currentCellModel: model)
    }
    
    func didFinishGetCurrentHelpCellCount(_ count: Int) {
        view?.set(currentCellsCount: count)
    }
    
    func getCurrentCellInfoCount() {
        interactor?.getCurrentCellInfoCount()
    }
    
    func getCurrentCellModel(indexPath: IndexPath) {
        interactor?.getCurrentCellModel(indexPath: indexPath)
    }
    
}

