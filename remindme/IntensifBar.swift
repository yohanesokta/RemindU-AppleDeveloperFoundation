import SwiftUI
import SwiftData

struct IntensifBar : View {
    @State private var info:Bool = false
    @State private var taken = 0
    @State private var skip = 0
    
    let current: Double = 10
    let total: Double = 56

    
    var progress: Double {
            current / total
    }
    
    @Query var localdata:[LocalData]
    func hitungTaken() {
        taken = 0;skip = 0;
        for data in localdata {
            if (data.taken) {
                taken += 1
            } else {
                skip += 1
            }
        }
    }
    var body: some View {
        VStack(alignment : .leading,spacing: 10) {
                HStack(){
                    Text("Intensive Phase").font(.system(size: 18,weight: .bold))
                    Button(action : {
                        info = true
                    }){
                        Image(systemName: "exclamationmark.circle")
                            .sheet(isPresented: $info) {
                                VStack(alignment:.leading){
                                    HStack{
                                        Spacer()
                                        Button("Done",action: {
                                            info = false
                                        }).padding(.all,20)
                                    }
                                    VStack(alignment:.center){
                                        Text("Intensive Phase")
                                            .font(.system(size: 18,weight: .bold))
                                        
                                        Text("Treatment for tuberculosis (TB) consists of the Intensive Phase and the Continuation Phase. The Intensive Phase is the initial 2-month stage. Its purpose is to reduce the number of active bacteria in the body.")
                                            .font(.system(size: 12))
                                            .padding(.horizontal,30)
                                            .padding(.vertical,5)
            
                                        VStack{
                                            HStack{
                                                Image(systemName: "sun.min.fill")
                                                    .foregroundColor(.blue)
                                                Text("TB Treatment Timeline")
                                                    .font(.headline)
                                            }
// Start
                                            VStack{
                                                HStack{
                                                    Image(systemName: "circle.fill")
                                                        .resizable()
                                                        .frame(width: 10)
                                                        .frame(height: 10)
                                                        .foregroundColor(Color.yellow)
                                                    Text("Intensive Phase")
                                                    
                                                }
                                                VStack(alignment: .leading){
                                                    Text("2 months")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("Drugs :")
                                                            .font(.system(size: 12))
                                                        Text("RHZE")
                                                            .font(.system(size: 12))
                                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                                    }
                                                }.padding(.leading,30)
                                                
                                            }.padding(.trailing,30)
                                            VStack{
                                                HStack{
                                                    Image(systemName: "circle.fill")
                                                        .resizable()
                                                        .frame(width: 10)
                                                        .frame(height: 10)
                                                        .foregroundColor(Color.orange)
                                                    Text("Continuation Phase")
                                                    
                                                }
                                                VStack(alignment: .leading){
                                                    Text("4 months")
                                                        .font(.system(size: 12))
                                                    HStack{
                                                        Text("Drugs :")
                                                            .font(.system(size: 12))
                                                        Text("RH")
                                                            .font(.system(size: 12))
                                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                                    }
                                                }.padding(.trailing,10)
                                                   
                                                
                                            }
                                            .padding(.top,10)
// End
                                        }.padding(.horizontal,60)
                                            .padding(.vertical,20)
                                            .background(.white)
                                            .cornerRadius(6)
                                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                     .foregroundColor(.black)
                                    Spacer()
                                }.presentationDetents([.medium])
                                    .background(Color.backgroundApp)
                            }
                    }
                    
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
                    Text("\(taken)").font(.system(size: 20)).padding(.horizontal,15)
                    Spacer()
                    Text("Taken").font(.system(size: 12)).padding(.horizontal,15)
                }.frame(width:153)
                    .frame(height: 40)
                    .background(Color.greenPrimary)
                    .cornerRadius(5)
                
                HStack(alignment: .bottom){
                    Text("\(skip)").font(.system(size: 20)).padding(.horizontal,15)
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
        .onAppear{
            hitungTaken()
        }.onChange(of: localdata) {
            hitungTaken()
        }
    }
}



struct JustifiedText: UIViewRepresentable {
    let text: String
    let fontSize: CGFloat

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont.systemFont(ofSize: fontSize)
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}


#Preview {
    ZStack{
        Color.backgroundApp.ignoresSafeArea()
        IntensifBar()
    }
    
}
