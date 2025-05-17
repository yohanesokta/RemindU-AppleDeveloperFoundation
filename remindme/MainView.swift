import SwiftUI
enum Tab {
    case home
    case journey
}


struct mainView: View {
    
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                    case .home:
                        HomeBar()
                    case .journey:
                        Journey()
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color.red)
            NavigationCustom(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct NavigationCustom: View {
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Divider()
            HStack(alignment: .center, spacing: 100) {
                Button(action: {
                    selectedTab = .home
                }) {
                    VStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTab == .home ? .blue : .gray)
                        Text("Schedule")
                            .font(.system(size: 12))
                            .foregroundColor(selectedTab == .home ? .blue : .gray)
                    }
                }

                Button(action: {
                    selectedTab = .journey
                }) {
                    VStack {
                        Image(systemName: "books.vertical.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTab == .journey ? .blue : .gray)
                        Text("Journey")
                            .font(.system(size: 12))
                            .foregroundColor(selectedTab == .journey ? .blue : .gray)
                    }
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
        }
    }
}

#Preview{
    mainView()
}
