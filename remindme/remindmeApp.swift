//
//  remindmeApp.swift
//  remindme
//
//  Created by MacBook on 06/05/25.
//

import SwiftUI
import SwiftData

class AppState:ObservableObject {
    @Published var onSplashScreen = true
    @Published var isWeight: Bool = false
    @Published var ageGroub: String = "children"
    @Published var selectedDate:Date = Date()
}

@main
struct remindmeApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            if (appState.onSplashScreen) {
                ContentView()
                    .environmentObject(appState)
            } else {
                if (appState.isWeight) {
                    mainView()
                        .modelContainer(for: LocalData.self)
                    
                } else {
                    WeightSelected()
                        .environmentObject(appState)
                }
            }
        }
    }
}
