import SwiftUI

struct IntensifBar : View {
    let current: Double = 10
    let total: Double = 56

    let persen : Double = 50 / (50+10)
    var progress: Double {
            current / total
    }

    var body: some View {
        VStack(alignment : .leading,spacing: 10) {
                HStack(){
                    Text("Intensive Phase").font(.system(size: 18,weight: .bold))
                    Image(systemName: "exclamationmark.circle")
                }.padding(.horizontal,20)
            Text("Your Summary Today").font(.system(size: 12)).padding(.bottom,15).padding(.horizontal,20)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5).fill(Color.backgroundApp)
                    )
                
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.bluePrimary)
                        .frame(width: geo.size.width * progress)
                }
                .frame(height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                HStack(alignment: .center) {
                    Text("\(Int(current)) day")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .bold().padding(.horizontal,10)
                    Spacer()
                    Text("\(Int(total)) day")
                        .foregroundColor(.black)
                        .bold().padding(.horizontal,10)
                }
            }
            .frame(height: 40)
            .padding(.horizontal, 20)
            
            
            HStack(){
                HStack(alignment: .bottom){
                    Text("50").font(.system(size: 20)).padding(.horizontal,15)
                    Spacer()
                    Text("Taken").font(.system(size: 12)).padding(.horizontal,15)
                }.frame(width:153)
                    .frame(height: 40)
                    .background(Color.greenPrimary)
                    .cornerRadius(5)
                
                HStack(alignment: .bottom){
                    Text("10").font(.system(size: 20)).padding(.horizontal,15)
                    Spacer()
                    Text("Skipped").font(.system(size: 12)).padding(.horizontal,15)
                }.frame(width:153)
                    .frame(height: 40)
                    .background(Color.backgroundApp)
                    .cornerRadius(5)
            }.padding(.horizontal,20)
        }
        .frame(width: 350)
        .padding(.vertical,20)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal,20)
    }
}

#Preview {
    IntensifBar()
}
