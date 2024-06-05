//
//  TabView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

enum Tabs: CaseIterable, Hashable {
    case contacts
    case chats
    case more
    
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

    @ViewBuilder
    var view: some View {
        switch self {
        case .contacts:
            ContactsScreen()
        case .chats:
            ChatsScreen()
        case .more:
            MoreScreen()
        }
    }
}


struct TabsView: View {
    
    @State var selectedTab : Tabs = .chats
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Image(tab.iconName)
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
    }
}

#Preview {
    TabsView()
}
