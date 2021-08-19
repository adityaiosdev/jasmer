//
//  WalkingGameSceneViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 19/08/21.
//

import UIKit
import SpriteKit

class WalkingGameSceneViewController: UIViewController {

    @IBOutlet weak var skview: SKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene: WalkingGameScene = WalkingGameScene(size: skview.frame.size)
        skview.presentScene(scene)
        // Do any additional setup after loading the view.
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
