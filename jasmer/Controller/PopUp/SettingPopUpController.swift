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


    @IBOutlet weak var alertView: UIView!
    static let instance = SettingPopUpController()
    @IBOutlet var settingView: UIView!
    @IBOutlet weak var soundEffectsSwitch: UISwitch!
    @IBOutlet weak var BGMSwitch: UISwitch!
    @IBOutlet weak var backBtn: UIButton!
    
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
        settingView.frame = UIScreen.main.bounds
        alertView.layer.cornerRadius = 10
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = #colorLiteral(red: 0.4208922386, green: 0.6182406545, blue: 0.8839692473, alpha: 1)
        backBtn.layer.cornerRadius = 5
    }

    func showAlert(){
        print("Game Paused")
        
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(settingView)
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        settingView.removeFromSuperview()
    }
    @IBAction func SoundEffectsSwitch(_ sender: Any) {
        if soundEffectsSwitch.isOn == true{
            SoundEffectsPlayer.shared.SFXAllowStatus = true
        }else{
            SoundEffectsPlayer.shared.SFXAllowStatus = false
        }
    }
    @IBAction func BGMSwitch(_ sender: UISwitch) {
        if BGMSwitch.isOn == true{
            SoundPlayer.shared.BGMAllowStatus = true
            SoundPlayer.shared.startBackgroundMusic(bgmFIleName: "BGM")
        }else{
            SoundPlayer.shared.BGMAllowStatus = false
            SoundPlayer.shared.stopBackgroundMusic()
        }
    }
}

