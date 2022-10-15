//
//  DateWidget.swift
//  DateWidget
//
//  Created by griffin-stewie on 2022/10/11.
//  
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DateWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "globe")
                Text(entry.date, style: .date)
            }

            HStack {
                Image(systemName: "globe.asia.australia")
                Text(japaneseDateFormatter.string(from: entry.date))
            }

            HStack {
                Image(systemName: "globe.americas")
                Text(entry.date.formatted(
                    .dateTime
                        .year()
                        .month()
                        .day()
                        .locale(Locale(identifier: "en_US"))
                    )
                )
            }
        }
        .font(.title3)
    }

    var japaneseDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .japanese)
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.setLocalizedDateFormatFromTemplate("GyMMMdd")
        return formatter
    }
}

@main
struct DateWidget: Widget {
    let kind: String = "DateWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DateWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Date Widget")
        .description("Simply shows date.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct DateWidget_Previews: PreviewProvider {
    static var previews: some View {
        DateWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
