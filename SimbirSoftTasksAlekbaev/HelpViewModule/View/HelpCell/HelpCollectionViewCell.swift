//
//  HelpCollectionViewCell.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 16.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class HelpCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var helpImageView: UIImageView!
    @IBOutlet weak var helpNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func fillCellsInformation(cellInfoModel: HelpCellModel) {
        helpNameLabel.text = cellInfoModel.cellName
        helpImageView.image = cellInfoModel.cellImage
        
    }
    
}
