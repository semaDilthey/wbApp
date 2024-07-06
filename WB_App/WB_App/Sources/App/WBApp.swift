//
//  WBApp.swift
//  WBApp
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

@main
struct WBApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            InfiniteScrollView { data in
                ComplexLayoutCell(data: data, layout: LayoutType.random())
            } configurationModel: {
                CellData()
            }
        }
    }
}
