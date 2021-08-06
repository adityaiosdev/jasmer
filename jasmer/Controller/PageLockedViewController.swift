//
//  PageLockedViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 06/08/21.
//

import UIKit

class PageLockedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "Menu", bundle: nil)
        let objects = nib.instantiate(withOwner: Menu.self, options: nil)
        let mainMenuView = objects.first as! Menu
        
        mainMenuView.playButton.addTarget(self, action: #selector(didTappedPlay), for: .touchUpInside)
        
        mainMenuView.setupForLockedPage()
        view.addSubview(mainMenuView)
    }
    @objc func didTappedPlay(){
        let MainViewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = MainViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
