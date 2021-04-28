//
//  SignIn.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 04/01/21.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        VStack()
        {
            
            VStack{
                Spacer()
                Logo()
            }
            
            VStack{
                Spacer()
                VStack{
                    HStack(){
                        Text("Sign In")
                            .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.padding([.horizontal])
                
                HStack{
                    Text("'There is no great enjoy than saving a soul.'This is a platform designed for emergency blood assistance")
                        .font(Font.custom("cantora_one", size: 22))
                      
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.gray)
                    
                }.padding()
                VStack{
                    Button(action: {
                        // action soon
                    }, label: {
                        HStack{
                            Spacer()
                            Image("google") .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                            Text("Sign In with Google").foregroundColor(.red)
                            Spacer()
                        }.padding(10).overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Colors.primary, lineWidth: 1)
                        )
                        
                    })
                    
                }.padding([.horizontal])
            }

        }.padding()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
