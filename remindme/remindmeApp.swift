//
//  remindmeApp.swift
//  remindme
//
//  Created by MacBook on 06/05/25.
//

import SwiftUI

class AppState:ObservableObject {
    @Published var isWeight: Bool = false
    @Published var StartedDay: Int32 = 0
}

@main
struct remindmeApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            if (appState.isWeight) {
                HomeBar()
                
            } else {
                WeightSelected()
                    .environmentObject(appState)
            }
        }
    }
}
