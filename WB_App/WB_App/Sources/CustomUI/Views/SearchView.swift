//
//  SearchView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 12.06.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var contactSearch: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.Neutural.disabled)
            TextField("",
                      text: $contactSearch,
                      prompt: Text("Search")
                .foregroundColor(Color.Neutural.disabled))
        }
        .bold()
        .padding(.vertical, 6)
        .padding(.leading, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(Color.Neutural.secondaryBG))
    }
}
