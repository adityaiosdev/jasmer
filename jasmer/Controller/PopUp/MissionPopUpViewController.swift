//
//  MissionPopUpViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 26/08/21.
//

import UIKit

class MissionPopUpViewController: UIView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions[0].missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionCell", for: indexPath) as! MissionTableViewCell
        cell.initializeData(mission: missions[0].missions[indexPath.row])
        return cell
    }

    @IBOutlet var missionView: MissionPopUpViewController!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var missionTableView: UITableView!

    static let instance = MissionPopUpViewController()
    
    let missions = Mission.initializeData()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("MissionPopUp", owner: self, options: nil)
        missionView.frame = UIScreen.main.bounds
        print(missions)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func didTappedCloseButton(_ sender: UIButton) {
        missionView.removeFromSuperview()
    }
    
    func showPopUp(){
        backgroundView.layer.cornerRadius = 15
        let nib = UINib(nibName: "MissionTableViewCell", bundle: nil)
        missionTableView.register(nib, forCellReuseIdentifier: "missionCell")
        missionTableView.delegate = self
        missionTableView.dataSource = self
        missionTableView.backgroundColor = .clear
        missionTableView.isUserInteractionEnabled = false
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(missionView)
    }
}

