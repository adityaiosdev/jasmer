//
//  ChapterSelectionViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit
import AVFoundation

class ChapterSelectionViewController: UIViewController, StartGamePopUpControllerDelegate  {
    func gotoStoryStoryboard() {
        let storyboard = UIStoryboard(name: "StoryStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "StoryStoryboard" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var chapterImage: UIImageView!
    let chapters = ["thumbnailactive", "tugasekolahraka","budioren","malamminggubima"]
    var soundEffectsButtonClicked = AVAudioPlayer()

    @IBOutlet weak var chapterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
//        SoundPlayer.shared.startBackgroundMusic(bgmFIleName: "")
        // Do any additional setup after loading the view.
        
    }
    
   
    @IBAction func SettingBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        SettingPopUpController.instance.showAlert()
    }
 
    @IBAction func testBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotoGameScene", sender: self)
    }
    
}
extension ChapterSelectionViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chapterCollectionView.dequeueReusableCell(withReuseIdentifier: "chapterCell", for: indexPath) as! ChapterCell
        if indexPath.row == 0 {
            cell.chapterImage.image =  UIImage(named: chapters[indexPath.row])
            cell.chapterCard.layer.opacity = 0.8
            cell.chapterCard.layer.cornerRadius = 100
            cell.chapterLock.isHidden = true
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 4
            cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else {
        cell.chapterImage.image = UIImage(named: chapters[indexPath.row])
        cell.chapterCard.layer.opacity = 0.7
        cell.chapterCard.layer.cornerRadius = 100
        cell.chapterLock.isHidden = false
        cell.chapterLock.layer.opacity = 1
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 4
        cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == chapterCollectionView && indexPath.row == 0 {
            SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
            StartGamePopUpController.instance.showAlert()
        }
        else{
            SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
            let MainViewController = UIStoryboard(name: "PageLocked", bundle: nil).instantiateViewController(identifier: "pageLocked")
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                window.rootViewController = MainViewController
                UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    }
    
}

extension ChapterSelectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height:220)
    }
}
