//
//  SelectedCategoryViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class SelectedCategoryViewController: UIViewController {
    var cellWidth:CGFloat = 0
    var cellHeight:CGFloat = 0
    var spacing:CGFloat = 5
    
    let cellModelsArray: [SelectedCellModel] = [SelectedCellModel(eventId: 0, eventImage: UIImage(), eventName: "Спонсоры отремантируют школу интернат", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Осталось 13 дней (21.09 – 20.10)"), SelectedCellModel(eventId: 1, eventImage: UIImage(), eventName: "Конкурс по вокальному пению в детском доме №6", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Октябрь 20, 2016"), SelectedCellModel(eventId: 0, eventImage: UIImage(), eventName: "Спонсоры отремантируют школу интернат", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Осталось 13 дней (21.09 – 20.10)"), SelectedCellModel(eventId: 1, eventImage: UIImage(), eventName: "Конкурс по вокальному пению в детском доме №6", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Октябрь 20, 2016")]

    @IBOutlet weak var eventDoneSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
           flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        
    }
    
    private func registerCollectionCell() {
        let nib = UINib(nibName: "SelectedCategoryCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SelectedCellIndentifier")
    }

}

extension SelectedCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCellIndentifier", for: indexPath) as? SelectedCategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.setUpCellInfo(cellModel: cellModelsArray[indexPath.row])
        return cell
    }
}
    
extension SelectedCategoryViewController: UICollectionViewDelegateFlowLayout {

    //MARK:- setting spacing, width and height of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return CGSize(width: collectionView.frame.width - (spacing + spacing) , height: 500)
    }
}

