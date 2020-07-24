//
//  SelectedEventViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 23.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedEvent = SelectedEventModel(eventName: "Спонсоры отремонтируют школу-интернат", eventTillDoneDate: "Осталось 13 дней (21.09 – 20.10)", eventLocation: "Санкт-Петербург, Кирочная улица, д. 50А, каб. 208", eventDescription: "Участники и болельщики смогли весело и активно провести время на «Петербургском благотворительном марафоне» и при этом финансово поучаствовать в помощи детям. \n\nПри этом финансово поучаствовать в помощи детям. При этом финансово поучаствовать в помощи детям.", eventPhoneNumbers: "+7 (937) 037 37-73 \n+7 (937) 016 16-16", eventImages: [#imageLiteral(resourceName: "m8"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")], eventSubsImages: [#imageLiteral(resourceName: "image3")], eventCompanyName: "Благотворительный фонд «Счастливый Мир»", eventSubsCount: 102)
        
        setInformationOfTheWindow(info: selectedEvent)
        
        setUpAppearenceOfItems()
        backBarItem.tintColor = .white
        shareBarButtonItem.tintColor = .white
        eventTabBar.unselectedItemTintColor = .leafColor
        eventTabBar.tintColor = .systemRed
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        eventNavigationBar.titleTextAttributes = textAttributes
        
        writeToUsButton.setAttributedTitle(NSMutableAttributedString(string: "Напишите нам", attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),
            NSAttributedString.Key.foregroundColor : UIColor.leafColor,
            NSAttributedString.Key.underlineStyle : 1]), for: .normal)

        organizationWebPageButton.setAttributedTitle(NSMutableAttributedString(string: "Перейти на сайт организации", attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),
            NSAttributedString.Key.foregroundColor : UIColor.leafColor,
            NSAttributedString.Key.underlineStyle : 1]), for: .normal)

    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setUpAppearenceOfItems() {
        eventNameLabel.textColor = .blueGrey
        eventTillDoneLabel.textColor = UIColor(red: 148.0 / 255.0, green: 153.0 / 255.0, blue: 138.0 / 255.0, alpha: 1.0)
        eventCompanyNameLabel.textColor = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        eventLocationLabel.textColor = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        eventNumberLabel.textColor = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        eventDescriptionLabel.textColor = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
    }
    
    private func setInformationOfTheWindow(info: SelectedEventModel) {
        eventNavigationBar.topItem?.title = info.eventName
        eventNameLabel.text = info.eventName
        eventTillDoneLabel.text = info.eventTillDoneDate
        eventCompanyNameLabel.text = info.eventCompanyName
        eventLocationLabel.text = info.eventLocation
        eventNumberLabel.text = info.eventPhoneNumbers
        eventDescriptionLabel.text = info.eventDescription
        eventSubsCountLabel.text = "+" + String(info.eventSubsCount)
        eventFirstImage.image = info.eventImages[0]
        eventSecondImage.image = info.eventImages[1]
        eventThirdImage.image = info.eventImages[2]
        firstSubImageView.image = info.eventSubsImages[0]
        secondSubImageView.image = info.eventSubsImages[0]
        thirdSubImageView.image = info.eventSubsImages[0]
        fourthSubImageView.image = info.eventSubsImages[0]
        fifthSubImageView.image = info.eventSubsImages[0]
        firstSubImageView.makeRounded()
        secondSubImageView.makeRounded()
        thirdSubImageView.makeRounded()
        fourthSubImageView.makeRounded()
        fifthSubImageView.makeRounded()
        
        
    }
    
}
