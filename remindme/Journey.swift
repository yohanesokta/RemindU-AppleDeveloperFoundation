//
//  Journey.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI
import SwiftData

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
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).ignoresSafeArea()
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
                    
                }
              
            }
        }
    }
}


struct SegmenView: View {
    @Environment(\.modelContext) private var context 
    @State private var selectedSegment = 0
    let segments = ["Skipped", "Taken"]

    @State private var jumlahTaken:Int = 0
    @State private var jumlahSkip:Int = 0
    @Query private var localdata:[LocalData]
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
                ForEach(localdata.indices, id: \.self) { index in
                    if (!localdata[index].taken) {
                        VStack{
                            HStack{
                                Text("May 14")
                                    .font(.system(size: 14, weight: .bold)).padding(.horizontal,25)
                                Spacer()
                            }
                            
                            CardJourney(listing: localdata[index])
                        }.onAppear{
                            jumlahSkip += 1
                        }
                    }
                }
                if (jumlahSkip == 0) {
                    EmptyJourney()
                        .padding(100)
                }
                
               
            } else {
                ForEach(localdata.indices, id: \.self) { index in
                    if (localdata[index].taken) {
                        VStack{
                            HStack{
                                Text("May 14")
                                    .font(.system(size: 14, weight: .bold)).padding(.horizontal,25)
                                Spacer()
                            }
                            
                            CardJourney(listing: localdata[index])
                        }.onAppear{
                            jumlahTaken += 1
                        }
                    }
                    
                }
                if (jumlahTaken == 0) {
                    EmptyJourney()
                        .padding(100)
                }
            }
        }

    }
}



#Preview {
    Journey()
}
