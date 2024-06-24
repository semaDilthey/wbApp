//
//  WBWidget.swift
//  WBWidget
//
//  Created by Семен Гайдамакин on 20.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
//    let storage : UserDatabase = .init()
    let responder = WidgetResponder.shared
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), result: responder.result())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), result: responder.result())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
            for hourOffset in 0 ..< 5 {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                let entry = SimpleEntry(date: entryDate, result: responder.result())
                entries.append(entry)
            }

            completion(Timeline(entries: entries, policy: .atEnd))
    }

    func snapshot(for configuration: WBIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), result: responder.result())
    }

}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let result: String
}

struct WBWidgetEntryView : View {
    var entry: Provider.Entry
//    var storage : UserDatabase = .init()
    let responder = WidgetResponder.shared
    
    var body: some View {
        VStack {
            Text("Should I do it?")
            Button(intent: WBIntent()) {
                Text("Ask")
                    .foregroundStyle(Color.Brand.default)
            }
            .padding(.bottom, 10)
            Text(String(responder.result()))
                .tracking(5)
        }
        .font(.wbFont(.body1))
    }
}

struct WBWidget: Widget {
    let kind: String = "WBWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WBWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    WBWidget()
} timeline: {
    SimpleEntry(date: .now, result: "")
}
