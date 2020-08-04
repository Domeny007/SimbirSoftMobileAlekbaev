//
//  SelectedCategoryViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
import RealmSwift

class SelectedCategoryViewController: UIViewController {
    
    var cellModelsArray: Results<SelectedCategoryModel>!
    var categoryId = 0
    var activityView = UIView()
    @IBOutlet weak var eventDoneSegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionCell(with: "SelectedCategoryCollectionViewCell", and: "SelectedCellIndentifier", collectionView: collectionView)
        setUpAppearenceOfItems()
        getCategoriesFromRealm()
        checkCategoriesArray(array: (cellModelsArray))
        
//        self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
    }
    
    //MARK:- Get categories from realm and fill cells
    private func getCategoriesFromRealm() {
        let activityView = createActivityIndicator(style: .white, center: view.center, view: view)
        let realm = try! Realm()
        DispatchQueue.global(qos: .background).sync { [unowned self] in
            self.cellModelsArray = realm.objects(SelectedCategoryModel.self).filter("categoryId = \(self.categoryId)")
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
                for subview in activityView.subviews {
                    subview.removeFromSuperview()
                }
                activityView.removeFromSuperview()
            }
        }
    }
    
    private func checkCategoriesArray(array: Results<SelectedCategoryModel>!) {
        if array.count == 0 {
            let loadingTextLabel = UILabel()
            
            loadingTextLabel.textColor = .simbirLightGrey
            loadingTextLabel.text = "Событий нет..."
            loadingTextLabel.font = UIFont(name: "Avenir Light", size: 15)
            loadingTextLabel.sizeToFit()
            loadingTextLabel.center = CGPoint(x: view.center.x, y: view.center.y + 30)
            collectionView.backgroundColor = .white
            view.addSubview(loadingTextLabel)
        }
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setUpAppearenceOfItems() {
        
        navigationItem.leftBarButtonItem? = UIBarButtonItem(image: #imageLiteral(resourceName: "backButtonIcon"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(backButtonTapped)
                                                            )
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rectangle6")
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes =
            [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ],
            for: .selected)
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes(
        [
            NSAttributedString.Key.foregroundColor: UIColor.leafColor
        ],
        for: .normal)
        if #available(iOS 13.0, *) {
            eventDoneSegmentControl.selectedSegmentTintColor = .leafColor
        } else {
            eventDoneSegmentControl.tintColor = .leafColor
        }
        eventDoneSegmentControl.layer.borderColor = UIColor.leafColor.cgColor
        eventDoneSegmentControl.layer.borderWidth = 1.0
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        collectionView.clipsToBounds = true
        
        UITabBar.appearance().barTintColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    }
    
}

extension SelectedCategoryViewController: UITabBarDelegate {
    //back button pressed
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            dismiss(animated: true, completion: nil)
        }
    }
}

//MARK:- Working with collection view
extension SelectedCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cellModelsArray.count != 0 {
            return cellModelsArray.count
        }
        return cellModelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCellIndentifier", for: indexPath) as? SelectedCategoryCollectionViewCell else { return UICollectionViewCell() }
        let model = cellModelsArray[indexPath.row]
        cell.setUpCellInfo(cellModel: model)
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectedEventVCID") as? SelectedEventViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.eventId = indexPath.row
        vc.categoryId = categoryId
        present(vc, animated: true, completion: nil)
    }
}

//MARK:- setting spacing, width and height of cell
extension SelectedCategoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size(for: indexPath)
    }

    private func size(for indexPath: IndexPath) -> CGSize {
        
        let cell = Bundle.main.loadNibNamed("SelectedCategoryCollectionViewCell", owner: self, options: nil)?.first as! SelectedCategoryCollectionViewCell
        
        cell.setUpCellInfo(cellModel: cellModelsArray[indexPath.item])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        let width = collectionView.frame.width - 10
        let height: CGFloat = 0

        let targetSize = CGSize(width: width, height: height)

        let size = cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .fittingSizeLevel)

        return size
    }
}

