//
//  ContactsListScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import SwiftUI

struct ContactsListScreen: View {
    
    @EnvironmentObject var router: Router<ContactsRoute>
    @StateObject private var viewModel : ContactsListViewModel = ContactsListViewModel()

    @State var searchText = ""
    
    @Binding var animationDTO : ContactsTransitionDTO
    
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
                Button(action: {
                    animationDTO.selectedContact = contact
                    animationDTO.pushView.toggle()
                    router.push(.contactPreview)
                }, label: {
                    ContactRow(contact: contact)
                })

            }
            .listRowSeparator(.hidden)
        }
        .setContactsTransition(DTO: animationDTO, type: .second, data: viewModel.getContacts())
        .listStyle(.plain)
        .font(.wbFont(.body1))
    }
}

