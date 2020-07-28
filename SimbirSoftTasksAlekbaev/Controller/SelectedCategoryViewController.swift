//
//  SelectedCategoryViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 22.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit


class SelectedCategoryViewController: UIViewController {
    
    var cellModelsArray = [SelectedCellModel]()
    var categoryId = 0
    var activityView = UIView()
    @IBOutlet weak var eventDoneSegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell(with: "SelectedCategoryCollectionViewCell", and: "SelectedCellIndentifier", collectionView: collectionView)
        setUpAppearenceOfItems()
        
        let activityView = createActivityIndicator(style: .white, center: view.center, view: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            DispatchQueue.global(qos: .background).async {
                self.cellModelsArray = JsonService().getCategoryEventsById(categoryId: self.categoryId)
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                    for subview in activityView.subviews {
                        subview.removeFromSuperview()
                    }
                    activityView.removeFromSuperview()
                }
            }
        }
        
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
        
        //collection view
        collectionView.clipsToBounds = true
        
        //tab bar
        UITabBar.appearance().barTintColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    }
    
}

extension SelectedCategoryViewController: UITabBarDelegate {
    //back button pressed
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK:- Working with collection view
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
    
    // If cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectedEventVCID") as? SelectedEventViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.eventId = indexPath.row
        vc.categoryId = categoryId
        self.present(vc, animated: true, completion: nil)
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

