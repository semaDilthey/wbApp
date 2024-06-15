//
//  Router.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 13.06.2024.
//

import SwiftUI


enum Route: Hashable {
     case onboarding
     case auth
     case tabs
     case contactDetails(Contact)
 }
 

final class Router: ObservableObject {
    
    static let shared = Router()
    
    private init() {}
        
    @Published var selectedTab : Tabs = .contacts
    @Published var path : NavigationPath = .init()
    
    func navigateTo(_ route: Route) {
        path.append(route)
    }
    
    func backToRoot() {
        path.removeLast(path.count)
    }
        
    func back() {
        path.removeLast()
    }

}
