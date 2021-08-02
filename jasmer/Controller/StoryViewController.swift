//
//  StoryViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

class StoryViewController: UIViewController , PausePopUpControllerDelegate{
    
    
    @IBOutlet weak var personNameLbl: UILabel!
    @IBOutlet weak var conversationPersonLbl: UILabel!
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personImage2: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var conversationBox: UIView!
    @IBOutlet weak var personNameBox: UIView!
    var currentConversation = 0
    var storyNext = [
        storyModel(personName: "Jason", conversationPerson: "Ma, aku berangkat ya!!", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "EmakJasonTransparent")!, backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Iya salim dulu sini nak.", personImage1: #imageLiteral(resourceName: "JasonTransparent"),personImage2: #imageLiteral(resourceName: "EmakJason"),backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Jason", conversationPerson: "Oh iya ma lupa, hari ini terakhir buat bayar buku ma.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "EmakJasonTransparent")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Ya ampun hampir lupa, ini uangnya ya nak.", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "EmakJason")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Eh, itu jam siapa kamu pake? Kamu ga ngambil punya orang kan?", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "EmakJason")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Engga, ini dari paket yang kemaren aku dapetin.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "EmakJasonTransparent")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Hmm.. Yaudah sekarang kamu berangkat. Nanti kamu telat.", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "EmakJason")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Mama Jason", conversationPerson: "Ehehe, iya. Dahh maa!!", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "EmakJasonTransparent")!,backgroundImage: UIImage(named: "homebg")!),
        storyModel(personName: "Jason", conversationPerson: "Ah... paket yang kemaren dari siapa ya? Kenapa kirimnya ke aku?", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "transparentPerson")!,backgroundImage: UIImage(named: "smpbg")!),
        storyModel(personName: "Carlos", conversationPerson: "Jason, jadi bayar buku gak?", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "Carlos")!,backgroundImage: UIImage(named: "smpbg")!),
        storyModel(personName: "Jason", conversationPerson: "Oh, iya jadi! Tunggu sebentar!", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "CarlosTransparent")!,backgroundImage: UIImage(named: "smpbg")!),
        storyModel(personName: "Jason", conversationPerson: "Nanti aku pikirkan lagi. Juga maksud dari kotak tersebut", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "transparentPerson")!,backgroundImage:UIImage(named: "smpbg")!),
        storyModel(personName: "Jason", conversationPerson: "Permisi pak, selamat siang. Saya ingin membayar uang buku.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdminTransparent")!,backgroundImage: UIImage(named: "ruanggurubg")!),
        storyModel(personName: "Admin", conversationPerson: "Oh tunggu sebentar, atas nama siapa ya?", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!),
        storyModel(personName: "Jason", conversationPerson: "Jason Nugroho, pak. Ini uangnya, pak.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdminTransparent")!,backgroundImage: UIImage(named: "ruanggurubg")!),
        storyModel(personName: "Admin", conversationPerson: "Oh, iya. Ini lebih uangnya. Sebentar ya.", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!),
        storyModel(personName: "Admin", conversationPerson: "Ini kembaliannya ya, nak. Makasih, nak.", personImage1: UIImage(named: "JasonTransparent")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationBox.layer.cornerRadius = 10
//        personNameBox.layer.cornerRadius = 5
        PausePopUpController.instance.delegate = self
        personImage1.image = storyNext[0].personImage1
        personImage2.image = storyNext[0].personImage2
        personNameLbl.text = storyNext[0].personName
        backgroundImage.image = storyNext[0].backgroundImage
        conversationPersonLbl.text = storyNext[0].conversationPerson
        // Do any additional setup after loading the view.
        conversationBox.layer.borderColor = #colorLiteral(red: 0.4395161271, green: 0.6066932678, blue: 0.8426690698, alpha: 1)
        conversationBox.layer.zPosition = 0
//        personNameBox.layer.zPosition = -100
        conversationBox.layer.borderWidth = 2

    }
    

    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        PausePopUpController.instance.showAlert()
    }
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentConversation >= 0 && currentConversation < storyNext.count - 1 {
            currentConversation += 1
            print(currentConversation)
            print(storyNext.count)
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            personImage1.image = storyNext[currentConversation].personImage1
            personImage2.image = storyNext[currentConversation].personImage2
            backgroundImage.image = storyNext[currentConversation].backgroundImage
        }
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        if currentConversation > 0 && currentConversation < storyNext.count {
            currentConversation -= 1
            personNameLbl.text = storyNext[currentConversation].personName
            conversationPersonLbl.text = storyNext[currentConversation].conversationPerson
            personImage1.image = storyNext[currentConversation].personImage1
            personImage2.image = storyNext[currentConversation].personImage2
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
