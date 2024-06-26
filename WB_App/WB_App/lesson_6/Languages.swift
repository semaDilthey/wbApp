//
//  Languages.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 24.06.2024.
//

import Foundation

enum Language: Hashable, CaseIterable {
    case ru, us, it, de, cn
    
    var locale : Locale {
        switch self {
        case .ru:
            Locale(identifier: "ru_RU")
        case .us:
            Locale(identifier: "en_US")
        case .it:
            Locale(identifier: "it_IT")
        case .de:
            Locale(identifier: "de_DE")
        case .cn:
            Locale(identifier: "zh_CN")
        }
    }
    
    var flag : String {
        switch self {
        case .ru:
            "🇷🇺"
        case .us:
            "🇺🇸"
        case .it:
            "🇮🇹"
        case .de:
            "🇩🇪"
        case .cn:
            "🇨🇳"
        }
    }
}

extension Language {
    
    init(locale: Locale) {
        switch locale {
        case Locale(identifier: "ru_RU"):
            self = .ru
        case Locale(identifier: "en_US"):
            self = .us
        case Locale(identifier: "it_IT"):
            self = .it
        case Locale(identifier: "de_DE"):
            self = .de
        case Locale(identifier: "zh_CN"):
            self = .de
        default:
            self = .ru
        }
    }
    
}
