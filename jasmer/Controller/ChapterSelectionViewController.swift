//
//  ChapterSelectionViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class ChapterSelectionViewController: UIViewController  {
    
    let chapters = ["Jason", "JasonTransparent"]

    @IBOutlet weak var chapterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chapterSelectedClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToStory", sender: self)
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
extension ChapterSelectionViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chapterCollectionView.dequeueReusableCell(withReuseIdentifier: "chapterCell", for: indexPath) as! ChapterCell
        cell.chapterImage.image = UIImage(named: chapters[indexPath.row])
        return cell
    }
    
}

extension ChapterSelectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
