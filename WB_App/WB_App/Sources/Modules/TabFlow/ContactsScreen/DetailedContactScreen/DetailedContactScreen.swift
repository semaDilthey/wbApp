//
//  DetailedContactScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import SwiftUI

struct DetailedContactScreen: View {
    
    @EnvironmentObject var router: Router<ContactsRoute>
    @Binding var animationDTO : ContactsTransitionDTO

    var body: some View {
        if let selectedContact = animationDTO.selectedContact {
            VStack {
                backNavBarButton()
                Spacer().frame(height: 50)

                GeometryReader { geometry in
                    let size = geometry.size

                    VStack {
                        if animationDTO.hideView.0 {
                            ContactDetailsView(contact: selectedContact, size: size)
                                .opacity(animationDTO.hideView.1 ? 1 : 0)
                                .animation(.snappy, value: animationDTO.hideView.1)
                        } else {
                            Color.clear
                        }
                    }
                    .onAppear {
                        withAnimation(.linear(duration: 0.35)) {
                            animationDTO.hideView.1 = true
                        }
                    }
                    .anchorPreference(key: MAnchoerKey.self, value: .bounds) { anchor in
                        [selectedContact.id: anchor]
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    animationDTO.hideView.0 = true
                }
            }
        }
    }

    private func backNavBarButton() -> some View {
        ZStack {
            Button(action: {
                
                animationDTO.hideView.0 = false
                animationDTO.hideView.1 = false
                animationDTO.pushView = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    animationDTO.selectedContact = nil
                }
                router.pop()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .padding(10)
                    Text("Contacts")
                        .font(.wbFont(.subheading1))
                }
                .foregroundStyle(Color.Neutural.text)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func ContactDetailsView(contact: Contact, size: CGSize) -> some View {
        VStack {
            ContactPhoto(contact: contact, size: size)
            Spacer().frame(height: 20)
            fullName(name: contact.name, surname: contact.surname)
            phoneNumber(number: "+7 999 999-99-99")
            Spacer().frame(height: 40)
            socialNetworks
            Spacer()
        }
    }

    private func fullName(name: String, surname: String) -> Text {
        Text(name + " " + surname)
            .font(.wbFont(.heading2))
    }

    private func phoneNumber(number: String) -> Text {
        Text(number)
            .font(.wbFont(.body2))
            .foregroundColor(Color.Neutural.secondaryText)
    }

    private var socialNetworks: some View {
        HStack(alignment: .center) {
            ForEach(SocialNetworks.allCases, id: \.self) { network in
                SocialNetworkView(networkType: network) {
                    print(network.icon)
                }
                .frame(height: 40)
                Spacer().frame(width: 12)
            }
        }
        .padding(.horizontal, 26)
    }
}

//#Preview {
//    DetailedContactScreen(contact: Contact.makeMock())
//}



