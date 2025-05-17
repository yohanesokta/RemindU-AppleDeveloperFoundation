import SwiftUI
import SwiftData

struct ObatCard: View {
    @Environment(\.modelContext) private var context
    
    @State private var alertShow: Bool = false
    @State private var takenAlertShow: Bool = false
    @State private var textField: String = ""

    @Query private var localdata : [LocalData]
    func skippedHandle() {
        let newData = LocalData(date_text: "now", obatName: Tahapan.Default[0].jenis, taken: false, comment: textField)
        
        context.insert(newData)
    }
    
    var body: some View {
        HStack(alignment:.center){
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
                        Text("3 tablet at 12:00")
                            .font(.system(size: 12))
                            .foregroundColor(.bluePrimary)
                    }
                }
                .padding([.top, .trailing],20)
                .padding(.bottom,10)
                .padding(.leading,35)
                HStack{
                    Button(action:{alertShow = true}){
                        Text("Skipped")
                            .font(.system(size: 12,weight: .bold))
                            .padding(.horizontal,50)
                            .padding(.vertical,8)
                            .foregroundColor(Color.black)
                            .background(Color.backgroundApp)
                            .cornerRadius(5)
                    }.alert("Skipped Notes", isPresented: $alertShow, actions: {
                        TextField("Note", text: $textField)
                        Button("OK", action: skippedHandle)
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("please write a note why this skipped")
                    })
                    Spacer()
                    Button(action:{takenAlertShow = true}){
                        Text("Taken")
                            .font(.system(size: 12,weight: .bold))
                            .padding(.horizontal,50)
                            .padding(.vertical,8)
                            .background(Color.bluePrimary)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                    }.alert("Take this medicine",isPresented: $takenAlertShow , actions: {
                        Button("OK",action:{})
                        Button("Cancel",role: .cancel,action:{})
                    },message: {
                        Text("please make sure your decision")
                    })
                }.padding(.horizontal,20).padding(.bottom,15)
                    
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    ZStack{
        Color.backgroundApp.ignoresSafeArea()
        ObatCard()
    }
    
}
