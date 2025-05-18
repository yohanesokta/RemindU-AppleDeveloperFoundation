//
//  CardJourney.swift
//  remindme
//
//  Created by MacBook on 14/05/25.
//

import SwiftUI

struct CardJourney: View {
    var listing:LocalData = LocalData(date: 0, obatName: "", taken: false, comment: "")
    
    var body: some View {
        HStack{
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
                        Text("Everyday, After Meals")
                            .font(.system(size: 12))
                        Text("3 tablet at 12:00")
                            .font(.system(size: 12))
                            .foregroundColor(.bluePrimary)
                    }
                    
                }
                .padding([.top, .trailing],20)
                .padding(.bottom,10)
                .padding(.leading,0)
                
                VStack(alignment:.leading) {
                    Text("Notes")
                        .foregroundColor(.gray)
                    Text(listing.comments ?? "")
                }
                .font(.system(size: 12))
                .padding(.horizontal, 35)
                .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    CardJourney()
}
