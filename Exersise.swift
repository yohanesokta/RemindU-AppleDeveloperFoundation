import SwiftUI
struct Exersise: View {
    var body: some View {
        VStack{
            HStack{
                Text("Hello World")
                    .padding(.all,20)
                    .background(.green)
                
                Spacer()
                
                Text("Hello World")
                    .padding(.all,20)
                    .background(.red)
                
            }
            Spacer()
            HStack{
                Image(systemName: "globe")
                Text("Hello World")
                    
                    
            }
            .padding(.all,20)
            .background(.black)
            .foregroundColor(.white)
            Spacer()
            
            HStack{
                Text("Hello World")
                    .padding(.all,20)
                    .background(.yellow)
                Spacer()
                Text("Hello World")
                    .padding(.all,20)
                    .background(.purple)
            }
            
        }
        .background(Color.blue)
    }
}

#Preview {
    Exersise()
}
