//
//  WBNavBar.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import SwiftUI

extension View {

    func navBarBackButton<Route: Hashable>(router: Router<Route>, backTo title: String) -> some View {
        return self.modifier(NavBarBackButton<Route>(title: title))
            .environmentObject(router)
            .navigationBarBackButtonHidden()
    }
    
    func navBarTrailingButtons(buttons: [ButtonModel]) -> some View {
        return self.modifier(NavBarRightButtonModifier(buttons: buttons))
    }

}


struct NavBarRightButtonModifier: ViewModifier {
    
    var buttons : [ButtonModel]
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        ForEach(Array(buttons.self), id: \.self) { button in
                            Button(action: {
                                button.action()
                            }) {
                                Image(button.imageName)
                            }
                        }
                    }
                }
            }
    }
}

struct NavBarBackButton<Route: Hashable>: ViewModifier {

    @EnvironmentObject var router: Router<Route>
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        router.pop()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text(title)
                        }
                        .foregroundStyle(Color.Neutural.text)
                        .font(.wbFont(.subheading1))
                    }
                }
            }
    }
}

