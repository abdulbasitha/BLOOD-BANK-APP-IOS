//
//  Logo.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 02/01/21.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
            VStack{
            Text("M E A").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack(){
                Text("BLOOD").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Colors.primary)
                Text("BANK").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            }.padding(.vertical, -20)
        Image("splash")
        .resizable()
            .frame(width: 150, height: 150, alignment: .leading)
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
