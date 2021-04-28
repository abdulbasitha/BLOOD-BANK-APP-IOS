//
//  Splash.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 02/01/21.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        VStack(){
            Spacer()
            Logo()
            Spacer()
            Text("@BY TECHZIA").font(.caption).foregroundColor(.gray)
            
          
        }
       
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
