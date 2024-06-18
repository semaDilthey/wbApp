//
//  SocialNetworkView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import SwiftUI


struct SocialNetworkView : View {
    
    var networkType: SocialNetworks
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            label
        }
    }
    
    var label : some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: UIConsts.radius)
                .strokeBorder(Color.Brand.default, lineWidth: UIConsts.borderWidth)
                .background(Color.clear)
            Image(networkType.icon)
                .foregroundStyle(Color.Brand.default)
            
        }
    }
}

fileprivate enum UIConsts {
    static let radius: CGFloat = 25
    static let borderWidth: CGFloat = 1.67
}


#Preview {
    SocialNetworkView(networkType: .instagram, action: {})
}
