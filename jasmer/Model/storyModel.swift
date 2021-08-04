//
//  storyModel.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 29/07/21.
//

import UIKit

struct storyModel {
    let personName: String
    let conversationPerson: String
    let personImage1: UIImage
    let personImage2: UIImage
    let backgroundImage: UIImage
    let talkingPerson: talkingPerson
    
    init(personName: String, conversationPerson: String, personImage1: UIImage, personImage2: UIImage, backgroundImage: UIImage, talkingPerson: talkingPerson) {
        self.personName = personName
        self.conversationPerson = conversationPerson
        self.personImage1 = personImage1
        self.personImage2 = personImage2
        self.backgroundImage = backgroundImage
        self.talkingPerson = talkingPerson
    }
    
    public static func initializeData() -> [storyModel] {
        let storyNext = [
            storyModel(personName: "Jason", conversationPerson: "Ma, aku berangkat ya!!", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person1),
            storyModel(personName: "Mama Jason", conversationPerson: "Iya salam dulu sini nak.", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person2),
            storyModel(personName: "Jason", conversationPerson: "Oh iya ma lupa, hari ini terakhir buat bayar buku ma.", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person1),
            storyModel(personName: "Mama Jason", conversationPerson: "Ya ampun hampir lupa, ini uangnya ya nak.", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person2),
            storyModel(personName: "Mama Jason", conversationPerson: "Eh, itu jam siapa kamu pake? Kamu ga ngambil punya orang kan?", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person2),
            storyModel(personName: "Mama Jason", conversationPerson: "Hmm.. Yaudah sekarang kamu berangkat. Nanti kamu telat.", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person2),
            storyModel(personName: "Mama Jason", conversationPerson: "Ehehe, iya. Dahh maa!!", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person2),
            storyModel(personName: "Jason", conversationPerson: "Ah... paket yang kemaren dari siapa ya? Kenapa kirimnya ke aku?", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "EmakJason")!, backgroundImage: UIImage(named: "homebg")!, talkingPerson: .person1),
            storyModel(personName: "Carlos", conversationPerson: "Jason, jadi bayar buku gak?", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "Carlos")!, backgroundImage: UIImage(named: "smpbg")!, talkingPerson: .person2),
            storyModel(personName: "Jason", conversationPerson: "Oh, iya jadi! Tunggu sebentar!", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "Carlos")!, backgroundImage: UIImage(named: "smpbg")!, talkingPerson: .person1),
            storyModel(personName: "Jason", conversationPerson: "Nanti aku pikirkan lagi. Juga maksud dari kotak tersebut", personImage1: UIImage(named: "Jason")!, personImage2: UIImage(named: "Carlos")!, backgroundImage: UIImage(named: "smpbg")!, talkingPerson: .person1),
            storyModel(personName: "Jason", conversationPerson: "Permisi pak, selamat siang. Saya ingin membayar uang buku.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!, talkingPerson: .person1),
            storyModel(personName: "Admin", conversationPerson: "Oh tunggu sebentar, atas nama siapa ya?", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!, talkingPerson: .person2),
            storyModel(personName: "Jason", conversationPerson: "Jason Nugroho, pak. Ini uangnya, pak.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!, talkingPerson: .person1),
            storyModel(personName: "Admin", conversationPerson: "Oh, iya. Ini lebih uangnya. Sebentar ya.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!, talkingPerson: .person2),
            storyModel(personName: "Admin", conversationPerson: "Ini kembaliannya ya, nak. Makasih, nak.", personImage1: UIImage(named: "Jason")! , personImage2: UIImage(named: "GuruAdmin")!,backgroundImage: UIImage(named: "ruanggurubg")!, talkingPerson:  .person2)
        ]
        return storyNext
    }
}

enum talkingPerson{
    case person1
    case person2
}

