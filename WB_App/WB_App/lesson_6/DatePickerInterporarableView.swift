//
//  DatePickerInterporarable.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 24.06.2024.
//

import SwiftUI

struct DatePickerInterporarableView: View {
        
    @State var dateModel : DateInterporarable = DateModel()

    var body: some View {
        VStack {
            header
            datePicker
            langPicker
            spellingOutToggle
            datesTextList(dates: dateModel.getDates())
        }
        .font(.wbFont(.body1))
    }
}

extension DatePickerInterporarableView {
    
    var header : some View {
        Text(headerText)
            .font(.wbFont(.subheading1))
            .foregroundStyle(Color.Brand.default)
            .padding(.vertical)
    }
    
    var datePicker : some View {
        DatePicker(datePickerText, selection: $dateModel.selectedDate, displayedComponents: [.date])
            .datePickerStyle(.compact)
            .tint(.Brand.default)
            .padding(.horizontal)
    }
    
    var langPicker : some View {
        Picker(languagePickerText, selection: $dateModel.selectedLocale) {
            ForEach(0..<Language.allCases.count, id: \.self) { tabIndex in
                Text(Language.allCases[tabIndex].flag).tag(Language.allCases[tabIndex].locale)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    var spellingOutToggle : some View {
        Toggle(toggleText, isOn: $dateModel.isSpellingOut)
            .foregroundStyle(Color.Brand.default)
            .tint(dateModel.isSpellingOut ? .Brand.default : .gray)
            .padding(.horizontal)
    }
    
    func datesTextList(dates: [String]) -> some View {
          List {
              ForEach(dates, id: \.self) { dateText in
                  Text(dateText)
                      .font(dateText.contains(RelativeDay.today.description(locale: dateModel.selectedLocale)) ? .subheadline.bold() : .subheadline)

              }
          }
          .scrollDisabled(true)
          .listStyle(.plain)
          .font(.subheadline)
    }
}

fileprivate extension DatePickerInterporarableView {
    var headerText : String { "\(date: dateModel.selectedDate, locale: dateModel.selectedLocale)" }
    var datePickerText : String { "Select date" }
    var languagePickerText : String { "Language" }
    var toggleText : String { "Turn on spelling out" }
}

#Preview {
    DatePickerInterporarableView()
}
