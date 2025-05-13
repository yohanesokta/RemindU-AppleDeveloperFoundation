
import SwiftUI

struct HomeBar: View {  
    var body: some View {
        ZStack(alignment:.top){
            Color.lenearTop.ignoresSafeArea()
            Color.backgroundApp
            Rectangle()
                .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.lenearTop, Color.backgroundApp]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                .frame(height: 300)
            VStack {
                ZStack{
                    ScrollView {
                        VStack(alignment:.leading) {
                            Text("Schedule").font(.system(size: 28,weight: .bold)).padding(.horizontal,25)
                                .padding(.top,60)
                                .padding(.bottom,20)
                            HeaderBar()
                            WeekDateSelector()
                            HeaderBar();HeaderBar();HeaderBar()
                            Spacer().frame(height: 100)
                        }
                    }
                    
                    NavigationCustom()
                    
                    
                    // Pop Up
                    
                    
//                    Popup()
                   
                    
                    // End Pop
                    
                    
                }
              
            }
        }
    }
}




struct HeaderBar : View {
    let current: Double = 5
    let total: Double = 56

    let persen : Double = 50 / (50+10)
    var progress: Double {
            current / total
    }

    var body: some View {
        VStack(alignment : .leading,spacing: 10) {
                HStack(){
                    Text("Intensive Phase").font(.system(size: 18,weight: .bold))
                    Image(systemName: "exclamationmark.circle")
                }.padding(.horizontal,20)
            Text("Your Summary Today").font(.system(size: 12)).padding(.bottom,15).padding(.horizontal,20)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5).fill(Color.backgroundApp)
                    )
                
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.bluePrimary)
                        .frame(width: geo.size.width * progress)
                }
                .frame(height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                HStack(alignment: .center) {
                    Text("\(Int(current)) day")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .bold().padding(.horizontal,10)
                    Spacer()
                    Text("\(Int(total)) day")
                        .foregroundColor(.black)
                        .bold().padding(.horizontal,10)
                }
            }
            .frame(height: 40)
            .padding(.horizontal, 20)
            ProgressView(value: persen)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.greenPrimary))
                .padding(.horizontal,20).scaleEffect(x:1,y:2,anchor: .center)
            
            
            HStack(){
                HStack(alignment: .bottom){
                    Text("50").font(.system(size: 20)).padding(.horizontal,15)
                    Spacer()
                    Text("Taken").font(.system(size: 12)).padding(.horizontal,15)
                }.frame(width:153)
                    .frame(height: 40)
                    .background(Color.greenPrimary)
                    .cornerRadius(5)
                
                HStack(alignment: .bottom){
                    Text("10").font(.system(size: 20)).padding(.horizontal,15)
                    Spacer()
                    Text("Skipped").font(.system(size: 12)).padding(.horizontal,15)
                }.frame(width:153)
                    .frame(height: 40)
                    .background(Color.backgroundApp)
                    .cornerRadius(5)
            }.padding(.horizontal,20)
        }
        .frame(width: 350)
        .padding(.vertical,20)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal,20)
    }
}



struct WeekDateSelector: View {
    let calendar = Calendar.current
    let today = Calendar.current.startOfDay(for: Date())
    
    let dates: [Date]
    @State private var selectedDate: Date?

    init() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        // Ambil komponen hari dalam minggu (1 = Minggu, 7 = Sabtu)
        let weekday = calendar.component(.weekday, from: today)
        
        // Hitung tanggal hari Minggu sebelumnya (awal minggu)
        let startOfWeek = calendar.date(byAdding: .day, value: -(weekday - 1), to: today)!

        // Buat array tanggal dari Minggu ke Sabtu
        self.dates = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: startOfWeek)
        }
        _selectedDate = State(initialValue: today)
    }

    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                HStack(alignment: .bottom,spacing: 5){
                    Text("Day 6").font(.system(size: 16,weight: .bold))
                    Text("Of 60").font(.system(size: 10)).foregroundColor(.gray).padding(.bottom,2)
                }
            }.padding(.horizontal,15 ).padding(.top,20).padding(.bottom,10)
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Rectangle()
                    .frame(height: 1)
                    .frame(width: 325)
                    .foregroundColor(Color.darkGray)
            }.padding(.horizontal,10)

            
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




struct NavigationCustom: View {
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment:.center,spacing:100){
                VStack{
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.blue)
                    Text("Schedule").font(.system(size: 12))
                        .foregroundColor(.blue)
                }
                VStack{
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.gray)
                    Text("Jurney").font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }.frame(height: 50)
                .padding(.top,15)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                
            
        }
    }
}



struct Popup : View {
    @State private var showPrompt = false
    @State private var inputText = ""
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing:10){
                Text("Skipped Notes").font(.system(size: 18,weight: .bold))
                Text("please write a note why this skipped")
                    .font(.system(size: 12))
                TextEditor(text: $inputText)
                    .frame(height: 60)
                    .frame(width:310)
                    .padding(.horizontal,10)
                    .cornerRadius(10)
            }.padding(.horizontal,10)
                .padding(.vertical,20)
            .background(Color.backgroundApp)
            .cornerRadius(10)
        }
    }
}


#Preview {
    HomeBar()
}

