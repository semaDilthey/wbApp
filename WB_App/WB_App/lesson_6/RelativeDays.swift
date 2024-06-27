//
//  RelativeDays.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 24.06.2024.
//

import Foundation

enum RelativeDay: Int, CaseIterable {
    // using rawValue for calculating calendar dates
    case dayBeforeYesterday = -2
    case yesterday = -1
    case today = 0
    case tomorrow = 1
    case dayAfterTomorrow = 2
    
    func description(locale: Locale) -> String {
        return strings[Language(locale: locale)] ?? ""
    }
    
    private var strings: [Language: String] {
        switch self {
        case .today:
            return [.ru: "Сегодня", .us: "Today", .it: "Oggi", .de: "Heute", .cn: "今天"]
        case .tomorrow:
            return [.ru: "Завтра", .us: "Tomorrow", .it: "Domani", .de: "Morgen", .cn: "明天"]
        case .dayAfterTomorrow:
            return [.ru: "Послезавтра", .us: "The day after tomorrow", .it: "Dopodomani", .de: "Übermorgen", .cn: "后天"]
        case .dayBeforeYesterday:
            return [.ru: "Позавчера", .us: "The day before yesterday", .it: "L'altro ieri", .de: "Vorgestern", .cn: "前天"]
        case .yesterday:
            return [.ru: "Вчера", .us: "Yesterday", .it: "Ieri", .de: "Gestern", .cn: "昨天"]
        }
    }
}

extension RelativeDay {
    
    static func getDates(model: DateInterporarable) -> [String] {
        return RelativeDay.allCases.map { relativeDay in
            let calculatedDate = Calendar.current.date(byAdding: .day,
                                                       value: relativeDay.rawValue,
                                                       to: model.selectedDate)!
            if model.isSpellingOut {
                return "\(relativeDay.description(locale: model.selectedLocale))): \n\(spellOut: model.selectedDate, locale: model.selectedLocale)"
            } else {
                return "\(relativeDay.description(locale: model.selectedLocale))): \n\(calculatedDate, locale: model.selectedLocale, style: .long, timeStyle: .short)"
            }
        }
    }
}


