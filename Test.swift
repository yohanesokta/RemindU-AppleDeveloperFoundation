//
//  Test.swift
//  remindme
//
//  Created by MacBook on 13/05/25.
//

import SwiftUI

struct Test: View {
    var body: some View {
        HStack{
            Spacer()
            ZStack{
                VStack{
                    Text("Hello World")
                    Text("Hello World")
                }
                Image(systemName: "globe")
            }
            Spacer()
            ZStack{
                VStack{
                    Text("Hello World")
                    Text("Hello World")
                }
                Image(systemName: "globe")
            }
            Spacer()
        }
        Spacer()
        HStack{
            Spacer()
            ZStack{
                VStack{
                    Text("Hello World")
                    Text("Hello World")
                }
                Image(systemName: "globe")
            }
            Spacer()
            ZStack{
                VStack{
                    Text("Hello World")
                    Text("Hello World")
                }
                Image(systemName: "globe")
            }
            Spacer()
        }
    }
}

#Preview {
    Test()
}
