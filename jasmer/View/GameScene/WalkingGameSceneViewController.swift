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
    var firststar : Bool?
    var nextSection: Int?
    var currentStory : Storyline?
    var currentIndex :Int?
    var currentSection : Int?
    var storylines = [[Storyline]]()
    @IBOutlet weak var capaianImage: UIImageView!
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
//        scene.backgroundPosition = backgroundPosition
        var spriteScene = cdm.getLastUpdate()
        let lastUpdates = cdm.getLastUpdate()
        storylines = Storyline.initializeData()
        if lastUpdates.count == 0{
            currentIndex = 0
            currentSection = 0
        }
        else{
            let savedIndex = Int(lastUpdates[lastUpdates.count-1].index)
            let savedSection = Int(lastUpdates[lastUpdates.count-1].section)
            if savedSection < storylines.count && savedIndex < storylines[savedSection].count {
                currentSection = savedSection
                currentIndex = savedIndex
                if currentSection ?? 0 >= 11 {
                    capaianImage.image = UIImage(named: "firststar")
                }
            }
            else{
                currentIndex = 0
                currentSection = 0
            }
        }
        currentStory = storylines[currentSection ?? 0][currentIndex ?? 0]
        print(storylines[currentSection ?? 0])
        print(currentStory?.nextSprite)
        
        switch currentStory?.nextSprite {
        case .present :
            let scene: WalkingGameScene = (WalkingGameScene(size: skview.frame.size) as? WalkingGameScene)!
            scene.nextSection = nextSection
            skview.presentScene(scene)
        case .hoegeng:
            let sceneHero1 : Hero1GameScene = (Hero1GameScene(size: skview.frame.size) as? Hero1GameScene)!
            sceneHero1.nextSection = nextSection
            skview.presentScene(sceneHero1)
        case .none:
            print("halo")
        case .hatta:
            let sceneHero2 : Hero2GameScene = (Hero2GameScene(size: skview.frame.size) as? Hero2GameScene)!
            sceneHero2.nextSection = nextSection
            skview.presentScene(sceneHero2)
        case .presentAfterPast:
            let presentAfterPast : WalkingGameScenePresentAfterPast = (WalkingGameScenePresentAfterPast(size: skview.frame.size) as? WalkingGameScenePresentAfterPast)!
            presentAfterPast.nextSection = nextSection
            skview.presentScene(presentAfterPast)
            
        }
        // Do any additional setup after loading the view.
//        let scene: WalkingGameScene = (WalkingGameScene(size: skview.frame.size) as? WalkingGameScene)!
//        skview.presentScene(scene)
    }
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    
    @IBAction func missionBtnClicked(_ sender: UIButton) {
        MissionPopUpViewController.instance.showPopUp()
    }
}
