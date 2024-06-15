//
//  ContactsListScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ContactsListScreen: View {
    
    @State var searchText = ""
    @StateObject private var viewModel : ContactsListViewModel
    
    init(viewModel: ContactsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
         VStack {
             searchView
             listView
         }
     }
    
}

extension ContactsListScreen {
    
    var searchView : some View {
        SearchView(contactSearch: $searchText)
            .padding(.horizontal, 16)
    }
    
    var listView : some View {
        List {
            ForEach(viewModel.getContacts(), id: \.self) { contact in
                ContactRow(contact: contact)
                    .onTapGesture {
                            viewModel.presentContactDetails(contact)
                    }
                    .transition(.iris)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .font(.wbFont(.body1))
    }
}

#Preview {
    ContactsListScreen(viewModel: ContactsListViewModel(router: Router.shared))
}

