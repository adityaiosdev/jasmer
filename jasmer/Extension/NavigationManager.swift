//
//  NavigationManager.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 13/08/21.
//

import UIKit

class NavigationManager {
    
    enum Screen {
        case onboarding
        case mainApp
    }
    
    func show(screen: Screen , inController: UIViewController) {
        var viewController : UIViewController!
        switch screen {
        
        case .onboarding:
            viewController = UIStoryboard(name: "MainMenuStoryboard", bundle: nil).instantiateViewController(identifier: "MainMenuViewController")
        case .mainApp:
            viewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection")
        }
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
