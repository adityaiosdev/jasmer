//
//  WrongStoryPopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 26/08/21.
//

import UIKit

protocol WrongStoryPopUpControllerDelegate: class {
    func resumeGame()
}

class WrongStoryPopUpController: UIView{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static let instance = WrongStoryPopUpController()
    @IBOutlet var wrongstoryView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    weak var delegate:WrongStoryPopUpControllerDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("WrongStoryPopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        wrongstoryView.frame = UIScreen.main.bounds
        alertView.layer.cornerRadius = 10
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = #colorLiteral(red: 0.4208922386, green: 0.6182406545, blue: 0.8839692473, alpha: 1)
        backBtn.layer.cornerRadius = 5
    }

    func showAlert(){
        print("Game Paused")
        
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(wrongstoryView)
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        wrongstoryView.removeFromSuperview()
    }

}
