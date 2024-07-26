//
//  WBApp.swift
//  WBApp
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

@main
struct WBApp: App {
    
    @StateObject var viewModel : GoF_ViewModel = .init()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            GoF_View()
                .environmentObject(viewModel)
        }
    }
}
