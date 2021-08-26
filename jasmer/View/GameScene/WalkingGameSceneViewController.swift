//
//  WalkingGameSceneViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 19/08/21.
//

import UIKit
import SpriteKit

class WalkingGameSceneViewController: UIViewController,PausePopUpControllerDelegate {
    var backgroundPosition: CGPoint?
    var nextSection: Int?
    
    let cdm = CoreDataManager()
    func backToChapterSelection() {
        let MainViewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection") as? StoryViewController
        if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = MainViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    func resumeGame() {
        
    }
    

    @IBOutlet weak var skview: SKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene: WalkingGameScene = (WalkingGameScene(size: skview.frame.size) as? WalkingGameScene)!
        scene.backgroundPosition = backgroundPosition
        scene.nextSection = nextSection
        print(backgroundPosition)
        skview.presentScene(scene)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    
    @IBAction func missionBtnClicked(_ sender: UIButton) {
        MissionPopUpViewController.instance.showPopUp()
    }
}
