//
//  Menu.swift
//  jasmer
//
//  Created by Vivian Kosasih on 06/08/21.
//

import UIKit

class Menu: UIView {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var menuView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupForMainMenu(){
        
        topImage.image = UIImage(named: "jasmerLogo")
        textLabel.text = """
            Belajar nilai - nilai moral
            dari berbagai kisah pahlawan
            """
        playButton.layer.cornerRadius = 10
        playButton.setTitle("Mulai Bermain", for: .normal)
//        playButton.addTarget(self, action: #selector(goToChapter), for: .touchUpInside)
    }
    
    func setupForLockedPage(){
        topImage.image = UIImage(named: "lockicon")
        textLabel.text = "Maaf, bab 2 masih terkunci."
        playButton.layer.cornerRadius = 10
        playButton.setTitle("Kembali ke halaman bab", for: .normal)
    }
//
//    @objc func goToChapter(){
//        let MainViewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection")
//        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
//            window.rootViewController = MainViewController
//            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
//    }
}
