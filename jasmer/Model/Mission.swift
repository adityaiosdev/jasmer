//
//  Mission.swift
//  jasmer
//
//  Created by Vivian Kosasih on 26/08/21.
//

import UIKit

struct Mission{
    let imageName: String
    let title: String
    let missions: [String]
    let category: MissionType
    
    public static func initializeData() -> [Mission]{
        let missions = [
            Mission(imageName: "Jason", title: "Misi Jason", missions: ["Pergi ke rumah", "Berangkat ke sekolah", "Membeli Es Doger"], category: .present),
            Mission(imageName: "Jason", title: "Misi Jason", missions: ["Pergi ke kantor polisi"], category: .hoegeng),
            Mission(imageName: "Jason", title: "Misi Jason", missions: ["Mencari orang terdekat", "Pergi ke bandara"], category: .hatta),
            Mission(imageName: "Jason", title: "Misi Jason", missions: ["Menemui penjual es doger", "Pulang ke rumah"], category: .presentAfterPast)
        ]
        return missions
    }
}


enum MissionType: String{
    case present = "Present"
    case hoegeng = "Hoegeng"
    case hatta = "Hatta"
    case presentAfterPast = "Present After Past"
}

func checkLastMission(storyline: Storyline){
    let cdm = CoreDataManager()
    let missionCDM = cdm.getMission()
    var missionListCDM = [MissionStatement]()
    let gameStatus = cdm.getGameStatus()
    let missionList = Mission.initializeData()
    
//    print("Mission Type: \(gameStatus[gameStatus.count-1].missionType)")
    
    switch storyline.nextSprite {
    case .present:
        print("Present")
        if gameStatus.isEmpty {
            if !missionCDM.isEmpty{
                print("Not Empty")
                missionListCDM = cdm.getMissionStatement(for: missionCDM[0])
                if missionListCDM.isEmpty {
                    cdm.deleteAllMission()
                    cdm.insertEntryMission(for: missionList[0])
                }
            }
            else if missionListCDM.isEmpty{
                print("Empty")
                cdm.deleteAllMission()
                cdm.insertEntryMission(for: missionList[0])
            }
        }
        else if gameStatus[gameStatus.count-1].gameStatus == true{
            print("True: \(gameStatus[0].gameStatus)")
            cdm.deleteAllMission()
//            if storyline.nextSprite == .hoegeng{
//                cdm.insertEntryMission(for: Mission(imageName: "Jason", title: "Misi Jason", missions: ["Pergi ke kantor polisi"], category: .hoegeng))
//            }
//            else{
//                cdm.insertEntryMission(for: Mission(imageName: "Jason", title: "Misi Jason", missions: ["Mencari orang terdekat", "Pergi ke bandara"], category: .hatta))
//            }
        }
    case .hoegeng:
        print("Hoegeng")
        if gameStatus.isEmpty {
            if !missionCDM.isEmpty{
                print("Not Empty")
                missionListCDM = cdm.getMissionStatement(for: missionCDM[0])
                if missionListCDM.isEmpty {
                    cdm.deleteAllMission()
                    cdm.insertEntryMission(for: missionList[1])
                }
            }
            else if missionListCDM.isEmpty{
                print("Empty")
                cdm.deleteAllMission()
                cdm.insertEntryMission(for: missionList[1])
            }
        }
        else if gameStatus[gameStatus.count-1].gameStatus == true && gameStatus[gameStatus.count-1].missionType == "Present" {
            print("True: \(gameStatus[0].gameStatus)")
            cdm.deleteAllMission()
            cdm.insertEntryMission(for: missionList[1])
        }
    case .hatta:
        print("Hatta")
        if gameStatus.isEmpty {
            if !missionCDM.isEmpty{
                print("Not Empty")
                missionListCDM = cdm.getMissionStatement(for: missionCDM[0])
                if missionListCDM.isEmpty {
                    cdm.deleteAllMission()
                    cdm.insertEntryMission(for: missionList[2])
                }
            }
            else if missionListCDM.isEmpty{
                print("Empty")
                cdm.deleteAllMission()
                cdm.insertEntryMission(for: missionList[2])
            }
        }
        else if gameStatus[gameStatus.count-1].gameStatus == true && gameStatus[gameStatus.count-1].missionType == "Present"{
            print("True: \(gameStatus[0].gameStatus)")
            cdm.deleteAllMission()
            cdm.insertEntryMission(for: missionList[2])
        }
    case .presentAfterPast:
        print("After Past")
        if gameStatus.isEmpty {
            if !missionCDM.isEmpty{
                print("Not Empty")
                missionListCDM = cdm.getMissionStatement(for: missionCDM[0])
                if missionListCDM.isEmpty {
                    cdm.deleteAllMission()
                    cdm.insertEntryMission(for: missionList[3])
                }
            }
            else if missionListCDM.isEmpty{
                print("Empty")
                cdm.deleteAllMission()
                cdm.insertEntryMission(for: missionList[3])
            }
        }
        else if gameStatus[gameStatus.count-1].gameStatus == true && (gameStatus[gameStatus.count-1].missionType == "Hoegeng" || gameStatus[gameStatus.count-1].missionType == "Hatta"){
            print("True: \(gameStatus[0].gameStatus)")
            cdm.deleteAllMission()
            cdm.insertEntryMission(for: missionList[3])
        }
    default:
    print("Default")
}
}
