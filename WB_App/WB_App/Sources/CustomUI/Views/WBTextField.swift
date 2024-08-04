//
//  WBTextField.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 04.07.2024.
//

import SwiftUI

struct WBTextField: View {
    var placeholder : String
    @State private var text: String = ""
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    
    var body: some View {
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
