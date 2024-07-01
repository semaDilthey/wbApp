//
//  ComplexLayoutCell.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 28.06.2024.
//

import SwiftUI

struct ComplexLayoutCell: View {
    var data: CellDataProvider
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<3) { index in
                    roundedRectContent
                }
                .padding(.bottom, 10)
            }

        }
        .padding()
    }
}

extension ComplexLayoutCell {
    
    var roundedRectContent : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                .background(Color.clear)
            Text(data.emoji)
                .font(.largeTitle)
                .opacity(0.5)
        }
    }
}


//struct RectanglesLayout : Layout {
//    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
//        <#code#>
//    }
//    
//    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
//        <#code#>
//    }
//    
//
//}

struct CustomGridLayout: Layout {
    var columns: Int
    var spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var totalWidth: CGFloat = 0
        var maxHeight: CGFloat = 0

        var currentRowWidth: CGFloat = 0
        var currentRowHeight: CGFloat = 0

        for subview in subviews {
            let subviewSize = subview.sizeThatFits(proposal)

            if currentRowWidth + subviewSize.width + spacing > proposal.width! {
                totalWidth = max(totalWidth, currentRowWidth)
                maxHeight += currentRowHeight
                currentRowWidth = 0
                currentRowHeight = subviewSize.height
            }

            currentRowWidth += subviewSize.width + spacing
            currentRowHeight = max(currentRowHeight, subviewSize.height)
        }

        totalWidth = max(totalWidth, currentRowWidth)
        maxHeight += currentRowHeight

        return CGSize(width: totalWidth, height: maxHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var rects: [CGRect] = []

        for subview in subviews {
            let subviewSize = subview.sizeThatFits(proposal)

            var rect = CGRect.zero

            repeat {
                let x = CGFloat.random(in: bounds.minX...bounds.maxX - subviewSize.width)
                let y = CGFloat.random(in: bounds.minY...bounds.maxY - subviewSize.height)

                rect = CGRect(x: x, y: y, width: subviewSize.width, height: subviewSize.height)
            } while rects.contains(where: { $0.intersects(rect) })

            rects.append(rect)

            subview.place(at: rect.origin, anchor: .topLeading, proposal: proposal)
        }
    }
}

struct CustomGrid<Content: View>: View {
    let columns: Int
    let spacing: CGFloat
    let content: () -> Content

    init(columns: Int = 3, spacing: CGFloat = 10, @ViewBuilder content: @escaping () -> Content) {
        self.columns = columns
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        CustomGridLayout(columns: columns, spacing: spacing) {
            content()
        }
    }
}
