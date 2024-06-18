//
//  ContactsTransitionAnimation.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 18.06.2024.
//

import SwiftUI

enum ContactsTransitionType {
    case first
    case second
}
struct ContactsTransitionAnimation: ViewModifier {
    
    var type : ContactsTransitionType
    var contactsDTO : ContactsTransitionDTO
    var data : [Contact]
    
    func body(content: Content) -> some View {
        content
            .overlayPreferenceValue(MAnchoerKey.self, { value in
                if type == .first {
                    GeometryReader(content: { geometry in
                        if let selectedContact = contactsDTO.selectedContact,
                           let anchor = value[selectedContact.id],
                           !contactsDTO.hideView.0 {
                            let rect = geometry[anchor]
                            ContactPhoto(contact: selectedContact, size: rect.size)
                                .offset(x: rect.minX, y: rect.minY)
                                .animation(.snappy(duration: 0.35, extraBounce: 0), value: rect)
                        }
                    })
                } else if type == .second {
                    GeometryReader(content: { geometry in
                        ForEach(data) { contact in
                            if let anchor = value[contact.id],
                               contactsDTO.selectedContact?.id != contact.id {
                                let rect = geometry[anchor]
                                ContactPhoto(contact: contact, size: rect.size)
                                    .offset(x: rect.minX, y: rect.minY)
                                    .allowsHitTesting(false)
                            }
                        }
                    })
                }
            }
        )
    }
}


extension View {
    
    func setContactsTransition(DTO: ContactsTransitionDTO, type: ContactsTransitionType, data: [Contact]? = nil) -> some View {
        self.modifier(ContactsTransitionAnimation(type: type, contactsDTO: DTO, data: data ?? []))
    }
}
