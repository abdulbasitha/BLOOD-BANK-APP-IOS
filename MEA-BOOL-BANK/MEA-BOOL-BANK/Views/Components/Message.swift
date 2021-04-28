//
//  Message.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 17/04/21.
//

import SwiftUI

struct Message: View {
    @Binding var _error_message:String
    var body: some View {
        HStack{
        Text(_error_message)
            .font(.title3)
            .bold()
            .multilineTextAlignment(.leading)
          
            .foregroundColor(Colors.primary)
            Spacer()
        }
        
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message(_error_message: Binding.constant("Test Error Message"))
    }
}
