import SwiftUI
import SwiftData

struct DateSelector: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedDate: Date = Date()
    @State private var monthOffset: Int = 0

    private let calendar = Calendar.current
    private let today = Calendar.current.startOfDay(for: Date())

    // Compute the first day of the displayed month based on offset
    private var displayedMonthDate: Date {
        calendar.date(byAdding: .month, value: monthOffset, to: todayStartOfMonth)!
    }

    // Start of current month
    private var todayStartOfMonth: Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
    }

    // Generate dates for the displayed month
    private var datesInMonth: [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: displayedMonthDate) else { return [] }
        var dates: [Date] = []
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: displayedMonthDate))!
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                dates.append(date)
            }
        }
        return dates
    }

    private var startDateIndex: Int {
        loadUserDataFromJSON()?.startedDay ?? 0
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Top divider
            Divider()
                .background(Color.darkGray)
                .padding(.horizontal, 10)
                .padding(.top, 10)

            // Month navigation header
            HStack {
                Button(action: { monthOffset -= 1 }) {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                }

                Spacer()

                Text(formattedDate(displayedMonthDate, format: "MMMM yyyy"))
                    .font(.system(size: 16, weight: .bold))

                Spacer()

                Button(action: { monthOffset += 1 }) {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)

            // Day scroll list
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(datesInMonth, id: \.self) { date in
                            Button(action: {
                                selectedDate = calendar.startOfDay(for: date)
                            }) {
                                VStack {
                                    Text(formattedDate(date, format: "E"))
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                        .padding(.vertical, 5)

                                    ZStack {
                                        Text(formattedDate(date, format: "d"))
                                            .font(.system(size: 14))
                                            .frame(width: 30, height: 30)
                                            .background(
                                                selectedDate == calendar.startOfDay(for: date)
                                                    ? Color.bluePrimary
                                                    : (calendar.isDate(date, inSameDayAs: today)
                                                       ? Color.darkGray
                                                       : Color.white)
                                            )
                                            .cornerRadius(15)
                                            .foregroundColor(
                                                selectedDate == calendar.startOfDay(for: date)
                                                    ? .white
                                                    : .black)

                                        // Dot indicator for startDateIndex
                                        if startDateIndex == calendar.component(.day, from: date)
                                            && !calendar.isDate(selectedDate, inSameDayAs: date) {
                                            VStack {
                                                Circle()
                                                    .frame(width: 5, height: 5)
                                                    .padding(.top, 28)
                                            }
                                        }
                                    }
                                }
                                .id(date)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    // Initialize to first visible date
                    selectedDate = today
                    DispatchQueue.main.async {
                        scrollProxy.scrollTo(today, anchor: .center)
                    }
                }
                .onChange(of: monthOffset) { _ in
                    // Scroll to first day of new month when month changes
                    if let firstOfMonth = datesInMonth.first {
                        scrollProxy.scrollTo(firstOfMonth, anchor: .leading)
                    }
                }
            }

            // Bottom divider
            Divider()
                .background(Color.darkGray)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .onChange(of: selectedDate) { newDate in
            appState.selectedDate = newDate
            print("Selected date: \(newDate)")
        }
    }

    // Date formatting helper
    private func formattedDate(_ date: Date, format: String) -> String {
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
