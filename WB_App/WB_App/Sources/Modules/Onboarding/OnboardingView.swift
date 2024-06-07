//
//  OnboardingView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var isSheetPresented = false
    
    var body: some View {
        onboardingImage
        
        VStack {
            textButton
            startButton
        }
        .padding(.bottom, UIConstants.Spacer.toBottom)
    }
}


private extension OnboardingView {
    
    var onboardingImage: some View {
        VStack {
            Spacer()
                .frame(height: UIConstants.Spacer.toTop)
            Image(WBIcons.Image.onboarding)
                .padding(.bottom, UIConstants.Padding.imageBottom)
                .padding(.horizontal, UIConstants.Padding.imageHorizontal)
            Text(WBKeys.Onboarding.title)
                .font(WBFont.heading2.font)
                .multilineTextAlignment(.center)
                .padding(.horizontal, UIConstants.Padding.textHor)
            Spacer()
        }
        .background(Color.white)
    }
    
    var textButton: some View {
        TextLinkButton(text: WBKeys.Onboarding.agreement)
            .padding(.bottom, UIConstants.Padding.textLinkButtonBottom)
    }
    
    var startButton: some View {
        ProceedButton(text: WBKeys.Onboarding.start) {
            isSheetPresented = true
        }
            .sheet(isPresented: $isSheetPresented,
                   onDismiss: {
                print("Sheet was dismissed")
            }, content: {
                TabsView()
            })
    }
    
}

fileprivate enum UIConstants {
    
    enum Spacer {
        static let toTop: CGFloat = 55
        static let toBottom: CGFloat = 20
    }
    
    enum Padding {
        static let imageBottom: CGFloat = 42
        static let imageHorizontal: CGFloat = 55
        
        static let textHor: CGFloat = 50
        
        static let textLinkButtonBottom: CGFloat = 18
    }
}

#Preview {
    OnboardingView()
}
