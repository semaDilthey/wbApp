//
//  TabView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct TabsView: View {
    
    @StateObject var router = Router.shared
    
    var body: some View {

        TabView(selection: $router.selectedTab) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                NavigationStack(path: $router.path) {
                tabView(tab)
                    .navigationDestination(for: Route.self) { destination in
                        switch destination {
                        case .contactDetails(let contact):
                            DetailedContactScreen(fullName: (contact.name, contact.surname))
                                .navigationBarBackButtonHidden(true)
                                .withNavigationView(type: .return(
                                    title: router.selectedTab.title,
                                    router: router))
                        default:
                            OnboardingView()
                        }
                    }
                    }
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
        tab.view
            .withNavigationView(type: .rightButtonsAndTitle(title: tab.title,
                                                            buttons: setButtons(tab)))
            .tabItem {
                Image(tab.iconName)
                    .foregroundStyle(Color.Neutural.text)
            }
            .tag(tab)
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

