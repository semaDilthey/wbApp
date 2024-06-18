//
//  NavigationRouterView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 17.06.2024.
//

import SwiftUI

struct NavigationRouterView<Route: Hashable>: View {
    
    let routeType: Route.Type
    @State private var path: [Route] = []
    @Binding var contactsDTO : ContactsTransitionDTO
    
    var content: () -> AnyView
    
    init(routeType: Route.Type,
         contactsDTO: Binding<ContactsTransitionDTO>? = nil,
         @ViewBuilder content: @escaping () -> some View) {
        self.routeType = routeType
        self._contactsDTO = contactsDTO ?? .constant(ContactsTransitionDTO())
        self.content = { AnyView(content()) }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            content()
                .navigationDestination(for: routeType) { route in
                    switch route {
                    case is ContactsRoute:
                        switch route as! ContactsRoute {
                        case .contactPreview:
                            DetailedContactScreen(animationDTO: $contactsDTO)
                                .toolbar(.hidden, for: .navigationBar)
                        case .addContact:
                            OnboardingView()
                        }
                    case is ChatsRoute:
                        switch route as! ChatsRoute {
                        default:
                            Text("ChatsRoute")
                        }
                    case is MoreRoute:
                        switch route as! MoreRoute {
                        default:
                            Text("MoreRoute")
                        }
                    default:
                        EmptyView()
                    }
                }
        }
        .environmentObject(Router(path: $path))
    }
}
