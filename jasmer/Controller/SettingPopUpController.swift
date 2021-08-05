//
//  SettingPopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 04/08/21.
//

import UIKit

protocol SettingPopUpControllerDelegate: class {
    func backtoChapterMenu()
    func turnOnOffSoundEffects()
    func turnOnOffBGM()
}


class SettingPopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
    */
    @IBOutlet weak var alertView: UIView!
    static let instance = SettingPopUpController()
    @IBOutlet var settingView: UIView!

    weak var delegate: SettingPopUpControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("SettingPopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        settingView.frame = UIScreen.main.bounds
        alertView.layer.cornerRadius = 10
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = #colorLiteral(red: 0.4208922386, green: 0.6182406545, blue: 0.8839692473, alpha: 1)
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
        
        UIApplication.shared.keyWindow?.addSubview(settingView)
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        settingView.removeFromSuperview()
    }
}

