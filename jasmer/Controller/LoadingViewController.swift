//
//  LoadingViewController.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 06/08/21.
//

import UIKit

class LoadingViewController: UIViewController {

    private var isOnboardingSeen : Bool!
    private let storageManager = StorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOnboardingSeen = storageManager.isOnboardingSeen()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showInitialScreen()
    }
    
    private func showInitialScreen(){
        if isOnboardingSeen{
            //goto Main
            showMainApp()
        }else{
            //goto Onboarding
            showOnboardingScreen()
        }
    }
    
    private func showMainApp(){
        let MainViewController = UIStoryboard(name: "ChapterSelectionStoryboard", bundle: nil).instantiateViewController(identifier: "ChapterSelection")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = MainViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    private func showOnboardingScreen(){
        let OnboardingViewController = UIStoryboard(name: "TouchingBoxStoryboard", bundle: nil).instantiateViewController(identifier: "TouchingBoxStoryboard")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = OnboardingViewController
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
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
