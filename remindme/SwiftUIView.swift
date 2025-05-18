import SwiftUI

import SwiftUI

struct ContentView2: View {
    @State private var selectedOption = "Pilih Opsi"

    var body: some View {
        Menu {
            Button("Opsi 1") {
                selectedOption = "Opsi 1"
            }
            Button("Opsi 2") {
                selectedOption = "Opsi 2"
            }
            Button("Opsi 3") {
                selectedOption = "Opsi 3"
            }
        } label: {
            Label(selectedOption, systemImage: "chevron.down")
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
        }
    }
}


#Preview {
    ContentView2()
}
