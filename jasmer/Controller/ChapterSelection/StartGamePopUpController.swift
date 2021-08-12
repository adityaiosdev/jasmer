//
//  StartGamePopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 06/08/21.
//

import UIKit

protocol StartGamePopUpControllerDelegate : class {
    func gotoStoryStoryboard()
}

class StartGamePopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = StartGamePopUpController()
    @IBOutlet var startView: UIView!
    @IBOutlet weak var startAlertView: UIView!
    @IBOutlet weak var backtoChapterBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    weak var delegate:StartGamePopUpControllerDelegate?
    var isStartClicked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("StartGamePopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        startView.frame = UIScreen.main.bounds
        startAlertView.layer.cornerRadius = 10
        startAlertView.layer.borderWidth = 2
        startAlertView.layer.borderColor = #colorLiteral(red: 0.4568056464, green: 0.6181109548, blue: 0.8628262877, alpha: 1)
        backtoChapterBtn.layer.cornerRadius = 5
        startBtn.layer.cornerRadius = 5
//
//        pauseView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func showAlert(){
        print("Game Paused")
       
        UIApplication.shared.keyWindow?.addSubview(startView)
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        startView.removeFromSuperview()
    }
    @IBAction func startBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        self.delegate?.gotoStoryStoryboard()
        let storyboard = UIStoryboard(name: "StoryStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "StoryStoryboard" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
}

