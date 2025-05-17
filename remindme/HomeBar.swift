import SwiftData
import SwiftUI

struct HomeBar: View {
    @StateObject var appState = AppState()
    @State private var offsite:CGFloat = 0
    @State private var thisDayCheck:Bool = false
    func deleteAnimate(){
        offsite = 400
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            thisDayCheck = true
        }
    }
    
    @Query var localdata:[LocalData]
    
    func checkCheked() {
        for data in localdata {
            if ((compareDateNumbers(getTodayAsNumber(), data.date)) == 0) {
                thisDayCheck = true
            }
        }
    }
    
    
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
                    ScrollView {
                        
                        VStack(alignment:.leading) {
                            Text("Schedule").font(.system(size: 28,weight: .bold)).padding(.horizontal,25)
                                .padding(.top,60)
                                .padding(.bottom,20)
                            IntensifBar()
                            DateSelector()
                                .environmentObject(appState)
                            Text("Your Medications")
                                .font(.system(size: 14 , weight: .bold)).padding(.horizontal,25).padding(.vertical,10)
                            let compare:Int = compareDateNumbers( getTodayAsNumber(),getTodayAsNumber(date: appState.selectedDate))
                            if ( compare == 0 && !thisDayCheck) {
                                ObatCard(deleteAnim: deleteAnimate)
                                    .offset(x:offsite)
                                    .animation(.easeInOut(duration: 0.4),value: offsite)
                            } else if (compare == 1) {
                                ObatCard(disable: true)
                            } else {
                                EmptyObat()
                            }
                            Spacer().frame(height: 100)
                        }
                        .onChange(of: appState.selectedDate){
                            print(getTodayAsNumber(date:appState.selectedDate))
                        }
                    }
                }
            }
        }
        .onAppear{
            checkCheked()
        }
    }
}


struct EmptyObat:View {
    var body: some View {
        VStack(alignment:.center,spacing: 10){
            Text("Well Done!")
                .font(.system(size: 18,weight: .bold))
            HStack(alignment: .center){
            Text("No more tasks for today. Thank you for taking your meds. Come back again tomorrow!")
                    .font(.system(size: 12,weight: .light))
                    .multilineTextAlignment(.center)
            }
            Image("EmptyIcon")
                .padding(.vertical,10)
        }.frame(maxWidth: .infinity)
            .padding(.all,20)
    }
}

#Preview {
    HomeBar()
}

