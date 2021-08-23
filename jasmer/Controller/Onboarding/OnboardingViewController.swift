//
//  OnboardingViewController.swift
//  jasmer
//
//  Created by Vivian Kosasih on 06/08/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var conversationBox: UIView!
    
    var currentIndex = 0
    var onboardingStory = [
        Storyline(personName: nil, conversationText: "Akhirnya…", personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "onboarding1"), talkingPerson: nil, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil, moveToSection: nil, previousSection: nil, previousIndex: nil, needItalics: nil, isLast: false, isFirst: false),
        Storyline(personName: nil, conversationText: "Akhirnya penelitianku jadi juga", personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "onboarding2"), talkingPerson: nil, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil, moveToSection: nil, previousSection: nil, previousIndex: nil, needItalics: nil, isLast: false, isFirst: false),
        Storyline(personName: nil, conversationText: "Semoga dengan ini mereka akan mengerti", personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "onboarding2"), talkingPerson: nil, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil, moveToSection: nil, previousSection: nil, previousIndex: nil, needItalics: nil, isLast: false, isFirst: false),
        Storyline(personName: nil, conversationText: "Hadiah terbaik buat orang yang perlu belajar dari masa lalu.", personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "onboarding3"), talkingPerson: nil, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil, moveToSection: nil, previousSection: nil, previousIndex: nil, needItalics: nil, isLast: false, isFirst: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        if currentIndex == 0{
            previousButton.isHidden = true
            nextButton.isHidden = false
        }
        else{
            previousButton.isHidden = false
            nextButton.isHidden = false
        }
        let conversationNib = UINib(nibName: "ConversationView", bundle: nil)
        let objects = conversationNib.instantiate(withOwner: ConversationView.self, options: nil)
        let conversationView = objects.first as! ConversationView
        
        conversationView.initialSetup()
        conversationView.frame = conversationBox.bounds
        conversationView.translatesAutoresizingMaskIntoConstraints = true
        conversationView.nameLabel.isHidden = true
        
        let currentStory = onboardingStory[currentIndex]
        
        if currentStory.backgroundImage != nil {
            backgroundImageView.image = currentStory.backgroundImage
        }
        
        if currentStory.personName != nil {
            conversationView.nameLabel.isHidden = false
            conversationView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory.personName!.count)*14), height: 30)
            conversationView.nameLabel.textAlignment = .center
            conversationView.nameLabel.text = currentStory.personName
            conversationView.nameLabel.font = UIFont(name: "Inter-Bold", size: 17)
        }
        
        if currentStory.conversationText != nil{
            conversationView.conversationLabel.text = currentStory.conversationText
            conversationView.conversationLabel.sizeToFit()
            if currentStory.needItalics == true {
                conversationView.conversationLabel.font = UIFont(name: "Inter-MediumItalic", size: 17)
            }
            else{
                conversationView.conversationLabel.font = UIFont(name: "Inter-Medium", size: 17)
            }
        }
        
        else{
            self.conversationBox.isHidden = true
        }
        
        conversationBox.addSubview(conversationView)
    }
    
    @IBAction func didTappedNextButton(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        if currentIndex >= 0 && currentIndex <= onboardingStory.count-1{
            if currentIndex == onboardingStory.count - 1{
                let touchingBoxStoryboard = UIStoryboard(name: "TouchingBoxStoryboard", bundle: nil).instantiateViewController(identifier: "TouchingBoxStoryboard")
                if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                    window.rootViewController = touchingBoxStoryboard
                    UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
            }
            else{
                currentIndex += 1
            }
            initialSetup()
        }
    }
    
    @IBAction func didTappedBackButton(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        if currentIndex >= 0 && currentIndex <= onboardingStory.count - 1{
            if currentIndex == 0{
                previousButton.isHidden = true
            }
            else{
                previousButton.isHidden = false
                currentIndex -= 1
            }
            initialSetup()
        }
    }
}
