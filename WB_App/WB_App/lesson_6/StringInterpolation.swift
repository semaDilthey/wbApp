//
//  StringInterpolation.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 24.06.2024.
//

import Foundation

extension String.StringInterpolation {
    /// Добавляет в строку дату, отформатированную в соответствии с указанным стилем и локалью
    mutating func appendInterpolation(_ date: Date, locale: Locale, style: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = style
        formatter.timeStyle = timeStyle
        let formatterDate = formatter.string(from: date)
        appendLiteral(formatterDate)
    }
}

extension String.StringInterpolation {
    ///// Добавляет в строку дату, записанную прописью, в соответствии с указанной локалью
    mutating func appendInterpolation(spellOut date: Date, locale: Locale) {
       let calendar = Calendar.current
       let components = calendar.dateComponents([.day, .month, .year, .hour, .minute], from: date)

       let formatter = NumberFormatter()
       formatter.locale = locale
       formatter.numberStyle = .spellOut

       guard let day = components.day,
             let month = components.month,
             let year = components.year,
             let hour = components.hour,
             let minute = components.minute 
        else {
           appendLiteral("No date")
           return
       }

       let dateFormatter = DateFormatter()
       dateFormatter.locale = locale
       let monthString = dateFormatter.monthSymbols[month - 1]

       let dayString = "\(day)"
       let yearString = yearStringForLocale(year, locale: locale, formatter: formatter)
       let hourString = formatter.string(from: NSNumber(value: hour)) ?? "\(hour)"
       let minuteString = formatter.string(from: NSNumber(value: minute)) ?? "\(minute)"

       let formattedDate = "\(dayString) \(monthString) \(yearString) в \(hourString) \(minuteString)"
       appendLiteral(formattedDate)
   }
}

extension String.StringInterpolation {
    /// Интерполяция для хэдера
    mutating func appendInterpolation(date: Date, locale: Locale) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        
        guard let day = components.day,
              let month = components.month,
              let year = components.year
        else {
            appendLiteral("No date")
            return
        }
        let formatter = NumberFormatter()
        formatter.locale = locale
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        let monthString = dateFormatter.monthSymbols[month - 1]
        
        let dayString = "\(day)"
        let yearString = yearStringForLocale(year, locale: locale, formatter: formatter)
        
        let formattedDate = "\(dayString) \(monthString) \(yearString)"
        appendLiteral(formattedDate)
    }
}


//Возвращает строку с годом, записанным прописью, в соответствии с указанной локалью
fileprivate func yearStringForLocale(_ year: Int, locale: Locale, formatter: NumberFormatter) -> String {
   let yearString = formatter.string(from: NSNumber(value: year)) ?? "\(year)"
   switch locale.identifier {
   case "ru_RU":
       return "\(yearString) года"
   default:
       return yearString
   }
}
