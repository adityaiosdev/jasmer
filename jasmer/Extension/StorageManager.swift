//
//  StorageManager.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 06/08/21.
//

import Foundation

class StorageManager {
    
    enum Key: String {
        case onboardingSeen
    }
    
    func isOnboardingSeen() -> Bool {
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    
    func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    
    func resetOnboarding() {
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
    
}
