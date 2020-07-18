//
//  HelpViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 15.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "HelpCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "helpCellIdentifier")
        self.navigationItem.title = "Помочь"
        navigationController?.navigationBar.barTintColor = UIColor(red: 117.0/255.0, green: 163.0/255.0, blue: 71.0/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collectionView.backgroundColor = .white
        tabBarController?.tabBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
    }
    
    //MARK:- Working with collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCellIdentifier", for: indexPath) as! HelpCollectionViewCell
        cell.fillCellsInformation(cellId: indexPath.row)
        return cell
    }
    
    var cellWidth:CGFloat = 0
        var cellHeight:CGFloat = 0
        var spacing:CGFloat = 5
        var numberOfColumn:CGFloat = 2


        //MARK:-LifeCycle
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)

            if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                cellWidth = (collectionView.frame.width  / 2) - spacing * 4
               cellHeight = cellWidth
                flowLayout.minimumLineSpacing = spacing
                flowLayout.minimumInteritemSpacing = spacing
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
