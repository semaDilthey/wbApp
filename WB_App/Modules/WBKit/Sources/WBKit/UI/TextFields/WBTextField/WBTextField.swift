//
//  SwiftUIView.swift
//  
//
//  Created by Семен Гайдамакин on 21.07.2024.
//

import SwiftUI

public struct WBTextField: View {
    var placeholder : String
    @Binding var text: String
    
    public init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(WBTextFieldStyle())
    }
}

struct WBTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(.black)
            .tint(.black)
            .padding(UI.size.padding)
            .background(Color.Neutural.secondaryBG)
            .cornerRadius(UI.size.radius)
            .font(.wbFont(.body1))
    }
}

fileprivate enum UI {
    static let size : (padding: CGFloat, radius: CGFloat) = (10, 4)
}
