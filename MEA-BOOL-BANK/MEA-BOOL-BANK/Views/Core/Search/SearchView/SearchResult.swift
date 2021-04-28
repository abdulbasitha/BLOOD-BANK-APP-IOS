//
//  SearchResult.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 21/04/21.
//

import SwiftUI

struct SearchResult: View {
    @State var data: [DonordataType]
    
    var body: some View {
       
        List(data) { value in
            NavigationLink(destination: MoreDeails(name: value.name, gp: value.gp, _class: value.place, _phone: value.phno, _date: value.expiry ?? "NAN").navigationBarTitle("", displayMode: .inline)
                        
) {
                HStack {
                   
                    Image("image")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(value.name)
                }
            }
          
        }
        
        
        
        
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(data: [])
    }
}
