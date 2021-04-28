//
//  Header.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 06/01/21.
//

import SwiftUI
import SafariServices
struct Header: View {
    @State private var showingAlert = false
    var body: some View {
        HStack{
            Button(action: {
                self.showingAlert = true
                
            }, label: {
                Image("image")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }).alert(isPresented: $showingAlert) {
                Alert(title: Text("Warning"), message: Text("Are you sure want to logout!"),primaryButton:Alert.Button.default(
                        Text("YES"),action: {
                            print("Logout")
                        }),
                        secondaryButton:.default(Text("NO")))}
            Spacer()
            Button(action: {
                guard let url = URL(string: "http://google.com/") else {
                    return
                }
                UIApplication.shared.open(url) 
                
            }, label: {
                Image("admin").resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
            })
            
        }.padding([.horizontal])
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

