//
//  ContentView.swift
//  YoungTallent2025Network
//
//  Created by Eser Kucuker on 5.08.2025.
//

import SwiftUI
import API

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
//            let req = URLRequest(url: URL(string: "https://www.google.com")!)
//            await Network().fetch(request: req)
        }
    }
}

#Preview {
    ContentView()
}
