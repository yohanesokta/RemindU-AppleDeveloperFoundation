import SwiftUI

struct WeightSelected: View {
    
    var body: some View {
      
        ZStack {
            Color.backgroundApp.ignoresSafeArea()
            VStack(alignment: .center) {
                Text("What’s the patient’s weight?").font(.system(size: 18, weight: .bold))
                Text("The patient’s weight helps decide the right TB treatment program with FDC (Fixed-Dose Combination) medicine").font(.system(size: 12)).frame(width: 250).multilineTextAlignment(.center).foregroundColor(Color.black).padding(.top,1)
                BeratBadanPicker().padding(.top,80)
            }
           
        }
        
    }
}



struct BeratBadanPicker: View {
    
    @EnvironmentObject var appState:AppState
    @AppStorage("selectedBeratBadan") private var selectedBeratBadan =  40
    let rentangBeratBadan = Array(30...150)
    
    func buttonHandle() {
        appState.isWeight = true
        print(selectedBeratBadan)
    }
    var body: some View {
        VStack {
            VStack(alignment: .leading,content: {
                Text("Choose weight").bold().padding(.all,20).font(.system(size:16))
                Picker("Weight", selection: $selectedBeratBadan) {
                    ForEach(rentangBeratBadan, id: \.self) { berat in
                        Text("\(berat) kg")
                    }
                }
                .pickerStyle(.wheel)
            }).frame(width:280).background(.white).cornerRadius(10)
           
            Button(action :buttonHandle) {
                Text("Done")
            }.frame(width: 280,height: 40).background(Color.white).cornerRadius(5).padding(.top,50)
            
            
        }.padding(.bottom,80)
    }
}


#Preview {
    WeightSelected().environmentObject(AppState())
}
