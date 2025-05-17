import SwiftData
import SwiftUI

struct HomeBar: View {
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
                            ObatCard()
                            Spacer().frame(height: 100)
                        }
                    }
                }
            }
        }
    }
}




#Preview {
    HomeBar()
}

