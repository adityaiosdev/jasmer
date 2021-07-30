//
//  settingPopUpController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class settingPopUpController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static let instance = settingPopUpController()
    @IBOutlet var parentViewController: UIView!
    @IBOutlet weak var popUpView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("settingPopUp", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        parentViewController.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        parentViewController.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert(){
        print("halaman alert")
        popUpView.layer.cornerRadius = 10
        UIApplication.shared.keyWindow?.addSubview(parentViewController)
    }
    

}
