//
//  StoryViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class StoryViewController: UIViewController , PausePopUpControllerDelegate, InteractionViewDelegate{
    
    //MARK: -Delegate Functions
    func didTappedInteractions(selectedSection: Int) {
        if selectedSection < storylines.count{
            isAlreadyChosen = true
            interactionTapped = true
            self.selectedSection = selectedSection
            savedSection = selectedSection
            selectedIndex = 0
            previousSection = currentSection
            previousIndex = currentIndex
            previousChosenSection = currentSection
            currentSection = selectedSection
            currentIndex = 0
            setupView()
        }
    }
    
    func getSelectedText(selectedAnswer: String) {
        self.selectedAnswer = selectedAnswer
    }
    
    func getTappedSection(selectedSection: Int) {
        previousSection = currentSection
        previousIndex = currentIndex
        currentSection = selectedSection
        selectedIndex = 0
    }
    
    func answerTapped() {
        if currentStory?.category == .miniGames{
            if selectedAnswer == currentStory?.correctAnswer{
                let correctAlert = UIAlertController(title: "Benar!!", message: currentStory?.correctText, preferredStyle: .alert)
                let cancelBtn = UIAlertAction(title: "Kembali", style: .cancel, handler: nil)
                let nextBtn = UIAlertAction(title: "Lanjut", style: .default) { _ in
                    
                    self.setupView()
                }
                correctAlert.addAction(cancelBtn)
                correctAlert.addAction(nextBtn)
                present(correctAlert, animated: true, completion: nil)
            }
            else {
                let wrongAlert = UIAlertController(title: "Salah :(", message: currentStory?.wrongText, preferredStyle: .alert)
                let cancelBtn = UIAlertAction(title: "Kembali", style: .cancel, handler: nil)
                let nextBtn = UIAlertAction(title: "Lanjut", style: .default) { _ in
                    self.setupView()
                }
                wrongAlert.addAction(cancelBtn)
                wrongAlert.addAction(nextBtn)
                present(wrongAlert, animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: -IBOutlets
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personImage2: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var conversationBox: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: -Variables
    var interactionTapped: Bool = false
    var selectedSection = 0
    var savedSection = 0
    var selectedIndex = 0
    var overlayView = UIImageView()
    var previousSection: Int = 0
    var previousIndex: Int = 0
    var currentIndex = 0
    var currentSection = 0
    var situation = 0
    var botView = ConversationView()
    var interactionView = InteractionView()
    var selectedAnswer: String = ""
    var isAlreadyChosen: Bool = false
    var previousChosenSection : Int = 0
    let cdm = CoreDataManager()
    
    let storylines = Storyline.initializeData()
    
    var currentStory: Storyline?
    
    //MARK: -Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lastUpdates = cdm.getLastUpdate()
        if lastUpdates.count == 0{
            currentIndex = 0
            currentSection = 0
        }
        else{
            let savedIndex = Int(lastUpdates[lastUpdates.count-1].index)
            let savedSection = Int(lastUpdates[lastUpdates.count-1].section)
            if savedSection < storylines.count && savedIndex < storylines[savedSection].count {
                currentSection = savedSection
                currentIndex = savedIndex
            }
            else{
                currentIndex = 0
                currentSection = 0
            }
        }
        
        backgroundImage.frame = UIScreen.main.bounds
        conversationBox.isHidden = true
        
        setupView()
        
        PausePopUpController.instance.delegate = self
    }
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        previousSection = currentSection
        previousIndex = currentIndex
        if currentSection < storylines.count && currentSection >= 0 && currentIndex >= 0 && currentStory?.category == .conversation{
            if currentIndex == storylines[currentSection].count - 1 {
                guard currentStory?.moveToSection != nil else {return }
                currentSection = (currentStory?.moveToSection)!
                currentIndex = 0
            }
            else{
                currentIndex += 1
            }
            setupView()
            print(previousSection)
            print(previousIndex)
        }
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        previousSection = currentSection
        previousIndex = currentIndex
        let previousStory = storylines[previousSection][previousIndex]
        if currentSection < storylines.count && currentSection >= 0 && currentIndex >= 0{
            if previousStory.category == .conversation{
                if currentIndex >= 0 && currentSection > 0{
                    previousButton.isHidden = false
                    if currentIndex == 0{
                        currentSection -= 1
                        currentIndex = storylines[currentSection].count-1
                    }
                    else {
                        currentIndex -= 1
                    }
                }
                else if currentSection == 0 && currentIndex == 0{
                    previousButton.isHidden = true
                    currentSection = 0
                    currentIndex = 0
                }
                else{
                    previousButton.isHidden = true
                    currentIndex -= 1
                }
            }
            else if previousStory.category == .interaction || previousStory.category == .miniGames {
                previousButton.isHidden = true
                currentSection = selectedSection
                currentIndex = selectedIndex
            }
            setupView()
        }
    }
    
    func setupView(){
        currentStory = storylines[currentSection][currentIndex]
        
        for view in conversationBox.subviews{
            view.removeFromSuperview()
        }
        
        conversationBox.isHidden = true
        botView.isHidden = true
        interactionView.isHidden = true
        
        if currentStory?.category == .conversation{
            botView.isHidden = false
            interactionView.isHidden = true
            let nib = UINib(nibName: "ConversationView", bundle: nil)
            let objects = nib.instantiate(withOwner: ConversationView.self, options: nil)
            botView = objects.first as! ConversationView
            botView.initialSetup()
            botView.frame = conversationBox.bounds
            botView.translatesAutoresizingMaskIntoConstraints = true
            botView.nameLabel.isHidden = true
            
            previousButton.isHidden = false
            nextButton.isHidden = false
            conversationBox.isHidden = false
            
            if currentStory?.backgroundImage != nil {
                backgroundImage.image = currentStory?.backgroundImage
                createBgOverlay()
            }
            
            if currentStory?.personName != nil {
                botView.nameLabel.isHidden = false
                botView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory?.personName!.count)!*14), height: 30)
                botView.nameLabel.textAlignment = .center
                botView.nameLabel.text = currentStory?.personName
                botView.nameLabel.font = UIFont(name: "Inter-Bold", size: 17)
            }
            
            if currentStory?.conversationText != nil{
                botView.conversationLabel.text = currentStory?.conversationText
                botView.conversationLabel.sizeToFit()
                if currentStory?.needItalics == true {
                    botView.conversationLabel.font = UIFont(name: "Inter-MediumItalic", size: 17)
                }
                else{
                    botView.conversationLabel.font = UIFont(name: "Inter-Medium", size: 17)
                }
            }
            
            else{
                self.conversationBox.isHidden = true
            }
            
            overlayView.removeFromSuperview()
            checkTalkingPerson()
            
            conversationBox.addSubview(botView)
        }
        
        else if currentStory?.category == .interaction || currentStory?.category == .miniGames {
            botView.isHidden = true
            interactionView.isHidden = false
            let nib1 = UINib(nibName: "InteractionView", bundle: nil)
            let objects1 = nib1.instantiate(withOwner: InteractionView.self, options: nil)
            interactionView = objects1.first as! InteractionView
            interactionView.initialSetup()
            interactionView.interactionList = currentStory?.interactions as? [String:Int] ?? [:]
            interactionView.currentStory = currentStory
            interactionView.frame = conversationBox.bounds
            interactionView.translatesAutoresizingMaskIntoConstraints = true
            
            interactionView.nameLabel.isHidden = true
            
            previousButton.isHidden = true
            nextButton.isHidden = true
            conversationBox.isHidden = false
            
            if currentStory?.backgroundImage != nil{
                backgroundImage.image = currentStory?.backgroundImage
                createBgOverlay()
            }
            
            if currentStory?.personName != nil {
                interactionView.nameLabel.isHidden = false
                interactionView.nameLabel.frame.size = CGSize(width: CGFloat((currentStory?.personName!.count)!*14), height: 30)
                interactionView.nameLabel.textAlignment = .center
                interactionView.nameLabel.text = currentStory?.personName
                interactionView.nameLabel.font = UIFont(name: "Inter-Bold", size: 17)
            }
            
            if currentStory?.interactions != nil {
                interactionView.viewSetup()
            }
            
            else{
                self.conversationBox.isHidden = true
            }
            
            checkTalkingPerson()
            
            interactionView.interactionDelegate = self
            
            conversationBox.addSubview(interactionView)
        }
        
        else if currentStory?.category == .postQuiz {
            self.performSegue(withIdentifier: "goToPostQuiz", sender: self)
        }
    }
    
    func backToChapterSelection() {
        
        cdm.insertEntry(1, currentSection, currentIndex: currentIndex)
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    
    func resumeGame() {
        
    }
    
    func createBgOverlay(){
        for view in backgroundImage.subviews{
            view.removeFromSuperview()
        }
        let bgOverlay = UIImageView()
        bgOverlay.image = currentStory?.backgroundImage
        bgOverlay.image = currentStory?.backgroundImage?.withRenderingMode(.alwaysTemplate)
        bgOverlay.tintColor = UIColor(white: 0.5, alpha: 0.7)
        bgOverlay.frame = backgroundImage.bounds
        backgroundImage.addSubview(bgOverlay)
    }
    
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
                overlayView.contentMode = .scaleAspectFill
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
    
    
    //MARK: -Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPostQuiz" {
            if let destinationVC = segue.destination as? PostQuizViewController {
                destinationVC.currentStory = currentStory
            }
        }
    }
    
}
extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
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
