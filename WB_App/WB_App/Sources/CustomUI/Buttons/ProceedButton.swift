//
//  ProceedButton.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ProceedButton: View {
        
    @Binding var isProceeding : Bool
    var title: String
    var action: () async -> Void

    var body: some View {
        Button {
            buttonPressed()
        } label: {
            buttonBody
        }
        .allowsHitTesting(isProceeding ? false : true)
        .buttonStyle(ScaleButtonStyle())
    }
    
    init(isProceeding: Binding<Bool>? = nil,
         title: String,
         action: @escaping () -> Void)
    {
        self._isProceeding = (isProceeding != nil) ? isProceeding! : .constant(false)
        self.title = title
        self.action = action
    }
    
    private func buttonPressed() {
        
        Task {
            await action()
        }
    }
}

extension ProceedButton {
    
    var buttonBody: some View {
        ZStack {
            RoundedRectangle(cornerRadius: UIConstants.radius)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding()
                .foregroundStyle(!isProceeding ? Color.Brand.default : Color.Brand.default.opacity(0.5))
            
            switch isProceeding {
            case true:
                ProgressView()
                    .progressViewStyle(.circular)
            case false:
                Text(title)
                    .font(.wbFont(.subheading2))
                    .foregroundColor(.white)
            }
        }
    }
}

fileprivate enum UIConstants {
    static let radius: CGFloat = 30
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
