//
//  Test.swift
//  remindme
//
//  Created by MacBook on 15/05/25.
//

import SwiftUI

struct Test: View {
    @EnvironmentObject var appState:AppState
    var body: some View {
        Button(action : {
            appState.isWeight = true
        })
        {
            Text("Pindah")
        }
    }
}

#Preview {
    Test()
}
