//
//  Storyline.swift
//  jasmer
//
//  Created by Vivian Kosasih on 03/08/21.
//

import Foundation
import UIKit

struct Storyline{
    let personName: String?
    let conversationText: String?
    let personImage1: UIImage?
    let personImage2: UIImage?
    let backgroundImage: UIImage?
    let talkingPerson: TalkingPerson?
    let category: Category
    let interactions: [String?: Int?]
    
    
    init(personName: String?, conversationText: String?, personImage1: UIImage?, personImage2: UIImage?, backgroundImage: UIImage?, talkingPerson: TalkingPerson?, category: Category, interactions: [String? : Int?]){
        self.personName = personName
        self.conversationText = conversationText
        self.personImage1 = personImage1
        self.personImage2 = personImage2
        self.backgroundImage = backgroundImage
        self.talkingPerson = talkingPerson
        self.category = category
        self.interactions = interactions
    }
    
    public static func initializeData() -> [[Storyline]]{
        let storylines: [[Storyline]] = [[
            Storyline(personName: "Jason", conversationText: "Ma, aku berangkat ya!!!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .interaction, interactions: ["a":1, "b":3]),
            Storyline(personName: "Mama Jason", conversationText: "Iya, salam dulu sini, nak.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Jason", conversationText: "Oh ya, Ma, hari ini terakhir buat bayar buku.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Mama Jason", conversationText: "Ya ampun hampir lupa, ini uangnya ya nak.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Mama Jason", conversationText: "Eh, itu jam siapa kamu pake? Kamu ga ngambil punya orang kan?", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Jason", conversationText: "Engga, ini dari paket yang kemaren aku dapetin.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Mama Jason", conversationText: "Hmm.. Yaudah sekarang kamu berangkat. Nanti kamu telat.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Jason", conversationText: "Ehehe, iya. Dahh maa!!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: nil, conversationText: nil, personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "Blackout"), talkingPerson: nil, category: .conversation, interactions: [nil:nil])
        ], [
            Storyline(personName: "Jason", conversationText: "Ah... paket yang kemaren dari siapa ya? Kenapa kirimnya ke aku?", personImage1: UIImage(named: "Jason"), personImage2: nil, backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil])
        ], [
            Storyline(personName: "Jason", conversationText: "Permisi pak, selamat siang. Saya ingin membayar uang buku.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Admin"), backgroundImage: UIImage(named: "ruanggurubg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil])
        ], [
            Storyline(personName: "Carlos", conversationText: "Jason!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Carlos"), backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil]),
            Storyline(personName: "Jason", conversationText: nil, personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Carlos"), backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person1, category: .interaction, interactions: ["Hmm, ga ah, gila ya lo?" : 4, "Beneran, nih?" : 5, "Hmm, gimana ya..." : 6])
        ]]
        
        return storylines
    }
}

enum TalkingPerson{
    case person1
    case person2
}

enum Category{
    case conversation
    case interaction
}
