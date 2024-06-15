//
//  DetailedContactScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import SwiftUI

struct DetailedContactScreen: View {
    
    var fullName : (String, String)
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            ProfileImage()
            Spacer()
                .frame(height: 20)
            fullName(name: fullName.0, surname: fullName.1)
            phoneNumber(number: "+7 999 999-99-99")
            Spacer()
                .frame(height: 40)
            socitalNetworks
            Spacer()
        }
    }
}

extension View {
    
    func fullName(name: String, surname: String) -> Text {
        return Text(name + " " + surname)
            .font(.wbFont(.heading2))
    }
    
    func phoneNumber(number: String) -> Text {
        return Text(number)
            .font(.wbFont(.body2))
            .foregroundColor(Color.Neutural.secondaryText)
    }
    
    var socitalNetworks : some View {
        HStack(alignment: .center) {
            ForEach(SocialNetworks.allCases, id: \.self) { network in
                SocialNetworkView(networkType: network) {
                    print(network.icon)
                }
                    .frame(height: 40)
                Spacer()
                    .frame(width: 12)
            }
        }
        .padding(.horizontal,26)
    }
}

#Preview {
    DetailedContactScreen(fullName: ("Иван", "Иванов"))
}



