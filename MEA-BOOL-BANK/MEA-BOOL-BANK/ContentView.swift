//
//  ContentView.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 02/01/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
struct ContentView: View {
    @State var user = Auth.auth().currentUser
    var body: some View {
        
        NavigationView{
            if user != nil {
        
                Index(_phone: "", _endyear: "", _class: "", _name: "", _blood: "", _text_Field_visibility: false, _error_message:"")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            else {
              SignIn()
            }
        }
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SIGNIN"), object: nil, queue: .main) { (_) in

                self.user = Auth.auth().currentUser
            }
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SIGNOUT"), object: nil, queue: .main) { (_) in

                self.user = nil
            }
        }
    
      
//       Splash()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
