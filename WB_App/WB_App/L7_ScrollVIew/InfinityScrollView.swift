//
//  InfinityScrollView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 28.06.2024.
//

import SwiftUI

// Кастомный ScrollView с поддержкой бесконечного скролла
// Хотелось поиграться понять как оно все тут работает при использовании дженериков
struct InfiniteScrollView<Content: View, Data: CellDataProvider>: View {
    
    @State private var items: [Data] = []
    
    let content: (Data) -> Content
    let configurationModel: () -> Data
    
    private let column = [GridItem(.adaptive(minimum: .greatestFiniteMagnitude/2, 
                                             maximum: .greatestFiniteMagnitude))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column) {
                ForEach(items, id: \.id) { item in
                    content(item)
                        .padding()
                        .onAppear {
                            withAnimation {
                                appendItems(item: item)
                            }
                        }
                }
            }
            .onAppear(perform: {
                withAnimation {
                    onAppear()
                }
            })
        }
        .scrollIndicators(.hidden)
    }

    private func appendItems(item: Data) {
        if items.last?.id == item.id {
            items.append(configurationModel())
        }
    }
    private func onAppear() {
        items.append(configurationModel())
    }
}

#Preview {
    InfiniteScrollView { data in
        ComplexLayoutCell(data: data, layout: .random())
    } configurationModel: {
        CellData()
    }

}
