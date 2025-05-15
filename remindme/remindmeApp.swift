//
//  remindmeApp.swift
//  remindme
//
//  Created by MacBook on 06/05/25.
//

import SwiftUI

class AppState:ObservableObject {
    @Published var isWeight: Bool = false
    @Published var ageGroub: String = "children"
}

@main
struct remindmeApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            if (appState.isWeight) {
                MainView()
                
            } else {
                WeightSelected()
                    .environmentObject(appState)
            }
        }
    }
}
