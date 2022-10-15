//
//  ContentView.swift
//  Date
//
//  Created by griffin-stewie on 2022/10/11.
//  
//

import SwiftUI

struct ContentView: View {
    let date = Date()
    var body: some View {
        VStack {
            VStack {
                Text(
                    date.formatted(
                        .dateTime
                            .year()
                            .month()
                            .day()
                            .locale(.init(identifier: "ja_JP"))
                    )
                )
                Text(date.formatted(date: .long, time: .omitted))
            }
            Text(Locale.current.languageCode!)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
