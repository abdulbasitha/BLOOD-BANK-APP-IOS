//
//  AlertView.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 19/04/21.
//

import SwiftUI

struct AlertView: View {
    @Binding var message:String
    @Binding var showingAlert:Bool
    
    
    var body: some View {
        alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Message"), message: Text(message), dismissButton: .default(Text("Dismiss")){ print("df")
                
            })
        })
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(message: Binding.constant("TEST Message"), showingAlert: Binding.constant(true))
    }
}
