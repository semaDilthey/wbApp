//
//  VerificationCodeScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.07.2024.
//

import SwiftUI

struct VerificationCodeScreen: View {
    
    @State var model = VerificationModel()
    @State var isFullfilled : Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            guideText
            otpFieldView
            Spacer()
        }
        .contentShape(Rectangle())
        .resignFirstResponder()
        .alert("Success", isPresented: $isFullfilled) {} message: { Text("Your code was succeeded") }
        .task {
            await generateCode()
        }
        .onChange(of: model.enteredCode, perform: { newValue in
            validateCode(for: newValue)
        })
    }
}

extension VerificationCodeScreen {
    
    // GUIDE TEXT
    var guideText: some View {
        VerificationGuideText(headingText: WBKeys.Verification.guideHeading,
                              bodyText: WBKeys.Verification.guideBody + "\n" + model.phoneNumber)
        .padding(.top, UI.guideText.top)
        .padding(.horizontal, UI.textHorOffset)
        .padding(.bottom, UI.guideText.bottom)
    }
    
    // View, отображающий 4 ячейки для OTP
    var otpFieldView: some View {
        OtpFormFieldView(values: $model.enteredCode)
        .padding(.horizontal, 68)
        .padding()
    }
    
    /// Провереряет, что введеный код == тому коду, который пришел на телефон (в нашем случае вывелся в принт). В случе true меняет стейт isFullfilled
    /// - Parameter value: каждое новое значения текстфилда
    private func validateCode(for value: [String]) {
        isFullfilled = value == model.code
    }
    
    /// Генерация кода при отображении нашего вью в onAppear, идет с задержкой 3сек имитуруя работу сети
    private func generateCode() async {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            model.generateCode()
        } catch {
            print("Cant generate code")
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
