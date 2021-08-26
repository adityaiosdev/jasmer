//
//  MissionTableViewCell.swift
//  jasmer
//
//  Created by Vivian Kosasih on 26/08/21.
//

import UIKit

class MissionTableViewCell: UITableViewCell {

    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var radioBtn: UIImageView!
    
    func initializeData(mission: String){
        contentView.backgroundColor = .clear
        missionLabel.text = mission
    }
    
}
