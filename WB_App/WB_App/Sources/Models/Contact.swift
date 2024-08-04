//
//  Contacts.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import Foundation

struct Contact: Hashable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var surname: String
    var photo: String
    
    var status: Status
    var hasStory: Bool = false
}

extension Contact {
    
    static func makeMock() -> Self {
        let names = ["Pasha", "Nick", "Kaosyan"]
        let surnames = ["Grigoryan", "Altman", "Zuckerberg", "Sena"]
        let pics = [
            "https://i.imgur.com/2k1ODbP.jpeg",
            "https://i.imgur.com/sUWsv3m.jpeg",
            "https://i.imgur.com/Ym2zcwf.jpeg",
            "https://i.imgur.com/YzaqJlD.jpeg",
            "https://i.imgur.com/qwzDjhc.jpeg",
            "https://i.imgur.com/1PDAhW2.jpeg",
            "https://i.imgur.com/jWmakzn.jpeg",
            "https://i.imgur.com/l3gSyRn.jpeg"
        ]
        return .init(name: names.randomElement()!,
                     surname: surnames.randomElement()!,
                     photo: pics.randomElement()!,
                     status: .online,
                     hasStory: [true, false].randomElement()!)
    }
}

enum Status: Hashable {
    case online
    case offline(lastOnline: String)
}
