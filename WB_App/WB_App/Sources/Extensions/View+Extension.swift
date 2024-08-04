//
//  View+Extension.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 04.07.2024.
//

import SwiftUI

extension View {
    
    func resignFirstResponder(onResign completion: @escaping () -> Void = {} ) -> some View {
        self.modifier(ResignFirstResponder(completion: completion))
    }
}

struct ResignFirstResponder : ViewModifier {

    var completion: () -> Void

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                completion()
            }
    }
}
