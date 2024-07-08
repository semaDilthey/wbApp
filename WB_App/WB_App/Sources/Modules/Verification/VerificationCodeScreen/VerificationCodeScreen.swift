//
//  VerificationCodeScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.07.2024.
//

import SwiftUI

struct VerificationCodeScreen: View {
    
    var phoneNumber: String
    
    var body: some View {
            VStack(alignment: .center) {
                guideText
                OtpFormFieldView()
                .padding(.horizontal, 68)
                .padding()
                Spacer()
            }
            .contentShape(Rectangle())
            .resignFirstResponder()
        }
}

extension VerificationCodeScreen {
    
    var guideText: some View {
        VerificationGuideText(headingText: WBKeys.Verification.guideHeading,
                              bodyText: WBKeys.Verification.guideBody + "\n" + phoneNumber)
        .padding(.top, UI.guideText.top)
        .padding(.horizontal, UI.textHorOffset)
        .padding(.bottom, UI.guideText.bottom)
    }

}


fileprivate enum UI {
    static let textHorOffset: CGFloat = 42
    static let textFieldOffset: CGFloat = 24
    static let buttonBottomOffset: CGFloat = 60
    
    static let guideText : (top: CGFloat, bottom: CGFloat) = (99, 49)
    static let phoneText : CGFloat = 69
}

#Preview {
    VerificationCodeScreen(phoneNumber: "+79676155522")
}
