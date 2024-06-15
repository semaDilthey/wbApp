//
//  ProfileImage.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import SwiftUI

struct ProfileImage : View {
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.Neutural.secondaryBG)
                .padding(.horizontal, UIConst.circlePadding)
            Image(WBIcons.Profile.user)
        }
    }
}

extension ProfileImage {
    
    private enum UIConst {
        static let circlePadding: CGFloat = 86
    }
}


#Preview {
    ProfileImage()
}
