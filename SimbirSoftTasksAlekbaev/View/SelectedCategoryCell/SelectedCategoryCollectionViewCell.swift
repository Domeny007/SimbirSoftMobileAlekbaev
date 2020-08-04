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

    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventFinishDateLabel: UILabel!
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var timeView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayouts()
    }
    
    private func setupLayouts() {
        
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        timeView.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        eventDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        eventFinishDateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        eventImageView.heightAnchor.constraint(equalToConstant: 202).isActive = true
        eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        eventImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor
            , constant: 5).isActive = true
        eventImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5).isActive = true
        
        
        eventNameLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 8).isActive = true
        eventNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        eventNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        
        heartImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        heartImageView.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 112).isActive = true
        
        eventDescriptionLabel.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 8).isActive = true
        eventDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        eventDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        eventDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        timeView.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor, constant: 15).isActive = true
        timeView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        timeView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        timeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        timeView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        eventFinishDateLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
        eventFinishDateLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor).isActive = true
        
        timeImageView.rightAnchor.constraint(equalTo: eventFinishDateLabel.leftAnchor, constant: -10).isActive = true
        timeImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        timeImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        timeImageView.centerYAnchor.constraint(equalTo: eventFinishDateLabel.centerYAnchor).isActive = true
        
    }
    
    
    func setUpCellInfo(cellModel: SelectedCategoryModel) {
        
        eventImageView.kf.setImage(with: URL(string: cellModel.eventImageUrl))
        
        eventNameLabel.text = cellModel.eventName
        eventDescriptionLabel.text = cellModel.eventDescription
        eventFinishDateLabel.text = cellModel.eventFinishDate
        
        
        if cellModel.eventImageUrl.isEmpty {
            eventImageView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            eventImageView.heightAnchor.constraint(equalToConstant: 202).isActive = true
        }
        
    }
}
