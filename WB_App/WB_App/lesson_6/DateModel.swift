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

