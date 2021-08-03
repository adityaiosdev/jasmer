//
//  ChoicesPopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 03/08/21.
//

import UIKit

protocol ChoicesPopUpControllerDelegate: class {
    func firstChoice()
    func secondChoice()
    func thirdChoice()
}

class ChoicesPopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = ChoicesPopUpController()
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet var choicesView: UIView!
    
    weak var delegate: ChoicesPopUpControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("ChoicesPopUp", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        choicesView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        choicesView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        firstChoice.setTitle("Hmmm, ga ah gila ya lo?", for: .normal)
        secondChoice.setTitle("Hmm, gimana ya...", for: .normal)
        thirdChoice.setTitle("Beneran, nih?", for: .normal)
        firstChoice.layer.cornerRadius = 5
        secondChoice.layer.cornerRadius = 5
        thirdChoice.layer.cornerRadius = 5
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func showAlert(){
        print("Choices")
        UIApplication.shared.keyWindow?.addSubview(choicesView)
    }
    
    @IBAction func firstChoiceClicked(_ sender: UIButton) {
        choicesView.removeFromSuperview()
        delegate?.firstChoice()
    }
    @IBAction func secondChoiceClicked(_ sender: UIButton) {
        choicesView.removeFromSuperview()
        delegate?.secondChoice()
    }
    @IBAction func thirdChoiceClicked(_ sender: UIButton) {
        choicesView.removeFromSuperview()
        delegate?.thirdChoice()
    }
    
}
