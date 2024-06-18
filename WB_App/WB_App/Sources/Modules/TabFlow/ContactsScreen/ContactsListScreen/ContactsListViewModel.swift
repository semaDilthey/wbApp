//
//  ContactsListViewModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import SwiftUI

protocol IContactsListViewModel: ObservableObject {
    func presentContactDetails(_ contact: Contact)
    func getContacts() -> [Contact]
    func onAppear()
}

final class ContactsListViewModel {
    
//    var router : Router
    
    @Published private var contacts : [Contact] = .init()
    
    init(/*router: Router*/) {
//        self.router = router
        makeMockContacts()
    }
}

extension ContactsListViewModel : IContactsListViewModel {
    
    func presentContactDetails(_ contact: Contact) {
//        router.navigateTo(.contactDetails(contact))
    }
    
    func getContacts() -> [Contact] {
        return contacts
    }
    
    func onAppear() {
        makeMockContacts()
    }
    
}

extension ContactsListViewModel {
    
    private func makeMockContacts() {
        contacts = [
            Contact.makeMock(),
            Contact.makeMock(),
            Contact.makeMock(),
            Contact.makeMock(),
            Contact.makeMock(),
            Contact.makeMock(),
        ]
    }
}

