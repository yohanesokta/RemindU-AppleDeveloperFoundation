import SwiftUI
import UserNotifications

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
            NavigationCustom(selectedTab: $selectedTab)
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear{
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Izin notifikasi diberikan.")
                } else if let error = error {
                    print("Terjadi kesalahan saat meminta izin: \(error.localizedDescription)")
                }
            }
            
            SetNotification(hour: 10, minute: 51,message: "Minum Obat Sekarang",title: "Alarm")

        }
    }
}


struct NavigationCustom: View {
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Divider()
                .background(Color.darkGray)
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
            .background(.white)
        }
    }
}

#Preview{
    mainView()
}
