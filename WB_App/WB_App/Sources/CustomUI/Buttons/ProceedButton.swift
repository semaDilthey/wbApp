//
//  ProceedButton.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ProceedButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(WBFont.subheading2.font)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.brand)
                .cornerRadius(UIConstants.radius)
        }
        .padding(.horizontal, C.Offset.big)
    }
    
    init(text: String, action: @escaping () -> Void = {}) {
        self.text = text
        self.action = action
    }
}

#Preview {
    ProceedButton(text: "Начать общаться", action: {})
}

fileprivate enum UIConstants {
    static let radius: CGFloat = 30
}
