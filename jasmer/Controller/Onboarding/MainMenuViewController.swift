//
//  MainMenuViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 06/08/21.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "Menu", bundle: nil)
        let objects = nib.instantiate(withOwner: Menu.self, options: nil)
        let mainMenuView = objects.first as! Menu
        
        mainMenuView.playButton.addTarget(self, action: #selector(didTappedPlay), for: .touchUpInside)
        mainMenuView.frame = view.bounds
        mainMenuView.setupForMainMenu()
        view.addSubview(mainMenuView)
    }
    
    @objc func didTappedPlay(){
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        let MainViewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(identifier: "onboardingVC")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = MainViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
