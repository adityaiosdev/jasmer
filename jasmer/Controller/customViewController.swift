//
//  customViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 28/07/21.
//

import UIKit

class customViewController: UIView {
    static let instance = customViewController()
    @IBOutlet var customView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("customView", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
//        addSubview(customView)
//        customView.frame = self.bounds
//        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        customView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func showAlert(){
        print("halaman alert")
        alertView.layer.cornerRadius = 10
        UIApplication.shared.keyWindow?.addSubview(customView)
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        customView.removeFromSuperview()
    }
}
