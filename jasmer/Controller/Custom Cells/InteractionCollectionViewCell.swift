//
//  InteractionCollectionViewCell.swift
//  jasmer
//
//  Created by Vivian Kosasih on 03/08/21.
//

import UIKit

class InteractionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var interactionLabel: UILabel!
    
    func initialSetup(choice: String){
        interactionLabel.translatesAutoresizingMaskIntoConstraints = true
        interactionLabel.frame.size = CGSize(width: choice.count * 9, height: 35)
//        interactionLabel.frame.inset(by: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        interactionLabel.textAlignment = .left
        interactionLabel.text = choice
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
