import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState:AppState
    
    var body: some View {
        RootView().onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                let data = loadUserDataFromJSON()
                if (data != nil && data?.weight != 0){
                    appState.isWeight = true
                }
                appState.onSplashScreen = false
            }
        }
    }
}

struct RootView: View {
    @State private var showMainView = false

    var body: some View {
        if showMainView {
            MainView()
        } else {
            SplashScreen(showMainView: $showMainView)
        }
    }
}

struct SplashScreen: View {
    @Binding var showMainView: Bool

    @State private var logoOpacity: Double = 0.0
    @State private var logoScale: CGFloat = 0.8
    @State private var textOpacity: Double = 0.0

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Spacer()

                // Logo di tengah
                Image("logodepan_splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 245, height: 245)
                    .opacity(logoOpacity)
                    .scaleEffect(logoScale)
                    .onAppear {
                        // Animasi fade in dan scale
                        withAnimation(.easeOut(duration: 1.0)) {
                            logoOpacity = 1.0
                            logoScale = 1.0
                            textOpacity = 1.0
                        }

                        // Pindah ke MainView setelah 2 detik
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }

                Spacer()

                // Teks RemindU di bawah layar dengan gradasi warna
                Text("RemindU")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#8DC63F"), Color(hex: "#2BAAE1")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .opacity(textOpacity)
                    .padding(.bottom, 32)
            }
        }
    }
}

// Fungsi untuk inisialisasi warna dari hex
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

// View utama setelah splash
struct MainView: View {
    var body: some View {
        EmptyView() // Ganti dengan tampilan utama kamu
    }
}

// Preview
#Preview {
    ContentView()
}
