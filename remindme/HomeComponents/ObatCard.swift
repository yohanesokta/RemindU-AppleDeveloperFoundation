//
//  ObatCard.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI

struct ObatCard: View {
    @State private var alertShow: Bool = false
    @State private var textField: String = ""
    
    var body: some View {
        HStack(alignment:.center){
            VStack(alignment:.leading) {
                
                HStack(alignment:.top, spacing: 20){
                    Image(systemName: "pills.fill")
                        .resizable()
                        .frame(width: 17)
                        .frame(height:  15)
                        .padding(.vertical,7)
                        .foregroundColor(Color.bluePrimary)
                        .foregroundColor(Color.bluePrimary)
                    
                    VStack(alignment:.leading,spacing: 3){
                        Text("Isoniazid")
                            .font(.system(size: 18,weight: .bold))
                        Text("Tablet, 5 mg/kg")
                            .font(.system(size: 12))
                        Text("3 tablet at 12:00")
                            .font(.system(size: 12))
                            .foregroundColor(.bluePrimary)
                    }
                }
                .padding([.top, .trailing],20)
                .padding(.bottom,10)
                .padding(.leading,35)
                HStack{
                    Button(action:{alertShow = true}){
                        
                        Text("Skipped")
                            .font(.system(size: 12,weight: .bold))
                            .padding(.horizontal,50)
                            .padding(.vertical,8)
                            .foregroundColor(Color.black)
                            .background(Color.backgroundApp)
                            .cornerRadius(5)
                    }.alert("Skipped Notes", isPresented: $alertShow, actions: {
                        TextField("Note", text: $textField)

                        
                        Button("OK", action: {})
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("please write a note why this skipped")
                    })
                    Spacer()
                    Button(action:{}){
                        Text("Taken")
                            .font(.system(size: 12,weight: .bold))
                            .padding(.horizontal,50)
                            .padding(.vertical,8)
                            .background(Color.bluePrimary)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                    }
                }.padding(.horizontal,20).padding(.bottom,15)
                    
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    ZStack{
        Color.backgroundApp.ignoresSafeArea()
        ObatCard()
    }
    
}
