//
//  StringInterpolation+Extension.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 08.08.2024.
//

import Foundation

extension String.StringInterpolation {
    /// Добавляет в строку дату, отформатированную в соответствии с указанным стилем и локалью
    mutating func appendInterpolation(_ date: Date, locale: Locale = .current, style: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .none) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dateToFormat = calendar.startOfDay(for: date)

        if calendar.isDate(dateToFormat, inSameDayAs: today) {
            appendLiteral("Today")
        } else {
            let formatter = DateFormatter()
            formatter.locale = locale
            formatter.dateStyle = style
            formatter.timeStyle = timeStyle
            let formatterDate = formatter.string(from: date)
            appendLiteral(formatterDate)
        }
    }
}
