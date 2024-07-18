//
//  Color+Extension.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 12.06.2024.
//

import SwiftUI

enum ColorGradient {
    case variant1, variant2, clear
    
    var value : (Color, Color) {
        let start: Color
        let end: Color
        switch self {
        case .variant1:
            start = Color(red: 210/255, green: 213/255, blue: 249/255, opacity: 1)
            end = Color(red: 44/255, green: 55/255, blue: 255/255, opacity: 1)
        case .variant2:
            start = Color(red: 236/255, green: 158/255, blue: 255/255, opacity: 1)
            end = Color(red: 95/255, green: 46/255, blue: 234/255, opacity: 1)
        case .clear:
            start = Color.clear
            end = Color.clear
        }
        return (start, end)
    }
}

extension Color {
    
    static func gradient(_ gradient: ColorGradient) -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [gradient.value.0, gradient.value.1]),
            startPoint: .top,
            endPoint: .bottom)
    }
    
}
