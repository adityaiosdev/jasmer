//
//  StartGameQuestionPopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 18/08/21.
//

import UIKit

protocol StartGameQuestionPopUpControllerDelegate : class {
    func gotoStoryStoryboard()
}
class StartGameQuestionPopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = StartGameQuestionPopUpController()
    @IBOutlet weak var startAlertView: UIView!
    @IBOutlet var startView: UIView!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var continueGame: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    let cdm = CoreDataManager()
    weak var delegate: StartGameQuestionPopUpControllerDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("StartGameQuestionPopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        startView.frame = UIScreen.main.bounds
        startAlertView.layer.cornerRadius = 10
        startAlertView.layer.borderWidth = 2
        startAlertView.layer.borderColor = #colorLiteral(red: 0.4568056464, green: 0.6181109548, blue: 0.8628262877, alpha: 1)
//        backtoChapterBtn.layer.cornerRadius = 5
//        startBtn.layer.cornerRadius = 5
        backBtn.layer.cornerRadius = 5
        newGame.layer.cornerRadius = 5
        continueGame.layer.cornerRadius = 5
    }

    func showAlert(){
        print("Game Paused")
       
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(startView)
    }
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        let missionList = Mission.initializeData()
        cdm.deleteGameStatus()
        cdm.deleteAllMission()
        for mission in missionList{
            cdm.insertEntryMission(for: mission)
        }
        cdm.insertEntryLastUpdates(1, 0, currentIndex: 0)
        let storyboard = UIStoryboard(name: "StoryStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "StoryStoryboard" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        startView.removeFromSuperview()

    }
    @IBAction func continueGameBtnPressed(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        let storyboard = UIStoryboard(name: "StoryStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "StoryStoryboard" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    
}
