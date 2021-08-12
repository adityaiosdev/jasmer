//
//  TouchingBoxViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 05/08/21.
//

import UIKit

class TouchingBoxViewController: UIViewController, ClueOnboardingViewControllerDelegate {
    

    @IBOutlet weak var touchBoxImage: UIImageView!
    @IBOutlet weak var homebg: UIImageView!
    private let storageManager = StorageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
                        touchBoxImage.addGestureRecognizer(tapGR)
                        touchBoxImage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        updateFlag()
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse], animations: {() -> Void in
            self.touchBoxImage?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 2.0, animations: {() -> Void in
                self.touchBoxImage?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .recognized{
            touchBoxImage.layer.removeAllAnimations()
        }
                    if sender.state == .ended {
                        touchBoxImage.layer.removeAllAnimations()
                            print("UIImageView tapped")
                    }
            }
    
    @IBAction func boxTouched(_ sender: UIButton) {
        print("boxTouched")
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        ClueOnboardingViewController.instance.showAlert()
    }
    private func updateFlag(){
        storageManager.setOnboardingSeen()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func gotoStartGame() {
        print("tes")
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }

}
