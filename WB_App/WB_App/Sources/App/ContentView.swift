//
//  ContentView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

//struct ContentView: View {
//        
//    var body: some View {
//       OnboardingView()
//    }
//}
//
//#Preview {
//    ContentView()
//}

struct StartView: View {
    
//    @EnvironmentObject var router: Router
    let manager = AppStorageManager.shared
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
        }
        .padding()
        .onAppear {
            if manager.isNewUser() {
//                router.navigateTo(Route.onboarding)
            } else {
//                router.navigateTo(Route.tabs)
            }
        }
        .onAppear {
            manager.markAsLaunched()
        }
    }
}
