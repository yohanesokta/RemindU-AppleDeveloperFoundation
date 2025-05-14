//
//  card.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI

struct card: View {
    var body: some View {
        HStack{
            VStack{
                Image(systemName: "globe")
            }
            .padding()
            .background(.blue)
            VStack{
                Text("Title             ")
                Text("Description")
            }
            Spacer()
            VStack{
                Text("2023-12-12")
                Text("")
            }
            
        }
        .padding()
        .background(Color.green)
    }
}

#Preview {
    card()
}
