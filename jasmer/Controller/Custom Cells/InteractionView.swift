//
//  InteractionView.swift
//  jasmer
//
//  Created by Vivian Kosasih on 03/08/21.
//

import UIKit

class InteractionView: UIView {
    
    var interactionDelegate: InteractionViewDelegate?
    var interactionList: [String:Int] = [:]
    var currentStory: Storyline?
    var selectedSection = Int()
    var choices = [String]()
//    var storyVC = StoryViewController()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var interactionBox: UIView!
    @IBOutlet weak var interactionCollectionView: UICollectionView!
    //    weak var delegate: InteractionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func initialSetup(){
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 10
        interactionBox.layer.cornerRadius = 10
        interactionBox.layer.borderColor = UIColor(named: "Blue")?.cgColor
        interactionBox.layer.borderWidth = 2
    }
    
    public func viewSetup(){
        initialSetup()
        let nib = UINib(nibName: "InteractionCollectionViewCell", bundle: nil)
        interactionCollectionView.register(nib, forCellWithReuseIdentifier: "interactionCell")
        
        interactionCollectionView.delegate = self
        interactionCollectionView.dataSource = self
        
        for key in interactionList.keys{
            choices.append(key)
        }
    }
    
}

extension InteractionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return choices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interactionCell", for: indexPath) as! InteractionCollectionViewCell
        //        cell.translatesAutoresizingMaskIntoConstraints = true
        //        cell.interactionLabel.translatesAutoresizingMaskIntoConstraints = true
        //        cell.interactionLabel.frame.size = CGSize(width: CGFloat((choices[indexPath.row].count)*20), height: 35)
        //        cell.interactionLabel.text = choices[indexPath.row]
        //        cell.interactionLabel.sizeToFit()
        //        cell.interactionLabel.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        cell.initialSetup(choice: choices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let storyboard = UIStoryboard(name: "StoryStoryboard", bundle: nil)
        //        let vc = storyboard.instantiateViewController(identifier: "StoryStoryboard") as! StoryViewController
        //        vc.currentSection = interactionList[choices[indexPath.row]] as! Int
        //        vc.currentIndex = 0
        print("\(interactionList[choices[indexPath.row]] ?? 0)")
        if currentStory?.category == .interaction{
        interactionDelegate?.didTappedInteractions(selectedSection: interactionList[choices[indexPath.row]] ?? 0)
        }
        else if currentStory?.category == .miniGames{
            interactionDelegate?.getSelectedText(selectedAnswer: choices[indexPath.row])
            interactionDelegate?.getTappedSection(selectedSection: interactionList[choices[indexPath.row]] ?? 0)
            interactionDelegate?.answerTapped()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: choices[indexPath.row].count * 12, height: 44)
        return CGSize(width: 200, height: 44)
    }
}

protocol InteractionViewDelegate: AnyObject{
    func didTappedInteractions(selectedSection: Int)
    func getSelectedText(selectedAnswer:String)
    func getTappedSection(selectedSection: Int)
    func answerTapped()
}
