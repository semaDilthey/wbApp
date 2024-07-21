//
//  File.swift
//  
//
//  Created by Семен Гайдамакин on 21.07.2024.
//

public enum Country: String, CaseIterable {
    case ru = "Russia"
    case bel = "Belarus"

    var flag: String {
        switch self {
        case .ru:
            "🇷🇺"
        case .bel:
            "🇧🇾"
        }
    }

    var code: String {
        switch self {
        case .ru:
            return "+7"
        case .bel:
            return "+39"
        }
    }

    var mask: String {
        switch self {
        case .ru:
            "000-00-00"
        case .bel:
            "9999-00-000"
        }
    }
}
