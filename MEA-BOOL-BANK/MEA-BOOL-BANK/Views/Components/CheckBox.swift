//
//  CheckBox.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 10/02/21.
//

import SwiftUI

struct CheckBox: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedData:String
    var select:String
    var body: some View {
        VStack{
            Button(action: {
                selectedData = select
            }, label: {
                VStack(alignment:.center){
                    Text(self.select)
                        .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(select == selectedData ? Color(UIColor.white):colorScheme == .dark ? Color.white : Color.black)
                }.padding(10)
                .background(select == selectedData ? Colors.primary: Color(UIColor.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Colors.primary, lineWidth: 1)
                )
            })
           
        }
        
        
        
        
        
        
        
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(selectedData: Binding.constant("AB+"), select: "AB+")
    }
}
