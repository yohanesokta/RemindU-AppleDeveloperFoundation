import SwiftUI
import SwiftData


struct WeightSelected:View {
    
    @EnvironmentObject var appState:AppState
    @Environment(\.modelContext) var context
    @State var selectedBeratBadan : Int = 0
    
    @State private var selectedSegment = 0
    let segments = ["Children", "Adults"]
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.backgroundApp.ignoresSafeArea()
                VStack(alignment: .center) {
                    Text("What’s the patient’s age group?").font(.system(size: 18, weight: .bold))
                    Text("The patient's age group helps determine the appropriate TB treatment program using FDC (Fixed-Dose Combination) medicine — either for children or adults.")
                        .font(.system(size: 12))
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                        .padding(.top,1)
                        .padding(.bottom,100)
                    
                    VStack(alignment:.leading,spacing: 10){
                        Text("Choose Age Group")
                            .font(.system(size: 14))
                        Rectangle()
                            .fill(Color.darkGray)
                            .frame(width:235,height: 1)
                        HStack(spacing:0){
                            Button(action:{
                                appState.ageGroub = "children"
                            }){
                                Text("Children")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                            }
                            
                            .padding(.vertical,5)
                            .frame(width: 120)
                            .frame(height: 35)
                            .foregroundColor((appState.ageGroub == "children") ? .white : .black)
                            .background((appState.ageGroub == "children") ? .blue : .backgroundApp)
                            .cornerRadius(10)
                            
                            Button(action:{
                                appState.ageGroub = "adult"
                            }){
                                Text("Adult").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                            }
                            .padding(.vertical,5)
                            .frame(width: 120)
                            .frame(height: 35)
                            .foregroundColor((appState.ageGroub == "adult") ? .white : .black)
                            .background((appState.ageGroub == "adult") ? .blue : .backgroundApp)
                            .cornerRadius(7)
                        }
                        .background(Color.backgroundApp)
                        .cornerRadius(10)
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,20)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.top,20)
                    HStack{
                        NavigationLink(destination:BeratBadan(appState: appState)){
                            Text("Countinue")
                                .padding()
                                .frame(width: 270)
                                .background(.white)
                                .cornerRadius(10)
                        }
                    }.padding(.top,130)
                }
            }
           
        }
    }
}






struct BeratBadan: View {
    var appState:AppState
    
    @State private var jenisObat:String = ""
    @AppStorage("selectedBeratBadan") private var selectedBeratBadan = 0
    var rentangBeratBadan: [Int] {
        if appState.ageGroub == "children" {
            return Array(5...50)
        }else {
            return Array(30...80)
        }
    }
    
    func buttonHandle() {
        let newUser = UserData(startedDay: getTodayAsNumber(), weight: selectedBeratBadan, jenisObat: obatRegimen(weight: selectedBeratBadan), tahapan: 0)
        saveUserDataToJSON(newUser)
        appState.isWeight = true
    }
    
    
    var body: some View {
      
        ZStack {
            Color.backgroundApp.ignoresSafeArea()
            VStack(alignment: .center) {
                Text("What’s the patient’s weight?").font(.system(size: 18, weight: .bold))
                Text("The patient’s weight helps decide the right TB treatment program with FDC (Fixed-Dose Combination) medicine").font(.system(size: 12)).frame(width: 250).multilineTextAlignment(.center).foregroundColor(Color.black).padding(.top,1)
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
                    
                    
                }.padding(.bottom,80).padding(.top,80)
            }
           
        }
        
    }
}

//
//#Preview {
//    WeightSelected().environmentObject(AppState())
//}
