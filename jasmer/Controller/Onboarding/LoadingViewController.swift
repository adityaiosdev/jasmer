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
    private let navigationManager = NavigationManager()
    
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
            navigationManager.show(screen: .mainApp, inController: self)
        }else{
            //goto Onboarding
            navigationManager.show(screen: .onboarding, inController: self)
        }
    }

}
