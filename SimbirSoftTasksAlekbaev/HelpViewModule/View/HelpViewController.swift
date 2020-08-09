//
//  HelpViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 15.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit


class HelpViewController: UIViewController, HelpView {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    var cellWidth:CGFloat = 0
    var cellHeight:CGFloat = 0
    var spacing:CGFloat = 5
    
    var currentCellsCount: Int?
    var helpCellModel: HelpCellModel?
    
    var presenter: HelpViewPresentation?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        prepareCollectionView()
    }
    
    func set(currentCellsCount count: Int) {
        currentCellsCount = count
    }
    
    func prepareCollectionView() {
        
        registerCollectionCell(with: "HelpCollectionViewCell", and: "helpCellIdentifier", collectionView: collectionView)
        setColorsToViews()
    }
    
    func set(currentCellModel model: HelpCellModel) {
        helpCellModel = model
    }
    
    
    //MARK:- Setting colors to navigation bar, title, background and tab bar
    private func setColorsToViews() {
        navigationBar.barTintColor = .leafColor
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.topItem?.title = "Помочь"
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
        presenter?.getCurrentCellInfoCount()
        return currentCellsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCellIdentifier", for: indexPath) as? HelpCollectionViewCell else {
            return UICollectionViewCell()
        }
        presenter?.getCurrentCellModel(indexPath: indexPath)
        guard let model = helpCellModel else { return UICollectionViewCell() }
        cell.fillCellsInformation(cellInfoModel: model)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.getCurrentCellModel(indexPath: indexPath)
        let categoryName = helpCellModel?.cellName
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectedCategoryViewController") as? SelectedCategoryViewController else { return }
        vc.titleText = categoryName!
        vc.categoryId = indexPath.row
        self.present(vc, animated: true, completion: nil)
    }
    
}

