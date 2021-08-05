//
//  PostQuizViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 04/08/21.
//

import UIKit

class PostQuizViewController: UIViewController {

    var currentStory: Storyline?
    var questionView = ConversationView()
    @IBOutlet weak var questionBox: UIView!
    @IBOutlet weak var postQuizCollectionView: UICollectionView!
    var choices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postQuizCollectionView.delegate = self
        postQuizCollectionView.dataSource = self
        let cellNib = UINib(nibName: "InteractionCollectionViewCell", bundle: nil)
        postQuizCollectionView.register(cellNib, forCellWithReuseIdentifier: "interactionCell")
        
        let nib = UINib(nibName: "ConversationView", bundle: nil)
        let objects = nib.instantiate(withOwner: ConversationView.self, options: nil)
        questionView = objects.first as! ConversationView
        questionView.initialSetup()
        questionView.frame = questionBox.bounds
        questionView.translatesAutoresizingMaskIntoConstraints = true
        questionView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory?.personName!.count)!*14), height: 30)
        questionView.nameLabel.layer.cornerRadius = 10
        questionView.nameLabel.textAlignment = .center
        
        if let currentStory = currentStory{
            questionView.nameLabel.text = currentStory.personName
            questionView.conversationLabel.text = currentStory.conversationText
            questionView.conversationLabel.sizeToFit()
        }
        
        questionBox.addSubview(questionView)
        
        if let keys = currentStory?.interactions.keys {
            for key in keys {
                choices.append(key ?? "") 
            }
        }
    }
}

extension PostQuizViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentStory?.interactions.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interactionCell", for: indexPath) as! InteractionCollectionViewCell
        cell.setupForPostQuiz(choice: choices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(choices[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 338, height: 55)
    }
}
