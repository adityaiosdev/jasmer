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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var interactionBox: UIView!
    @IBOutlet weak var interactionCollectionView: UICollectionView!
    
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
        cell.initialSetup(choice: choices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
        return CGSize(width: 220, height: 42)
    }
}

protocol InteractionViewDelegate: AnyObject{
    func didTappedInteractions(selectedSection: Int)
    func getSelectedText(selectedAnswer:String)
    func getTappedSection(selectedSection: Int)
    func answerTapped()
}
