//
//  MockUser.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.08.2024.
//

import Foundation
import ExyteChat

struct MockUser: Equatable {
    let uid: String
    let name: String
    let avatar: URL?

    init(uid: String, name: String, avatar: URL? = nil) {
        self.uid = uid
        self.name = name
        self.avatar = avatar
    }
}

extension MockUser {
    var isCurrentUser: Bool {
        uid == "1"
    }
}

extension MockUser {
    func toChatUser() -> ExyteChat.User {
        ExyteChat.User(id: uid, name: name, avatarURL: avatar, isCurrentUser: isCurrentUser)
    }
}
