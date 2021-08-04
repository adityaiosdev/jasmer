//
//  PausePopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 31/07/21.
//

import UIKit

protocol PausePopUpControllerDelegate: class {
    func backToChapterSelection()
    func resumeGame()
}

class PausePopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = PausePopUpController()
    @IBOutlet var pauseView: UIView!
    @IBOutlet weak var resumeBtn: UIButton!
    @IBOutlet weak var exitGameBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    weak var delegate:PausePopUpControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("PausePopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        pauseView.frame = UIScreen.main.bounds
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
        resumeBtn.layer.cornerRadius = 10
        exitGameBtn.layer.cornerRadius = 10
        exitGameBtn.layer.borderWidth = 2
        exitGameBtn.layer.borderColor = #colorLiteral(red: 0.4395161271, green: 0.6066932678, blue: 0.8426690698, alpha: 1)
        UIApplication.shared.keyWindow?.addSubview(pauseView)
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        pauseView.removeFromSuperview()
    }
    @IBAction func exitToChapterSelection(_ sender: UIButton){
        self.delegate?.backToChapterSelection()
    }
}
