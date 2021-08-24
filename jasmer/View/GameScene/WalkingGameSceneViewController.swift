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
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
