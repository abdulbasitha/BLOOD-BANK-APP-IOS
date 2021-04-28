//
//  Welcome.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 17/01/21.
//

import SwiftUI

struct Welcome: View {
    @Binding var _active:String
    var body: some View {
       
        VStack{
            Spacer()
            VStack{
                HStack(){
                    Text("Welcome")
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
            HStack(spacing:20){
                VStack{
                    Button(action: {
                        // action soon
                    }, label: {
                        HStack(){
                            NavigationLink(
                                destination: Serach(_blood: "", _department: "", blood_textfield_visibily: false, department_textfield_visibily: false, _loader: false, showingAlert: false, _error_message: "")
                            
                                ,
                                label: {
                                    
                                    Text("NEED BLOOD ?").foregroundColor(Colors.primary)
                                    
                                })
                      
                        }.padding(15)
                        .frame(minWidth:150)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Colors.primary, lineWidth: 1)
                        )
                    })
                }
                VStack(){
                    Button(action: {
                        withAnimation{
                       _active = "BEPART-PH"
                        }
                    }, label: {
                        HStack(){
                            Text("BE A PART").foregroundColor(Color.white)
                        }.padding(15)
                        .frame(minWidth:150)
                        .background(Colors.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    
                    
                }
            }
        }.padding()
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(_active: Binding.constant(""))
    }
}
