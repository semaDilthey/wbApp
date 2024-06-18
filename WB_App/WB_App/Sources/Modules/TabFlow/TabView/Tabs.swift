//
//  Tabs.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 15.06.2024.
//

import SwiftUI

enum Tabs: Int, CaseIterable, Hashable {
    case contacts
    case chats
    case more
}

extension Tabs {
    
    var iconName: String {
        switch self {
        case .contacts:
            return WBIcons.Tabs.contacts
        case .chats:
            return WBIcons.Tabs.chats
        case .more:
            return WBIcons.Tabs.more
        }
    }
    
    var title: String {
        switch self {
        case .contacts:
            return WBKeys.Tabs.contacts
        case .chats:
            return WBKeys.Tabs.chats
        case .more:
            return WBKeys.Tabs.more
        }
    }
    
    var navBarIcon: String {
        switch self {
        case .contacts:
            return WBIcons.NavBar.plus
        case .chats:
            return WBIcons.NavBar.listCheck
        case .more:
            return ""
        }
    }
}
