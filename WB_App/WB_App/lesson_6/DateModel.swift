//
//  DateModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 26.06.2024.
//

import Foundation

protocol DateInterporarable {
    var selectedDate: Date { get set }
    var selectedLocale: Locale { get set }
    var isSpellingOut: Bool { get set }
}

extension DateInterporarable {
    
    func getDates() -> [String] {
        return RelativeDay.allCases.map { relativeDay in
            let calculatedDate = Calendar.current.date(byAdding: .day, 
                                                       value: relativeDay.rawValue,
                                                       to: selectedDate)!
            if isSpellingOut {
                return "\(relativeDay.description(locale: selectedLocale)): \n\(spellOut: calculatedDate, locale: selectedLocale)"
            } else {
                return "\(relativeDay.description(locale: selectedLocale)): \n\(calculatedDate, locale: selectedLocale, style: .long, timeStyle: .short)"
            }
        }
    }
}

struct DateModel: DateInterporarable {
    var selectedDate: Date
    var selectedLocale: Locale
    var isSpellingOut: Bool
    
    init(selectedDate: Date = Date(), 
         selectedLocale: Locale = Language.ru.locale,
         isSpellingOut: Bool = false
    ){
        self.selectedDate = selectedDate
        self.selectedLocale = selectedLocale
        self.isSpellingOut = isSpellingOut
    }
}

