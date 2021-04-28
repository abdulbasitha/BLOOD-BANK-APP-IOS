//
//  ContentView.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 02/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
         
            Index(_phone: "", _endyear: "", _class: "", _name: "", _blood: "", _text_Field_visibility: false, _error_message:"")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
        }
//        Welcome()
//        SignIn()
//       Splash()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
