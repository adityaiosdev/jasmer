//
//  CoreDataManager.swift
//  jasmer
//
//  Created by Vivian Kosasih on 04/08/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func insertEntry(_ currentChapter: Int, _ currentSection: Int, currentIndex: Int){
        let lastUpdate = LastUpdates(context: context)
        lastUpdate.chapter = Int64(currentChapter)
        lastUpdate.section = Int64(currentSection)
        lastUpdate.index = Int64(currentIndex)
        
        appDelegate.saveContext()
    }
    
    //Read
    func getLastUpdate () -> [LastUpdates] {
        let fetchRequest: NSFetchRequest<LastUpdates> = LastUpdates.fetchRequest()
        
        do{
            return try context.fetch(fetchRequest)
        }
        catch{
            print("Error fetching quiz entries")
        }
        return []
    }
}
