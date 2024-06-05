//
//  WBKeys.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import Foundation

typealias WBKeys = LocalizableKeys

enum LocalizableKeys {
    
    enum Onboarding {
        static let title = "onboarding_title".localized
        static let agreement = "agreement".localized
        static let start = "start_chatting".localized
    }
    
    enum Tabs {
        static let contacts = "tab_contacts".localized
        static let chats = "tab_chats".localized
        static let more = "tab_more".localized
    }
}
