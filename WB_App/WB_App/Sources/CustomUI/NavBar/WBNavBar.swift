//
//  WBNavBar.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import SwiftUI

enum NavBarType {
    case title(title: String)
    case rightButtonsAndTitle(title: String, buttons: [ButtonModel])
    case `return`(title: String, router: Router)
    case returnAndRightButton(title: String, button: ButtonModel, router: Router)
}

extension View {
    
    func withNavigationView(type: NavBarType) -> some View {
        switch type {
        case .title(let title):
            return AnyView(self.modifier(NavigationTitleModifier(title: title)))
        case let .rightButtonsAndTitle(title, buttons):
            return AnyView(self.modifier(NavBarRightButtonModifier(title: title, buttons: buttons)))
        case let .`return`(title, router):
            return AnyView(self.modifier(NavBarBackButtonModifier(title: title, router: router)))
        case let .returnAndRightButton(title, button, router):
            return AnyView(self.modifier(NavBarBackButtonModifier(title: title, router: router, button: button)))
        }
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

struct NavBarRightButtonModifier: ViewModifier {
    
    var title : String
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
                ToolbarItem(placement: .topBarLeading) {
                    Text(title)
                        .font(.wbFont(.subheading1))
                        .padding(.leading, 8)
                }
            }
    }
}

struct NavBarBackButtonModifier: ViewModifier {
    
    let title: String
    let router : Router
    let button : ButtonModel?
    
    init(title: String, router: Router, button: ButtonModel? = nil) {
        self.title = title
        self.router = router
        self.button = button
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        router.back()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text(title)
                        }
                        .foregroundStyle(Color.Neutural.text)
                        .font(.wbFont(.subheading1))
                    }
                }
                if let button {
                    ToolbarItem(placement: .navigationBarTrailing) {
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
