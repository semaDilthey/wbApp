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
        let pics = ["1","2","3","4","5","6","7"]
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
