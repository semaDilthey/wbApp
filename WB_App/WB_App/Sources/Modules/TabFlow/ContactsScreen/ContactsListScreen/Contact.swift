//
//  Contacts.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import Foundation

struct Contact: Hashable {
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
        return .init(name: names.randomElement()!, 
                     surname: surnames.randomElement()!,
                     photo: "123",
                     status: .online,
                     hasStory: [true, false].randomElement()!)
    }
}

enum Status: Hashable {
    case online
    case offline(lastOnline: String)
}
