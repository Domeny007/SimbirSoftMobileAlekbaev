//
//  HelpConfigurator.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.08.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class HelpConfigurator {
    static func assembleModule() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HelpVC") as? HelpViewController
        let presenter = HelpPresenter()
        let interactor = HelpInteractor()
        let router = HelpRouter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
