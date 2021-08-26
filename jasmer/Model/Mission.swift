//
//  Mission.swift
//  jasmer
//
//  Created by Vivian Kosasih on 26/08/21.
//

import UIKit

struct Mission{
    let imageName: UIImage
    let title: String
    let missions: [String]
    
    public static func initializeData() -> [Mission]{
        let missions = [
            Mission(imageName: UIImage(named: "Jason")!, title: "Misi Jason", missions: ["Kembali ke rumah", "Berangkat ke sekolah", "Membeli Es Doger"])
        ]
        return missions
    }
}
