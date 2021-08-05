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
    let correctText: String?
    let wrongText: String?
    let correctAnswer: String?
    
    
    init(personName: String?, conversationText: String?, personImage1: UIImage?, personImage2: UIImage?, backgroundImage: UIImage?, talkingPerson: TalkingPerson?, category: Category, interactions: [String? : Int?], correctText: String?, wrongText: String?, correctAnswer: String?){
        self.personName = personName
        self.conversationText = conversationText
        self.personImage1 = personImage1
        self.personImage2 = personImage2
        self.backgroundImage = backgroundImage
        self.talkingPerson = talkingPerson
        self.category = category
        self.interactions = interactions
        self.correctText = correctText
        self.wrongText = wrongText
        self.correctAnswer = correctAnswer
    }
    
    public static func initializeData() -> [[Storyline]]{
        let storylines: [[Storyline]] = [
//            [
//                Storyline(personName: nil, conversationText: nil, personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "hoegengQuiz"), talkingPerson: nil, category: .conversation, interactions: ["1955" : 3, "2021" : 3, "1945" : 3, "2001" : 3], correctText: "Saat ini Jason sedang berada di tahun 1955, tahun pertama kali diadakannya pemilu.", wrongText: "Pemilu pertama dilangsungkan pada tahun 1955. Jason sekarang berada di tahun tersebut.", correctAnswer: "1955")
//            ],
            [
            Storyline(personName: "Jason", conversationText: "Ma, aku berangkat ya!!!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Mama Jason", conversationText: "Iya, salam dulu sini, nak.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Jason", conversationText: "Oh ya, Ma, hari ini terakhir buat bayar buku.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Mama Jason", conversationText: "Ya ampun hampir lupa, ini uangnya ya nak.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Mama Jason", conversationText: "Eh, itu jam siapa kamu pake? Kamu ga ngambil punya orang kan?", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Jason", conversationText: "Engga, ini dari paket yang kemaren aku dapetin. Eh, itu jam siapa kamu pake? Kamu ga ngambil punya orang kan?", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Mama Jason", conversationText: "Hmm.. Yaudah sekarang kamu berangkat. Nanti kamu telat.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Jason", conversationText: "Ehehe, iya. Dahh maa!!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "MamaJason"), backgroundImage: UIImage(named: "homebg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: nil, conversationText: nil, personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "blackout"), talkingPerson: nil, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil)
        ], [
            Storyline(personName: "Jason", conversationText: "Ah... paket yang kemaren dari siapa ya? Kenapa kirimnya ke aku?", personImage1: UIImage(named: "Jason"), personImage2: nil, backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil)
        ], [
            Storyline(personName: "Jason", conversationText: "Permisi pak, selamat siang. Saya ingin membayar uang buku.", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Admin"), backgroundImage: UIImage(named: "ruanggurubg"), talkingPerson: .person1, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil)
        ], [
            Storyline(personName: "Carlos", conversationText: "Jason!", personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Carlos"), backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person2, category: .conversation, interactions: [nil:nil], correctText: nil, wrongText: nil, correctAnswer: nil),
            Storyline(personName: "Jason", conversationText: nil, personImage1: UIImage(named: "Jason"), personImage2: UIImage(named: "Carlos"), backgroundImage: UIImage(named: "smpbg"), talkingPerson: .person1, category: .interaction, interactions: ["Hmm, ga ah, gila ya lo?" : 2, "Beneran, nih?" : 5, "Hmm, gimana ya..." : 6], correctText: nil, wrongText: nil, correctAnswer: nil)
        ], [
            Storyline(personName: "Post Quiz", conversationText: "Apa yang bisa kamu terapkan setelah membaca cerita tersebut?", personImage1: nil, personImage2: nil, backgroundImage: UIImage(named: "homebg"), talkingPerson: nil, category: .postQuiz, interactions: ["Tidak menerima suap " : 1, "Jangan sembarangan membeli es doger" : 0, "Melakukan tindakan korupsi" : 0, "Jangan bicara dengan orang sembarangan" : 0], correctText: nil, wrongText: nil, correctAnswer: nil)
        ]
        ]
        
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
    case postQuiz
    case miniGames
}
