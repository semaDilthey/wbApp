//
//  SwiftUIView.swift
//  
//
//  Created by Семен Гайдамакин on 21.07.2024.
//

import SwiftUI

public struct VerificationGuideText: View {
    let headingText : String
    let bodyText : String
    
    public init(headingText: String, bodyText: String) {
        self.headingText = headingText
        self.bodyText = bodyText
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Text(headingText)
                .font(.wbFont(.heading2))
            Text(bodyText)
                .font(.wbFont(.body2))
        }
        .multilineTextAlignment(.center)
    }
}
