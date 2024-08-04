//
//  VerificationGuideText.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 04.07.2024.
//

import SwiftUI

struct VerificationGuideText: View {
    let headingText : String
    let bodyText : String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(headingText)
                .font(.wbFont(.heading2))
            Text(bodyText)
                .font(.wbFont(.body2))
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    VerificationGuideText(headingText: "123", bodyText: "456")
}
