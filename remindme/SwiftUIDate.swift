//
//  SwiftUIDate.swift
//  remindme
//
//  Created by MacBook on 15/05/25.
//

import SwiftUI

struct SwiftUIDate: View {
    @State private var date = Date()


    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date]
        ).datePickerStyle(.graphical)
    }
}

#Preview {
    SwiftUIDate()
}
