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
    
    public static func initializeData() -> [Mission]{
        let missions = [
            Mission(imageName: "Jason", title: "Misi Jason", missions: ["Kembali ke rumah", "Berangkat ke sekolah", "Membeli Es Doger"])
        ]
        return missions
    }
}
