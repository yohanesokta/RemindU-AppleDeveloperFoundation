
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

                    NavigationCustom()
                    
                }
              
            }
        }
    }
}


struct NavigationCustom: View {
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment:.center,spacing:100){
                VStack{
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.blue)
                    Text("Schedule").font(.system(size: 12))
                        .foregroundColor(.blue)
                }
                VStack{
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.gray)
                    Text("Jurney").font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }.frame(height: 50)
                .padding(.top,15)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    HomeBar()
}

