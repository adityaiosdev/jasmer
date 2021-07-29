//
//  customViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 28/07/21.
//

import UIKit

class customViewController: UIView {

    @IBOutlet var customView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("customView", owner: self, options: nil)
        addSubview(customView)
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
