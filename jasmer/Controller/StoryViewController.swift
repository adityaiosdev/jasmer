//
//  StoryViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var personNameLbl: UILabel!
    @IBOutlet weak var conversationPersonLbl: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    var currentConversation = 0
    var storyNext = [
        storyModel(personName: "Jason", conversationPerson: "Ma, aku pergi dulu ya", personImage: #imageLiteral(resourceName: "Jason")),
        storyModel(personName: "Jason", conversationPerson: "Mau salim dulu tapi", personImage: #imageLiteral(resourceName: "Carlos"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        customViewController.instance.showAlert()
    }
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentConversation >= 0 && currentConversation < storyNext.count - 1 {
            currentConversation += 1
            print(currentConversation)
            print(storyNext.count)
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            personImage.image = storyNext[currentConversation].personImage
        }
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        if currentConversation > 0 && currentConversation < storyNext.count {
            currentConversation -= 1
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            personImage.image = storyNext[currentConversation].personImage
            
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
