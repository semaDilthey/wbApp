//
//  Router.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 13.06.2024.
//

import SwiftUI

final class Router<Route: Hashable>: ObservableObject {
        
    @Binding var path: [Route]
    
    init(path: Binding<[Route]>) {
        self._path = path
    }
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        _ = path.popLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
