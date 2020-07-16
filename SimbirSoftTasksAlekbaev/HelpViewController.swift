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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 160)
    }
    
    
}
