//
//  TextLinkButton.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct TextLinkButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.wbFont(.body1))
                .colorMultiply(Color.Neutural.text)
        }
    }
    
    init(text: String, action: @escaping () -> Void = {}) {
        self.text = text
        self.action = action
    }
}

#Preview {
    TextLinkButton(text: "Atat", action: {})
}
