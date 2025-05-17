//
//  Journey.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI
import SwiftData


struct Journey: View {
    let datas =  ["Hello","World"]
    @Query private var localdata : [LocalData]
    
    var body: some View {
        ZStack(alignment:.top){
            Rectangle()
                .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.lenearTop, Color.backgroundApp,Color.backgroundApp,Color.backgroundApp]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                ).ignoresSafeArea()
            VStack {
                ZStack{
                    VStack {
                        
                        VStack(alignment:.leading) {
                            Text("Journey").font(.system(size: 28,weight: .bold)).padding(.horizontal,25)
                                .padding(.top,60)
                                .padding(.bottom,20)
                            List(localdata) { data in
                                SegmenView()
                            }.background(.backgroundApp)
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            }
                            Spacer().frame(height: 100)
                    }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                    
                }
              
            }.onAppear{
               
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

            if selectedSegment == 0 {
                HStack{
                    Text("May 14")
                        .font(.system(size: 14, weight: .bold)).padding(.horizontal,25)
                    Spacer()
                }

                CardJourney()
            } else {
                EmptyJourney()
                    .padding(100)
            }
        }
    }
}



#Preview {
    Journey()
}
