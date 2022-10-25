//
//  ContentView.swift
//  Date
//
//  Created by griffin-stewie on 2022/10/11.
//  
//

import SwiftUI

struct ContentView: View {

    @Environment(\.openURL) private var openURL

    let description = """
    This application is a container application that exists to provide Widgets.
    """

    let helpURL = URL(string: "https://support.apple.com/guide/mac-help/add-customize-widgets-notification-center-mchl52be5da5/mac")!

    var body: some View {
        VStack {
            Image(nsImage: NSApp.applicationIconImage)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            Text("Date")
                .font(.system(size: 36))
                .fontWeight(.heavy)

            VStack(alignment: .leading, spacing: 20) {
                Text(description)
                    .font(.body)
            }
            .multilineTextAlignment(.leading)
            .padding()
            Spacer()

            Button("How to setup", action: {
                openURL(helpURL)
            })

            Spacer()
        }
            .padding()
            .frame(width: 440, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
