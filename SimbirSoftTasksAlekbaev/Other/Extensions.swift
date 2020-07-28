//
//  Extensions.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 21.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    static let leafColor = UIColor(red: 117.0 / 255.0, green: 163.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    static let blueGrey = UIColor(red: 98.0 / 255.0, green: 127.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    
    static let simbirGrey = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
    static let simbirLightGrey = UIColor(red: 148.0 / 255.0, green: 153.0 / 255.0, blue: 138.0 / 255.0, alpha: 1.0)
}


extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

extension UIViewController {
    func createActivityIndicator(style: UIActivityIndicatorView.Style = .whiteLarge, center: CGPoint? = nil, view: UIView) -> UIView {
        let activityView: UIView = {
            let tempView = UIView()
            tempView.backgroundColor = .white
            tempView.translatesAutoresizingMaskIntoConstraints = false
            return tempView
        }()
        view.addSubview(activityView)
        activityView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        let loadingTextLabel = UILabel()
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        
        if let center = center {
            activityIndicatorView.center = center
        }
        activityIndicatorView.color = .simbirLightGrey
        
        loadingTextLabel.textColor = .simbirLightGrey
        loadingTextLabel.text = "Загрузка..."
        loadingTextLabel.font = UIFont(name: "Avenir Light", size: 10)
        loadingTextLabel.sizeToFit()
        loadingTextLabel.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y + 30)
        activityView.addSubview(activityIndicatorView)
        activityView.addSubview(loadingTextLabel)
        activityIndicatorView.startAnimating()
        return (activityView)
    }
    //MARK:- Registration collection view cell
    func registerCollectionCell(with nibName: String, and identifier: String, collectionView: UICollectionView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
}
