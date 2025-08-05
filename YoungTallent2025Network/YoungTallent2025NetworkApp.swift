//
//  YoungTallent2025NetworkApp.swift
//  YoungTallent2025Network
//
//  Created by Eser Kucuker on 5.08.2025.
//

import SwiftUI

@main
struct YoungTallent2025NetworkApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView(apiService: HomePageAPIService())
        }
    }
}
