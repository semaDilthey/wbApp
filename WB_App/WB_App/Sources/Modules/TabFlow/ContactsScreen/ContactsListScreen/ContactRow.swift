//
//  ContactRow.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                ContactPhoto(contact: contact)
                Spacer()
                    .frame(width: C.Offset.medium)
                VStack(alignment: .leading) {
                    Text(contact.name + " " + contact.surname)
                        .font(.wbFont(.body1))
                    Spacer()
                        .frame(height: C.Offset.small)
                    Text(statusText(contact.status))
                        .font(.wbFont(.metadata1))
                    }
                Spacer()
                }
            .contentShape(.rect)
            .padding(.bottom, 8)
            Divider()
        }
    }
}


extension ContactRow {
    func statusText(_ status: Status) -> String {
        switch status {
        case .online:
            return WBKeys.Status.online
        case .offline(let lastOnline):
            return lastOnline
        }
    }
}

#Preview {
    ContactRow(contact: Contact.makeMock())
}
