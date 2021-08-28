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
    
    var missionParent = MissionObject()
    
    //MARK: -Insert
    //Insert Entry Last Updates
    func insertEntryLastUpdates(_ currentChapter: Int, _ currentSection: Int, currentIndex: Int){
        let lastUpdate = LastUpdates(context: context)
        lastUpdate.chapter = Int64(currentChapter)
        lastUpdate.section = Int64(currentSection)
        lastUpdate.index = Int64(currentIndex)
        
        appDelegate.saveContext()
    }
    
    func insertEntryMission(for mission: Mission){
        let missionObject = MissionObject(context: context)
        missionObject.imageName = mission.imageName
        missionObject.title = mission.title

        for mission in mission.missions {
            let missionStatement = MissionStatement(context: context)
            missionStatement.mission = mission
            missionStatement.status = false
            missionStatement.missionParent = missionObject
        }
        
        appDelegate.saveContext()
    }
    
    //Insert Game Status
    func insertGameStatus(for missionType : MissionType){
        let gameStatus = GameStatus(context: context)
        gameStatus.gameStatus = true
        gameStatus.missionType = missionType.rawValue
        
        appDelegate.saveContext()
    }
    
    //Insert background position
    func insertBackgroundPosition(bgPosition: CGPoint){
        let backgroundPosition = BackgroundPosition(context: context)
        backgroundPosition.xPosition = Float(bgPosition.x)
        backgroundPosition.yPosition = Float(bgPosition.y)
        
        appDelegate.saveContext()
    }
    
    //Update mission status
    func updateMission(missionStatement: MissionStatement, newStatus: Bool){
        missionStatement.status = newStatus
        appDelegate.saveContext()
    }
    
    //Insert last mission
    func insertLastMission(missionType: MissionType){
        let lastMission = LastMission(context: context)
        lastMission.missionType = missionType.rawValue
        appDelegate.saveContext()
    }
    
    //MARK: -Read
    //Read Last Updates
    func getLastUpdate () -> [LastUpdates] {
        let fetchRequest: NSFetchRequest<LastUpdates> = LastUpdates.fetchRequest()
        
        do{
            return try context.fetch(fetchRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
        return []
    }
    
    //Read Mission
    func getMission() -> [MissionObject]{
        let fetchRequest: NSFetchRequest<MissionObject> = MissionObject.fetchRequest()
        do{
            return try context.fetch(fetchRequest)
        }
        catch {
            print("\(error.localizedDescription)")
        }
        return []
    }
    
    func getMissionStatement(for missionObject: MissionObject) -> [MissionStatement]{
        guard let missions = missionObject.missionDetail?.allObjects as? [MissionStatement] else{
            return []
        }
        return missions
    }
    
    //Read game status
    func getGameStatus() -> [GameStatus]{
        let fetchRequest: NSFetchRequest<GameStatus> = GameStatus.fetchRequest()
        do{
            return try context.fetch(fetchRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
        return []
    }
    
    //Read Background Position
    func getBackgroundPosition() -> [BackgroundPosition]{
        let fetchRequest: NSFetchRequest<BackgroundPosition> = BackgroundPosition.fetchRequest()
        do{
            return try context.fetch(fetchRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
        return []
    }
    
    //Read last mission
    func getLastMission() -> [LastMission]{
        let fetchRequest: NSFetchRequest<LastMission> = LastMission.fetchRequest()
        do{
            return try context.fetch(fetchRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
        return []
    }
    
    //MARK: -Delete
    //Delete Game Status
    func deleteGameStatus(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "GameStatus")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do{
            try context.execute(deleteRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
    }
    
    //Delete Background Position
    func deleteBackgroundPosition(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "BackgroundPosition")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do{
            try context.execute(deleteRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
    }
    
    //Delete Mission
    func deleteOneMission(for mission: MissionStatement){
        context.delete(mission)
        appDelegate.saveContext()
    }
    
    func deleteAllMission(){
        deleteMissionObjects()
        deleteMissions()
    }
    
    func deleteMissionObjects(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MissionObject")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do{
            try context.execute(deleteRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
    }
    
    func deleteMissions(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MissionStatement")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do{
            try context.execute(deleteRequest)
        }
        catch{
            print("\(error.localizedDescription)")
        }
    }
}
