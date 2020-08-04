//
//  SelectedEventViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 23.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class SelectedEventViewController: UIViewController {

    @IBOutlet weak var backBarItem: UIBarButtonItem!
    @IBOutlet weak var shareBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventTillDoneLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventNumberLabel: UILabel!
    
    @IBOutlet weak var eventFirstImage: UIImageView!
    @IBOutlet weak var eventSecondImage: UIImageView!
    @IBOutlet weak var eventThirdImage: UIImageView!
    
    @IBOutlet weak var eventCompanyNameLabel: UILabel!
    
    @IBOutlet weak var firstSubImageView: UIImageView!
    @IBOutlet weak var secondSubImageView: UIImageView!
    @IBOutlet weak var thirdSubImageView: UIImageView!
    @IBOutlet weak var fourthSubImageView: UIImageView!
    @IBOutlet weak var fifthSubImageView: UIImageView!
    
    @IBOutlet weak var eventSubsCountLabel: UILabel!
    
    @IBOutlet weak var eventTabBar: UITabBar!
    @IBOutlet weak var eventNavigationBar: UINavigationBar!
    
    @IBOutlet weak var writeToUsButton: UIButton!
    @IBOutlet weak var organizationWebPageButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var (categoryId, eventId) = (0, 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventFromRealm()
        
    }
    
    //back buttom action
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func castResult<SelectedEventModel>(result: Results<SelectedEventModel>) -> SelectedEventModel {
        guard let information = result.map({ $0 }).first else { return SelectedEventModel._nilValue() }
        return information
    }
    
    //MARK:- Getting event from realm database and filling view
    private func getEventFromRealm() {
        let activityView = createActivityIndicator(style: .white, center: view.center, view: view)
        
        DispatchQueue.global(qos: .background).sync  { [unowned self] in
            let realm = try! Realm()
            let result = realm.objects(SelectedEventModel.self).filter("categoryId = \(self.categoryId)").filter("eventId = \(self.eventId)")
            let resultInfo = self.castResult(result: result)
            
            DispatchQueue.main.async { [weak self] in
                self?.setUpAppearenceOfItems()
                self?.setInformationOfTheWindow(info: resultInfo)
                for subview in activityView.subviews {
                    subview.removeFromSuperview()
                }
                activityView.removeFromSuperview()
            }
        }
    }
    
    //MARK:-Setting up appearence of items on view
    private func setUpAppearenceOfItems() {
        
        //event info items
        eventNameLabel.textColor = .blueGrey
        eventTillDoneLabel.textColor = .simbirLightGrey
        eventCompanyNameLabel.textColor = .simbirGrey
        eventLocationLabel.textColor = .simbirGrey
        eventNumberLabel.textColor = .simbirGrey
        eventDescriptionLabel.textColor = .simbirGrey
        
        // tab bar items
        backBarItem.tintColor = .white
        shareBarButtonItem.tintColor = .white
        eventTabBar.unselectedItemTintColor = .leafColor
        eventTabBar.tintColor = .systemRed
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        eventNavigationBar.titleTextAttributes = textAttributes
        
        // write to us button
        writeToUsButton.setAttributedTitle(NSMutableAttributedString(string: "Напишите нам", attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),
            NSAttributedString.Key.foregroundColor : UIColor.leafColor,
            NSAttributedString.Key.underlineStyle : 1]), for: .normal)
        
        // organization web page button
        organizationWebPageButton.setAttributedTitle(NSMutableAttributedString(string: "Перейти на сайт организации", attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),
            NSAttributedString.Key.foregroundColor : UIColor.leafColor,
            NSAttributedString.Key.underlineStyle : 1]), for: .normal)
        // navigation bar
        eventNavigationBar.barTintColor = .leafColor
        //self view color
        self.view.backgroundColor = .leafColor
    }
    
    //MARK:- Setting up information from json
    private func setInformationOfTheWindow(info: SelectedEventModel) {
        
        eventNavigationBar.topItem?.title = info.eventName
        eventNameLabel.text = info.eventName
        eventTillDoneLabel.text = info.eventTillDoneDate
        eventCompanyNameLabel.text = info.eventCompanyName
        eventLocationLabel.text = info.eventLocation
        
        for phoneNumber in info.eventPhoneNumbers {
            eventNumberLabel.text! += phoneNumber + "\n"
        }
        eventDescriptionLabel.text = info.eventDescription
        eventSubsCountLabel.text = "+" + String(info.eventSubsCount - 5)
        if !info.eventImagesUrl.isEmpty {
            eventFirstImage.kf.setImage(with: URL(string: info.eventImagesUrl[0]))
            eventSecondImage.kf.setImage(with: URL(string: info.eventImagesUrl[1]))
            eventThirdImage.kf.setImage(with: URL(string: info.eventImagesUrl[2]))
        }
        if !info.eventSubsImagesUrl.isEmpty {
            firstSubImageView.kf.setImage(with: URL(string: info.eventSubsImagesUrl[0]))
            secondSubImageView.kf.setImage(with: URL(string: info.eventSubsImagesUrl[1]))
            thirdSubImageView.kf.setImage(with: URL(string: info.eventSubsImagesUrl[2]))
            fourthSubImageView.kf.setImage(with: URL(string: info.eventSubsImagesUrl[3]))
            fifthSubImageView.kf.setImage(with: URL(string: info.eventSubsImagesUrl[4]))
            firstSubImageView.makeRounded()
            secondSubImageView.makeRounded()
            thirdSubImageView.makeRounded()
            fourthSubImageView.makeRounded()
            fifthSubImageView.makeRounded()
        }
        
    }
    
}
