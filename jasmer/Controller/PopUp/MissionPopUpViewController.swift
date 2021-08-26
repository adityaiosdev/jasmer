//
//  MissionPopUpViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 26/08/21.
//

import UIKit

class MissionPopUpViewController: UIView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if missionStatement.isEmpty {
            return 1
        }
        else{
            return missionStatement.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionCell", for: indexPath) as! MissionTableViewCell
        if missionStatement.isEmpty{
            cell.radioBtn.isHidden = true
            cell.missionLabel.text = "Tidak ada misi"
        }
        else{
            cell.radioBtn.isHidden = false
            cell.missionLabel.text = missionStatement[indexPath.row].mission
        }
        return cell
    }
    
    @IBOutlet var missionView: MissionPopUpViewController!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var missionTableView: UITableView!
    
    static let instance = MissionPopUpViewController()
    
    let cdm = CoreDataManager()
    var missions = [MissionObject]()
    var missionStatement = [MissionStatement]()
    //    let missions = Mission.initializeData()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("MissionPopUp", owner: self, options: nil)
        missionView.frame = UIScreen.main.bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func didTappedCloseButton(_ sender: UIButton) {
        missionView.removeFromSuperview()
    }
    
    func showPopUp(){
        missions = cdm.getMission()
        if !missions.isEmpty{
            missionStatement = cdm.getMissionStatement(for: missions[0])
            self.missionTableView.reloadData()
        }
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

