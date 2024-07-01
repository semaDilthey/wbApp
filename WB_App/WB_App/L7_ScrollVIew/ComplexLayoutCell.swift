//
//  ComplexLayoutCell.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 28.06.2024.
//

import SwiftUI

enum LayoutType: CaseIterable {
    
    case equal, mirrored, mixed, compressed
    
    static func random() -> Self {
        LayoutType.allCases.randomElement()!
    }
    
}

struct ComplexLayoutCell: View {
    
    var data: CellDataProvider
    var layout : LayoutType
    
    var body: some View {
        switch layout {
        case .equal:
            equalLayout
        case .mirrored:
            mirroredLayout
        case .mixed:
            mixedLayout
        case .compressed:
            compressedLayout
        }
    }
    
    var equalLayout: some View {
        HStack {
            VStack {
                roundedRectContent
                roundedRectContent
            }
            roundedRectContent
        }
    }
    
    var mirroredLayout: some View {
        VStack {
            roundedRectContent
            HStack {
                roundedRectContent
                roundedRectContent
            }
        }
    }
    
    var mixedLayout: some View {
        VStack {
            HStack {
                roundedRectContent
                roundedRectContent
            }
            roundedRectContent
        }
    }
    
    var compressedLayout: some View {
        HStack {
            VStack {
                roundedRectContent
                roundedRectContent
            }
            roundedRectContent
        }
    }
}

extension ComplexLayoutCell {
    
    var roundedRectContent : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                .background(Color.clear)
            Text(data.emoji)
                .padding()
                .font(.largeTitle)
                .opacity(0.5)
        }
    }
}
