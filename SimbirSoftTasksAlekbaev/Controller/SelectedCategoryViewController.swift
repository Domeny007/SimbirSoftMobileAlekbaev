//
//  SelectedCategoryViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

    let cellModelsArray: [SelectedCellModel] = [SelectedCellModel(eventId: 0, eventImage: UIImage(), eventName: "Спонсоры отремантируют школу интернат", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Осталось 13 дней (21.09 – 20.10)"), SelectedCellModel(eventId: 1, eventImage: UIImage(), eventName: "Конкурс по вокальному пению в детском доме №6", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Октябрь 20, 2016"), SelectedCellModel(eventId: 0, eventImage: UIImage(), eventName: "Спонсоры отремантируют школу интернат", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Осталось 13 дней (21.09 – 20.10)"), SelectedCellModel(eventId: 1, eventImage: UIImage(), eventName: "Конкурс по вокальному пению в детском доме №6", eventDescription: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …", eventFinishDate: "Октябрь 20, 2016")]


class SelectedCategoryViewController: UIViewController {
    var cellWidth:CGFloat = 0
    var cellHeight:CGFloat = 0
    var spacing:CGFloat = 5
    
    @IBOutlet weak var eventDoneSegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0) // your color
        UITabBar.appearance().backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0) // your color
        registerCollectionCell()
        setUpAppearenceOfItems()
    }
    
    private func registerCollectionCell() {
        let nib = UINib(nibName: "SelectedCategoryCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SelectedCellIndentifier")
    }
    
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setUpAppearenceOfItems() {
        //navigation controller
        self.navigationItem.leftBarButtonItem? = UIBarButtonItem(image: #imageLiteral(resourceName: "backButtonIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rectangle6")
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white]
        //segmented control
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.leafColor], for: .normal)
        if #available(iOS 13.0, *) {
            eventDoneSegmentControl.selectedSegmentTintColor = .leafColor
        } else {
            eventDoneSegmentControl.tintColor = .leafColor
        }
        eventDoneSegmentControl.layer.borderColor = UIColor.leafColor.cgColor
        eventDoneSegmentControl.layer.borderWidth = 1.0
        
        
        //collection view items size
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
        }
    }
    
}

extension SelectedCategoryViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            self.dismiss(animated: true, completion: nil)
        } else {
            print("GI")
        }
    }
}
    
extension SelectedCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCellIndentifier", for: indexPath) as? SelectedCategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.setUpCellInfo(cellModel: cellModelsArray[indexPath.row])
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectedEventVCID") as? SelectedEventViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

    
extension SelectedCategoryViewController: UICollectionViewDelegateFlowLayout {

    //MARK:- setting spacing, width and height of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return CGSize(width: collectionView.frame.width - (spacing + spacing) , height: 500)
    }
}

