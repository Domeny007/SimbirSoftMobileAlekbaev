//
//  HelpCollectionViewCell.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 16.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class HelpCollectionViewCell: UICollectionViewCell {
    
    let imageOfCellArray = [ #imageLiteral(resourceName: "girlImage"), #imageLiteral(resourceName: "manImage"), #imageLiteral(resourceName: "oldManImage"), #imageLiteral(resourceName: "catImage"), #imageLiteral(resourceName: "shoesImage")]
    let nameOfCellArray = ["Дети","Взрослые","Пожилые","Животные","Мероприятия"]

    @IBOutlet weak var helpImageView: UIImageView!
    @IBOutlet weak var helpNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCellsInformation(cellId: Int) {
        helpImageView.image = imageOfCellArray[cellId]
        helpNameLabel.text = nameOfCellArray[cellId]
    }
    

}
