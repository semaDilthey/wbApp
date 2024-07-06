//
//  Profile.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 06.07.2024.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}

extension Profile {
    static let mockProfile = Profile(username: "sema.dilthey")
}
