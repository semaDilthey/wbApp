//
//  SwiftUIView.swift
//  
//
//  Created by Семен Гайдамакин on 21.07.2024.
//

import SwiftUI

public extension View {
    
    func navBarTitle(title: String) -> some View {
        return self.modifier(NavigationTitleModifier(title: title))
    }

}

struct NavigationTitleModifier: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(title)
                        .font(.wbFont(.subheading1))
                        .padding(.leading, 8)
                }
            }

    }
}
