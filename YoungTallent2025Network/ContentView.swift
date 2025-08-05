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
            await getData()
        }
    }
    
    
    @MainActor func getData() async {
        do {
            let response: [MovieResponse] = try await API.Movie.getMovie.fetch()
            print(response)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
