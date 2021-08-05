//
//  ConversationView.swift
//  jasmer
//
//  Created by Vivian Kosasih on 03/08/21.
//

import UIKit

class ConversationView: UIView {

    @IBOutlet weak var conversationBox: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var conversationLabel: UILabel!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func initialSetup(){
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 10
        conversationBox.layer.cornerRadius = 10
        conversationBox.layer.borderColor = UIColor(named: "Blue")?.cgColor
        conversationBox.layer.borderWidth = 2
    }
    
}
