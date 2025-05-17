//
//  EmptyJourney.swift
//  remindme
//
//  Created by MacBook on 15/05/25.
//

import SwiftUI

struct EmptyJourney: View {
    var body: some View {
        VStack {
            Text("Oops!")
                .font(.system(size: 20,weight: .bold))
            Text("Nothing ro show here. Let's start by taking your first medication!")
                .font(.system(size: 12))
            
            Image("EmptyIcon")
                .resizable()
                .frame(width: 120, height: 120)
        }
    }
}

#Preview {
    EmptyJourney()
}

