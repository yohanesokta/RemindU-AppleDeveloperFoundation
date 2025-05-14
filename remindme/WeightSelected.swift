import SwiftUI



struct WeightSelected:View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.backgroundApp.ignoresSafeArea()
                VStack(alignment: .center) {
                    Text("What’s the patient’s age group?").font(.system(size: 18, weight: .bold))
                    Text("The patient's age group helps determine the appropriate TB treatment program using FDC (Fixed-Dose Combination) medicine — either for children or adults.").font(.system(size: 12)).frame(width: 250).multilineTextAlignment(.center).foregroundColor(Color.black).padding(.top,1)
                    VStack(alignment:.leading,spacing: 10){
                        Text("Choose Age Group")
                            .font(.system(size: 14))
                        Rectangle()
                            .fill(Color.darkGray)
                            .frame(width:200,height: 1)
                        HStack{
                            Button(action:{}){
                                Text("Childern")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                            }
                            
                            .padding(.vertical,5)
                            .frame(width: 120)
                            .frame(height: 35)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(5)
                            
                            Button(action:{}){
                                Text("Adult").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                            }
                            .frame(width: 120)
                            .frame(height: 35)
                            .padding(.vertical,5)
                            .foregroundColor(.black)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                        }
                        .background(.backgroundApp)
                        .cornerRadius(5)
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,20)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.top,20)
                    
                    HStack{
                        NavigationLink(destination:BeratBadan()){
                            Text("Countinue")
                                .padding()
                                .frame(width: 270)
                                .background(.white)
                                .cornerRadius(10)
                        }
                    }.padding(.top,100)
                }
            }
           
        }
    }
}






struct BeratBadan: View {
    
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
