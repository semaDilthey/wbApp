//
//  EnterPhoneNumberScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 04.07.2024.
//

import SwiftUI

struct EnterPhoneNumberScreen: View {

    @State var selectedCountry: Country = Country.ru
    @State var isProceeding = false
    
    var body: some View {
            VStack(alignment: .center) {
                guideText
                phoneTextField
                Spacer()
                continueButton
            }
            .contentShape(Rectangle())
            .resignFirstResponder()
        }
}

//MARK: - UI Elements
extension EnterPhoneNumberScreen {
    
    var guideText: some View {
        VerificationGuideText(headingText: "Введите номер телефона",
                              bodyText: "Мы вышлем код подтверждения на указанный номер")
        .layoutPriority(999)
        .padding(.top, 99)
        .padding(.horizontal, UI.textHorOffset)
        .padding(.bottom, 49)
    }
    
    var phoneTextField: some View {
        PhoneTextFieldView(selectedCountry: $selectedCountry)
        .padding(.horizontal, UI.textFieldOffset)
        .padding(.bottom, 69)
    }
    
    var continueButton: some View {
        ProceedButton(isProceeding: $isProceeding,
                      title: .saveButtonText) {
            tappedSaveButton()
        }
            .padding(.bottom, UI.buttonBottomOffset)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

//MARK: - Private methods
extension EnterPhoneNumberScreen {
    
    private func tappedSaveButton() {
        withAnimation {
            isProceeding = true
        }
        Task {
            await imitateNetworkRequest()
        }
    }
    
    private func imitateNetworkRequest() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        withAnimation {
            isProceeding = false
        }
    }
}

fileprivate enum UI {
    static let textHorOffset: CGFloat = 42
    static let textFieldOffset: CGFloat = 24
    static let buttonBottomOffset: CGFloat = 60
}

fileprivate extension String {
    static let saveButtonText = "continue".localized
}

#Preview {
    EnterPhoneNumberScreen()
}
