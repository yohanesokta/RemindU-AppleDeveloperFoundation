import SwiftUI
import SwiftData

struct DateSelector: View {
    @EnvironmentObject var appState:AppState
    
    @State private var selectedDate:Date = Date()
    let calendar = Calendar.current
    let today = Calendar.current.startOfDay(for: Date())
    
    let dates: [Date]
    
    
    init() {
        let range = calendar.range(of: .day, in: .month, for: today)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
        
        var tempDates: [Date] = []
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                tempDates.append(date)
            }
        }
        self.dates = tempDates
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.darkGray)
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)

            Text(formattedDate(today, format: "MMMM yyyy"))
                .font(.system(size: 16, weight: .bold))
                .padding(.horizontal, 15)
                .padding(.top, 10)
                .padding(.bottom, 5)
            

            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(dates, id: \.self) { date in
                            Button(action: {
                                selectedDate = calendar.startOfDay(for: date)
                            }) {
                                VStack {
                                    Text(formattedDate(date, format: "E"))
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                        .padding(.bottom,10)
                                        .padding(.top,5)
                                    Text(formattedDate(date, format: "d"))
                                        .font(.system(size: 14))
                                        .frame(width: 30,height: 30)
                                        .background(selectedDate == calendar.startOfDay(for: date) ? Color.bluePrimary : Color.white)
                                        .cornerRadius(50)
                                        .foregroundColor(selectedDate == calendar.startOfDay(for: date) ? .white : .black)
                                        
                                }
                                .id(date)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    selectedDate = today
                    DispatchQueue.main.async {
                        scrollProxy.scrollTo(today, anchor: .center)
                    }
                }
            }
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.darkGray)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .onChange(of: selectedDate) {
            appState.selectedDate = selectedDate
            print(selectedDate)
        }
    }

    func formattedDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate(format)
        return formatter.string(from: date)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        DateSelector()
            .environmentObject(AppState())
    }
}

