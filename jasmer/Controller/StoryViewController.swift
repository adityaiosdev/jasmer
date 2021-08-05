//
//  StoryViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class StoryViewController: UIViewController , PausePopUpControllerDelegate, InteractionViewDelegate{
    
    func didTappedInteractions(selectedSection: Int) {
        if selectedSection < storylines.count{
            interactionTapped = true
            self.selectedSection = selectedSection
            selectedIndex = 0
            previousSection = currentSection
            previousIndex = currentIndex
            currentSection = selectedSection
            currentIndex = 0
            setupView()
        }
    }
    
    //adding new branch adit
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personImage2: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var conversationBox: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var interactionTapped: Bool = false
    var selectedSection = 0
    var selectedIndex = 0
    var overlayView = UIImageView()
    var previousSection: Int = 0
    var previousIndex: Int = 0
    var currentIndex = 0
    var currentSection = 0
    var situation = 0
    var botView = ConversationView()
    var interactionView = InteractionView()
    let cdm = CoreDataManager()
    
    let storylines = Storyline.initializeData()
    
    var currentStory: Storyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastUpdates = cdm.getLastUpdate()
        if lastUpdates.count == 0{
            currentIndex = 0
            currentSection = 0
        }
        else{
            currentIndex = Int(lastUpdates[lastUpdates.count-1].index)
            currentSection = Int(lastUpdates[lastUpdates.count-1].section)
        }
        
        backgroundImage.frame = UIScreen.main.bounds
        setupView()
//        createBgOverlay()
        PausePopUpController.instance.delegate = self
    }
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        print(currentSection)
        print(currentIndex)
        print("Last section: \(previousSection)")
        print("Last index: \(previousIndex)")
        if currentSection < storylines.count && currentSection >= 0 && currentIndex >= 0 && storylines[currentSection][currentIndex].category == .conversation {
            if currentSection == storylines.count - 1 && currentIndex == storylines[currentSection].count-1 {
                currentSection = storylines.count - 1
                currentIndex = storylines[currentSection].count-1
                print("Last")
            }
            else if currentIndex == storylines[currentSection].count - 1 {
                currentSection += 1
                currentIndex = 0
            }
            else {
                currentIndex += 1
            }
        }
        setupView()
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        SoundEffectsPlayer.shared.PlaySFX(SFXFileName: "buttonPressed")
        print("Press back: \(currentSection), \(currentIndex)")
        print("Last section: \(previousSection)")
        print("Last index: \(previousIndex)")
        print("Previous category :\(storylines[previousSection][previousIndex].category)")
        if currentSection < storylines.count && currentSection >= 0 && currentIndex >= 0 {
//            previousSection = currentSection
//            previousIndex = currentIndex
            if currentIndex >= 0 && storylines[previousSection][previousIndex].category == .conversation{
//                if storylines[currentSection][currentIndex].category == .conversation{
                    if currentIndex >= 0 && currentSection > 0{
                        if currentIndex == 0 {
                            currentSection -= 1
                            currentIndex = storylines[currentSection].count-1
                        }
                        else{
                            currentIndex -= 1
                        }
                    }
                    else if currentIndex == 0 && currentSection == 0{
                        currentIndex = 0
                        currentSection = 0
                    }
                    else{
                        currentIndex -= 1
                        
                    }
                previousSection = currentSection
                previousIndex = currentIndex
                setupView()
                }
//            }
            else if storylines[previousSection][previousIndex].category == .interaction {
                currentSection = previousSection
                currentIndex = previousIndex
                previousSection = currentSection
                previousIndex = currentIndex
                setupView()
            }
        }
        print("Back released: \(currentSection), \(currentIndex)")
        print("Current category :\(storylines[previousSection][previousIndex].category)")
    }
    
    func setupView(){
        currentStory = storylines[currentSection][currentIndex]
        for view in conversationBox.subviews{
            view.removeFromSuperview()
        }
        if currentStory?.category == .conversation{
            let nib = UINib(nibName: "ConversationView", bundle: nil)
            let objects = nib.instantiate(withOwner: ConversationView.self, options: nil)
            botView = objects.first as! ConversationView
            botView.frame = conversationBox.bounds
            botView.translatesAutoresizingMaskIntoConstraints = true
            botView.conversationBox.layer.borderColor = UIColor(named: "Blue")?.cgColor
            botView.conversationBox.layer.borderWidth = 2
            botView.layer.cornerRadius = 10
            
            previousButton.isHidden = false
            nextButton.isHidden = false
            conversationBox.isHidden = false
            
            if currentStory?.backgroundImage != nil {
                backgroundImage.image = currentStory?.backgroundImage
            }
            
            if currentStory?.personName != nil {
                botView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory?.personName!.count)!*12), height: 30)
                botView.nameLabel.textAlignment = .center
                botView.nameLabel.text = currentStory?.personName
            }
            
            if currentStory?.conversationText != nil{
                botView.conversationLabel.text = currentStory?.conversationText
                botView.conversationLabel.sizeToFit()
            }
            
            else{
                self.conversationBox.isHidden = true
            }
            
            overlayView.removeFromSuperview()
            checkTalkingPerson()
            
            conversationBox.addSubview(botView)
        }
        
        else if currentStory?.category == .interaction {
            let nib1 = UINib(nibName: "InteractionView", bundle: nil)
            let objects1 = nib1.instantiate(withOwner: InteractionView.self, options: nil)
            interactionView = objects1.first as! InteractionView
            interactionView.interactionList = currentStory?.interactions as? [String:Int] ?? [:]
            interactionView.frame = conversationBox.bounds
            interactionView.translatesAutoresizingMaskIntoConstraints = true
            interactionView.interactionBox.layer.borderColor = UIColor(named: "Blue")?.cgColor
            interactionView.interactionBox.layer.borderWidth = 2
            interactionView.layer.cornerRadius = 10
            
            previousButton.isHidden = true
            nextButton.isHidden = true
            conversationBox.isHidden = false
            
            if currentStory?.backgroundImage != nil{
                backgroundImage.image = currentStory?.backgroundImage
            }
            
            if currentStory?.personName != nil {
                interactionView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory?.personName!.count)!*12), height: 30)
                interactionView.nameLabel.textAlignment = .center
                interactionView.nameLabel.text = currentStory?.personName
            }
            
            if currentStory?.interactions != nil {
                interactionView.viewSetup()
            }
            
            else{
                self.conversationBox.isHidden = true
            }
            
            interactionView.translatesAutoresizingMaskIntoConstraints = true
            checkTalkingPerson()
            
            interactionView.interactionDelegate = self
            conversationBox.addSubview(interactionView)
            //
            //            if interactionView.isSelected == true {
            //                print(interactionView.selectedSection)
            //            }
        }
        
    }
    
    func backToChapterSelection() {
        print("tes")
        cdm.insertEntry(1, currentSection, currentIndex: currentIndex)
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    
    func resumeGame() {
        print("tes")
    }
    
//    func createBgOverlay(){
//        let bgOverlay = UIImageView()
//        bgOverlay.image = currentStory?.backgroundImage
//        bgOverlay.image = currentStory?.backgroundImage?.withRenderingMode(.alwaysTemplate)
//        bgOverlay.tintColor = UIColor(white: 0.5, alpha: 0.5)
//        bgOverlay.frame = backgroundImage.bounds
//        backgroundImage.addSubview(bgOverlay)
//    }
    
    func checkTalkingPerson(){
        personImage1.isHidden = true
        personImage2.isHidden = true
        if currentStory?.talkingPerson == .person1 && currentStory?.personImage1 != nil && currentStory?.personImage2 != nil{
            overlayView.removeFromSuperview()
            if let person1 = currentStory?.personImage1, let person2 = currentStory?.personImage2{
                personImage1.isHidden = false
                personImage2.isHidden = false
                personImage1.image = person1
                personImage2.image = person2
                overlayView.frame = personImage2.bounds
                overlayView.image = person2
                overlayView.image =  person2.withRenderingMode(.alwaysTemplate)
                overlayView.contentMode = .scaleAspectFit
                overlayView.tintColor = UIColor(white: 0.5, alpha: 0.5)
                personImage2.addSubview(overlayView)
            }
        }
        else if currentStory?.talkingPerson == .person2 && currentStory?.personImage1 != nil && currentStory?.personImage2 != nil{
            overlayView.removeFromSuperview()
            if let person1 = currentStory?.personImage1, let person2 = currentStory?.personImage2{
                personImage1.isHidden = false
                personImage2.isHidden = false
                personImage1.image = person1
                personImage2.image = person2
                overlayView.frame = personImage1.bounds
                overlayView.image = person1
                overlayView.image =  person1.withRenderingMode(.alwaysTemplate)
                overlayView.contentMode = .scaleAspectFit
                overlayView.tintColor = UIColor(white: 0.5, alpha: 0.5)
                personImage1.addSubview(overlayView)
            }
        }
        else if currentStory?.personImage1 != nil{
            overlayView.removeFromSuperview()
            personImage1.isHidden = false
            personImage1.image = currentStory?.personImage1
        }
        
        else if currentStory?.personImage2 != nil{
            overlayView.removeFromSuperview()
            personImage2.isHidden = false
            personImage2.image = currentStory?.personImage1
        }
        
        else{
            personImage1.isHidden = true
            personImage2.isHidden = true
        }
    }
    
    //
    //    func setUpPopUpSettingView(){
    //        blurView.bounds = self.view.bounds
    //        settingView.layer.cornerRadius = 10
    //        // Do any additional setup after loading the view.
    //
    //    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
}
