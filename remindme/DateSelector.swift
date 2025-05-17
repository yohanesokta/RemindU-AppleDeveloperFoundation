//
//  DateSelector.swift
//  remindme
//
//  Created by MacBook on 13/05/25.
//

import SwiftUI

struct DateSelector: View {
    let calendar = Calendar.current
    let today = Calendar.current.startOfDay(for: Date())
    
    let dates: [Date]
    @State private var selectedDate: Date?

    init() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        let weekday = calendar.component(.weekday, from: today)

        let startOfWeek = calendar.date(byAdding: .day, value: -(weekday - 1), to: today)!
        self.dates = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: startOfWeek)
        }
        _selectedDate = State(initialValue: today)
    }

    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Rectangle()
                    .frame(height: 1)
                    .frame(width: 325)
                    .foregroundColor(Color.darkGray)
            }.padding(.horizontal,10).padding(.top,10)

            
            VStack() {
                HStack(alignment: .center,spacing: 5){
                    Text("June 2024").font(.system(size: 16,weight: .bold))
                }
                
                
            }.padding(.horizontal,15).padding(.top,10).padding(.bottom,5)
            
            
            HStack(spacing: 4) {
                ForEach(dates, id: \.self) { date in
                    VStack {
                        Text(formattedDate(date, format: "E"))
                            .font(.system(size: 14)).foregroundStyle(Color.gray)
                    }
                    .frame(width: 45)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                }
            }.frame(width: 300).padding(.horizontal,25)

            HStack(spacing: 8) {
                ForEach(dates, id: \.self) { date in
                    Button(action: {
                        selectedDate = calendar.startOfDay(for: date)
                    }) {
                        VStack {
                            Text(formattedDate(date, format: "d")).font(.system(size: 14))
                        }
                        .frame(width: 40, height: 40)
                        .background(selectedDate == calendar.startOfDay(for: date) ? Color.bluePrimary : .white)
                        .foregroundColor(selectedDate == calendar.startOfDay(for: date) ? .white : .black)
                        .cornerRadius(100)
                    }
                }
            }.frame(width:300).padding(.horizontal,25)
            .frame(width: 350, height: 50)
            
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Rectangle()
                    .frame(height: 1)
                    .frame(width: 325)
                    .foregroundColor(Color.darkGray)
            }.padding(.horizontal,10).padding(.vertical,10)
        }
        .background(Color(UIColor.white))
        .cornerRadius(10)
        .padding(.horizontal,20)
        
        
    }

    func formattedDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate(format)
        return formatter.string(from: date)
    }
}

#Preview {
    ZStack{
        Color.backgroundApp.ignoresSafeArea()
        DateSelector()
    }
    
}
