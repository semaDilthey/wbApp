//
//  InfinityScrollView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 28.06.2024.
//

import SwiftUI

// Кастомный ScrollView с поддержкой бесконечного скролла
struct InfiniteScrollView<Content: View, Data: CellDataProvider>: View {
    @State private var items: [Data] = []
    let content: (Data) -> Content
    let dataForCell: () -> Data
    
    private let column = [GridItem(.adaptive(minimum: .greatestFiniteMagnitude/2, 
                                             maximum: .greatestFiniteMagnitude))
                        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column) {
                ForEach(items, id: \.id) { item in
                    content(item)
                        .onAppear {
                           appendItems(item: item)
                        }
                }
            }
            .onAppear(perform: onAppear)
        }
        .scrollIndicators(.hidden)
    }

    private func appendItems(item: Data) {
        if items.last?.id == item.id {
            items.append(dataForCell())
        }
    }
    private func onAppear() {
        items.append(dataForCell())
    }
}

#Preview {
    InfiniteScrollView { data in
        ComplexLayoutCell(data: data)
    } dataForCell: {
        CellData()
    }

}

//
//struct IninityCellModel {
//    var id = UUID()
//    var emoji : String
//    
//    init() {
//        let emojiRange = 0x1F300...0x1F3F0
//        emoji = String(UnicodeScalar(Array(emojiRange).randomElement()!)!)
//    }
//}
//
//struct ComplexLayoutCell: View {
//    var model: IninityCellModel
//    
//    var body: some View {
//        ZStack {
//            
//        }
//    }
//    
//    
//}
