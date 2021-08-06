//
//  frontpageViewController.swift
//  jasmer
//
//  Created by Nathanael DJ on 06/08/21.
//

import UIKit

class frontpageViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playBtn.layer.cornerRadius = 25

        // Do any additional setup after loading the view.
    }
    @IBAction func play(_ sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
