//
//  HelpIntercator.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation


protocol HelpUseCase {
    func getCurrentCellInfoCount()
    func getCurrentCellModel(indexPath: IndexPath)
}

class HelpInteractor: HelpUseCase {
    
    weak var presenter: HelpViewPresentation!
    
    let helpInfoArray = [HelpCellModel(cellName: "Дети", cellImage: #imageLiteral(resourceName: "girlImage")),
         HelpCellModel(cellName: "Взрослые", cellImage: #imageLiteral(resourceName: "manImage")),
         HelpCellModel(cellName: "Пожилые", cellImage: #imageLiteral(resourceName: "oldManImage")),
         HelpCellModel(cellName: "Животные", cellImage: #imageLiteral(resourceName: "catImage")),
         HelpCellModel(cellName: "Мероприятия", cellImage: #imageLiteral(resourceName: "shoesImage")),
         
    ]
    
    
    func getCurrentCellModel(indexPath: IndexPath) {
        presenter.didFinishGetCurrentCellModel(model: helpInfoArray[indexPath.row])
    }
    
    
    func getCurrentCellInfoCount() {
        
        presenter.didFinishGetCurrentHelpCellCount(helpInfoArray.count)
    }
}

