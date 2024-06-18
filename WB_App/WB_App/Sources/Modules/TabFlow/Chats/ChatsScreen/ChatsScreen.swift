//
//  ChatsScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ChatsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @EnvironmentObject var router : Router

    
    var body: some View {
        VStack {
            TextLinkButton(text: "DISMISS") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    ChatsScreen()
}
