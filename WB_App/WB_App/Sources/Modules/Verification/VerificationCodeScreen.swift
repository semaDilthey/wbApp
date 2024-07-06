//
//  VerificationCodeScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.07.2024.
//

import SwiftUI

struct VerificationCodeScreen: View {
    
    @State var selectedCountry: Country = Country.ru
    @State var isProceeding = false
    
    @State var digit : String = ""

    var body: some View {
            VStack(alignment: .center) {
                guideText
                DigicCell(digit: $digit)
                Spacer()
                continueButton
            }
            .contentShape(Rectangle())
            .resignFirstResponder()
        }
}

extension VerificationCodeScreen {
    
    var guideText: some View {
        VerificationGuideText(headingText: WBKeys.Verification.guideHeading,
                              bodyText: WBKeys.Verification.guideBody)
        .padding(.top, UI.guideText.top)
        .padding(.horizontal, UI.textHorOffset)
        .padding(.bottom, UI.guideText.bottom)
    }
    
    var continueButton: some View {
        ProceedButton(isProceeding: $isProceeding,
                      title: WBKeys.Action.continue) {
//            tappedSaveButton()
        }
            .padding(.bottom, UI.buttonBottomOffset)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct DigicCell: View {
    
    @Binding var digit : String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.Neutural.secondaryBG)
            TextField("", text: $digit)
                .font(.wbFont(.heading1))
        }
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
    VerificationCodeScreen()
}
