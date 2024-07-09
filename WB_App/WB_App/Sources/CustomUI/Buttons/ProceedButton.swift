//
//  ProceedButton.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ProceedButton: View {
    
    enum ButtonState {
        case initial, disabled
    }
    
    @State var state: ButtonState
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            
            if state == .initial {
                action()
            }
        } label: {
            Text(text)
                .font(.wbFont(.subheading2))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(state == .initial ? Color.Brand.default : Color.Brand.default.opacity(0.5))
                .cornerRadius(UIConstants.radius)
        }
        .padding(.horizontal, C.Offset.big)
    }
    
    init(state: ButtonState = .initial,
         text: String,
         action: @escaping () -> Void = {})
    {
        self.state = state
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
