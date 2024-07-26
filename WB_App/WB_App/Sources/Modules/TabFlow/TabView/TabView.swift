//
//  TabView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI
import WBKit

struct TabsView: View {
    
    @State private var selectedTab : Tabs = .contacts
    @State private var contactsDTO : ContactsTransitionDTO = .init()
    
    var body: some View {

        TabView(selection: $selectedTab) {
            
            ForEach(Tabs.allCases, id: \.self) { tab in
                tabView(tab)
                    }
                }
            .background(Color.Neutural.BG)
            .tint(Color.Brand.default)
        }
    
    init() {
        configureView()
    }
}

extension TabsView {
    
    private func tabView(_ tab: Tabs) -> some View {
        switch tab {
        case .contacts:
            return AnyView(NavigationRouterView(routeType: ContactsRoute.self, contactsDTO: $contactsDTO) {
                ContactsListScreen(animationDTO: $contactsDTO)
                    .navBarTitle(title: tab.title)
                    .navBarTrailingButtons(buttons: setButtons(tab))
                    }
                .tabItem {
                    Image(tab.iconName)
                        .foregroundStyle(Color.Neutural.text)
                }
                .tag(tab)
                .setContactsTransition(DTO: contactsDTO, type: .first)
                )
        case .chats:
            return AnyView(NavigationRouterView(routeType: ChatsRoute.self) {
                ChatsScreen()
                    .navBarTitle(title: tab.title)
                    .navBarTrailingButtons(buttons: setButtons(tab))
                    }
                .tabItem {
                    Image(tab.iconName)
                        .foregroundStyle(Color.Neutural.text)
                }
                .tag(tab)
            )
        case .more:
            return AnyView(NavigationRouterView(routeType: MoreRoute.self) {
                MoreScreen()
                    .navBarTitle(title: tab.title)
                    .navBarTrailingButtons(buttons: setButtons(tab))
                    }
                .tabItem {
                    Image(tab.iconName)
                        .foregroundStyle(Color.Neutural.text)
                }
                .tag(tab)
            )
        }
    }
    
    private func configureView() {
        let appearance = UITabBar.appearance()
        appearance.unselectedItemTintColor = .black
    }
    
    private func setButtons(_ tab: Tabs) -> [ButtonModel] {
        switch tab {
        case .contacts:
            return [
                ButtonModel(imageName: tab.navBarIcon, action: {})
            ]
        case .chats:
            return [
                ButtonModel(imageName: tab.navBarIcon, action: {})
            ]
        case .more:
            return [
                ButtonModel(imageName: tab.navBarIcon, action: {})
            ]
        }
    }
    
}


#Preview {
    TabsView()
}

