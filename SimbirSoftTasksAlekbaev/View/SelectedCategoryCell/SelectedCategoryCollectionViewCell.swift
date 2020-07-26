//
//  SelectedCategoryCollectionViewCell.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
import Kingfisher
class SelectedCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventFinishDateLabel: UILabel!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eventNameLabel.tintColor = .blueGrey
    }
    
    func setUpCellInfo(cellModel: SelectedCellModel) {
        eventImageView.kf.setImage(with: URL(string: cellModel.eventImageUrl))
        if cellModel.eventImageUrl.isEmpty {
            imageHeight.constant = 0
        }
        eventNameLabel.text = cellModel.eventName
        eventDescriptionLabel.text = cellModel.eventDescription
        eventFinishDateLabel.text = cellModel.eventFinishDate
    }
}
