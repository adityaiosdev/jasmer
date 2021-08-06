//
//  PageLockedViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 06/08/21.
//

import UIKit

class PageLockedViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.layer.cornerRadius = 10
    }
    
    @IBAction func didTappedBack(_ sender: UIButton) {
        let MainViewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = MainViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
