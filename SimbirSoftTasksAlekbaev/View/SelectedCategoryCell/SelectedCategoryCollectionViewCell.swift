//
//  SelectedCategoryCollectionViewCell.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class SelectedCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventFinishDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCellInfo(cellModel: SelectedCellModel) {
//        eventImageView.image = cellModel.imageUrl
        eventNameLabel.text = cellModel.eventName
        eventDescriptionLabel.text = cellModel.eventDescription
        eventFinishDateLabel.text = cellModel.eventFinishDate
    }
}
