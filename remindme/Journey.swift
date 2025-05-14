//
//  Journey.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI

struct Journey: View {
    var body: some View {
        ZStack(alignment:.top){
            Rectangle()
                .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.lenearTop, Color.backgroundApp,Color.backgroundApp,Color.backgroundApp]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                .frame(height: .infinity).ignoresSafeArea()
            VStack {
                ZStack{
                    ScrollView {
                        
                        VStack(alignment:.leading) {
                            Text("Journey").font(.system(size: 28,weight: .bold)).padding(.horizontal,25)
                                .padding(.top,60)
                                .padding(.bottom,20)
                            SegmenView()
                            
                           
                            Spacer().frame(height: 100)
                        }
                    }

                    NavigationCustom()
                    
                }
              
            }
        }
    }
}


struct SegmenView: View {
    @State private var selectedSegment = 0
    let segments = ["Skipped", "Taken"]

    var body: some View {
        VStack {
            Picker("Pilihan", selection: $selectedSegment) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Text(segments[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            // Konten yang berubah tergantung pilihan
            if selectedSegment == 0 {
                HStack{
                    Text("May 14")
                        .font(.system(size: 14, weight: .bold)).padding(.horizontal,25)
                    Spacer()
                }
                
                
                CardJourney()
            } else {
                Text("No Data")
            }
        }
    }
}



#Preview {
    Journey()
}
