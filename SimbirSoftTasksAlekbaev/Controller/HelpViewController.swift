//
//  HelpViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 15.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

let helpInfoArray = [HelpCellModel(cellName: "Дети", cellImage: #imageLiteral(resourceName: "girlImage")),
                     HelpCellModel(cellName: "Взрослые", cellImage: #imageLiteral(resourceName: "manImage")),
                     HelpCellModel(cellName: "Пожилые", cellImage: #imageLiteral(resourceName: "oldManImage")),
                     HelpCellModel(cellName: "Животные", cellImage: #imageLiteral(resourceName: "catImage")),
                     HelpCellModel(cellName: "Мероприятия", cellImage: #imageLiteral(resourceName: "shoesImage")),
]

class HelpViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellWidth:CGFloat = 0
    var cellHeight:CGFloat = 0
    var spacing:CGFloat = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
        setColorsToViews()
        self.navigationItem.title = "Помочь"
    }
    
    //MARK:- Registration collection view cell
    private func registerCollectionCell() {
        let nib = UINib(nibName: "HelpCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "helpCellIdentifier")
    }
    
    //MARK:- Setting colors to navigation bar, title, background and tab bar
    private func setColorsToViews() {
        navigationController?.navigationBar.barTintColor = .leafColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collectionView.backgroundColor = .white
        
        tabBarController?.tabBar.barTintColor = .white
    }
}

extension HelpViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK:- setting spacing, width and height of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            cellWidth = (collectionView.frame.width  / 2) - spacing * 4
            cellHeight = cellWidth
            flowLayout.minimumLineSpacing = spacing
            flowLayout.minimumInteritemSpacing = spacing
        }
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension HelpViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK:- Working with collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return helpInfoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCellIdentifier", for: indexPath) as? HelpCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.fillCellsInformation(cellInfoModel: helpInfoArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryName = helpInfoArray[indexPath.row].cellName
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectedCategoryViewController") as? SelectedCategoryViewController else { return }
        vc.title = categoryName
        vc.categoryId = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

