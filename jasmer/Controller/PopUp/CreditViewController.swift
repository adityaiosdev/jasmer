//
//  CreditViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 27/08/21.
//

import UIKit

class CreditViewController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var creditView: UIView!
    @IBOutlet weak var creditViewBox: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("CreditView", owner: self, options: nil)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        creditView.frame = UIScreen.main.bounds
        creditView.layer.cornerRadius = 10
        creditView.layer.borderWidth = 2
        creditView.layer.borderColor = #colorLiteral(red: 0.4208922386, green: 0.6182406545, blue: 0.8839692473, alpha: 1)

    }

    func showAlert(){
        print("Game Paused")
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(creditViewBox)
    }

}
