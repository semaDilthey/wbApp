//
//  PhoneTextFieldView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 04.07.2024.
//

import SwiftUI

struct PhoneTextFieldView: View {

    @Binding var selectedCountry: Country

    var body: some View {
        HStack {
            CountryCodePicker(selectedCountry: $selectedCountry)
            WBTextField(placeholder: selectedCountry.mask)
        }
    }
}

fileprivate struct CountryCodePicker: View {

    @Binding var selectedCountry: Country

    var body: some View {
        Menu {
            Picker("Select country", selection: $selectedCountry) {
                ForEach(0..<Country.allCases.count, id: \.self) { countryIndex in
                    Text(Country.allCases[countryIndex].rawValue).tag(Country.allCases[countryIndex])
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
            Text(selectedCountry.prefix)
                .font(.wbFont(.body1))
                .foregroundStyle(Color.Neutural.disabled)
        }
        .padding(9.5)
        .background(Color.Neutural.secondaryBG)
        .clipShape(.rect(cornerRadius: 4))
    }
}
