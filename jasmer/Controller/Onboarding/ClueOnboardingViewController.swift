//
//  ClueOnboardingViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 05/08/21.
//

import UIKit

protocol ClueOnboardingViewControllerDelegate: class {
    func gotoStartGame()
}

class ClueOnboardingViewController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = ClueOnboardingViewController()
    @IBOutlet var letterView: UIView!
    weak var delegate: ClueOnboardingViewControllerDelegate?
    
    @IBOutlet weak var startGameBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("ClueOnboardingView", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        letterView.frame = UIScreen.main.bounds
        startGameBtn.layer.cornerRadius = 10
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
        
        UIApplication.shared.keyWindow?.addSubview(letterView)
    }

    @IBAction func startGameBtn(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
        self.delegate?.gotoStartGame()
    }
}
