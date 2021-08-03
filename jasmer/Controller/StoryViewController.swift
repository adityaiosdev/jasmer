//
//  StoryViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class StoryViewController: UIViewController , PausePopUpControllerDelegate, ChoicesPopUpControllerDelegate{
    
    func firstChoice() {
        ChoicesPopUpController.instance.choicesView.removeFromSuperview()
        firstchoice = true
        nextBtnClicked(nextBtn)
    }
    
    func secondChoice() {
        ChoicesPopUpController.instance.choicesView.removeFromSuperview()
    }
    
    func thirdChoice() {
        ChoicesPopUpController.instance.choicesView.removeFromSuperview()
    }
    
    
    //adding new branch adit
    var firstchoice : Bool = false
    var secondchoice : Bool = false
    var thirdchoice : Bool = false
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var personNameLbl: UILabel!
    @IBOutlet weak var conversationPersonLbl: UILabel!
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personImage2: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var conversationBox: UIView!
    @IBOutlet weak var personNameBox: UIView!
    var imageView = UIImageView()
    var currentConversation = 0
    var situation = 0
 
    let storyNext = storyModel.initializeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationBox.layer.cornerRadius = 10
        //        personNameBox.layer.cornerRadius = 5
        PausePopUpController.instance.delegate = self
        currentConversation = 0
        checkTalkingPerson()
        personNameLbl.text = storyNext[0].personName
        backgroundImage.image = storyNext[0].backgroundImage
        conversationPersonLbl.text = storyNext[0].conversationPerson
        // Do any additional setup after loading the view.
        conversationBox.layer.borderColor = #colorLiteral(red: 0.4395161271, green: 0.6066932678, blue: 0.8426690698, alpha: 1)
        conversationBox.layer.zPosition = 0
        //        personNameBox.layer.zPosition = -100
        conversationBox.layer.borderWidth = 2
        personNameBox.layer.cornerRadius = 5
    }
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentConversation >= 0 && currentConversation < storyNext.count - 1 {
            currentConversation += 1
            if storyNext[currentConversation].storyLineCategory == .choices{
                ChoicesPopUpController.instance.showAlert()
            }
            imageView.removeFromSuperview()
            checkTalkingPerson()
            print(currentConversation)
            print(storyNext.count)
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            backgroundImage.image = storyNext[currentConversation].backgroundImage
        }
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        if currentConversation > 0 && currentConversation < storyNext.count {
            currentConversation -= 1
            if storyNext[currentConversation].storyLineCategory == .choices{
                ChoicesPopUpController.instance.showAlert()
            }
            if firstchoice == true{
                if storyNext[currentConversation].storyLineCategory == .firstchoice {
                    checkTalkingPerson()
                    personNameLbl.text = storyNext[currentConversation].personName
                    conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
                    backgroundImage.image = storyNext[currentConversation].backgroundImage
                }
            }
            checkTalkingPerson()
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            backgroundImage.image = storyNext[currentConversation].backgroundImage
        }
    }
    
    func backToChapterSelection() {
        print("tes")
        let storyboard = UIStoryboard(name: "ChapterSelectionStoryboard" , bundle: nil)
        let navigation = storyboard.instantiateViewController(identifier: "ChapterSelection" )
        UIApplication.topViewController()?.present(navigation, animated: true, completion: nil)
    }
    
    func resumeGame() {
        print("tes")
    }
    
    func checkTalkingPerson(){
        if storyNext[currentConversation].talkingPerson == .person1{
            personImage1.image = storyNext[currentConversation].personImage1
            personImage2.image = storyNext[currentConversation].personImage2
            imageView.image = storyNext[currentConversation].personImage2
            imageView.frame = personImage2.bounds
            imageView.image =  personImage2.image?.withRenderingMode(.alwaysTemplate)
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = UIColor(white: 0.5, alpha: 0.5)
            personImage2.addSubview(imageView)
        }
        else{
            personImage1.image = storyNext[currentConversation].personImage1
            personImage2.image = storyNext[currentConversation].personImage2
            imageView.image = storyNext[currentConversation].personImage1
            imageView.frame = personImage1.bounds
            imageView.image =  personImage1.image?.withRenderingMode(.alwaysTemplate)
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = UIColor(white: 0.5, alpha: 0.5)
            personImage1.addSubview(imageView)
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
