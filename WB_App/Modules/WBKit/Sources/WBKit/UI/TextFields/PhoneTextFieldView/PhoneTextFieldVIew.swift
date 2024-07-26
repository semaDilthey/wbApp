//
//  SwiftUIView.swift
//  
//
//  Created by Семен Гайдамакин on 21.07.2024.
//

import SwiftUI

public struct PhoneTextFieldView: View {

    @Binding var selectedCountry: Country
    @Binding var phoneNumber : String

    public init(selectedCountry: Binding<Country>, phoneNumber: Binding<String>) {
        self._selectedCountry = selectedCountry
        self._phoneNumber = phoneNumber
    }
    
    public var body: some View {
        HStack {
            CountryCodePicker(selectedCountry: $selectedCountry)
            WBTextField(placeholder: selectedCountry.mask, text: $phoneNumber)
        }
    }
}

fileprivate struct CountryCodePicker: View {

    @Binding var selectedCountry: Country

    var body: some View {
        Menu {
            Picker("Select country", selection: $selectedCountry) {
                ForEach(0..<Country.allCases.count, id: \.self) { countryIndex in
                    Text(Country.allCases[countryIndex].rawValue)
                        .tag(Country.allCases[countryIndex])
                }
            }
            .pickerStyle(.inline)
        } label: {
            menuLabel
        }
    }

    var menuLabel: some View {
        HStack {
            Text(selectedCountry.flag)
            Text(selectedCountry.code)
                .font(.wbFont(.body1))
                .foregroundStyle(Color.Neutural.disabled)
        }
        .padding(UI.menuLabel.padding)
        .background(Color.Neutural.secondaryBG)
        .clipShape(.rect(cornerRadius: UI.menuLabel.radius))
    }
}

fileprivate enum UI {
    static let menuLabel : (padding: CGFloat, radius: CGFloat) = (9.5, 4)
}
