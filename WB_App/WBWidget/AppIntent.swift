//
//  AppIntent.swift
//  WBWidget
//
//  Created by Семен Гайдамакин on 20.06.2024.
//

import WidgetKit
import AppIntents

struct WBIntent : AppIntent {
    static var title: LocalizedStringResource = "Кнопочка"
    static var description: IntentDescription? = IntentDescription("Обработка нажатия и создание интерактива")
        
    func perform() async throws -> some IntentResult {
        return .result()
    }
}

extension WBIntent : WidgetConfigurationIntent {}
