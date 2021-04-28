//
//  PhoneNumber.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 17/01/21.
//

import SwiftUI

struct PhoneNumber: View {
    @Binding var phone:String
    @Binding var _active:String
    @Binding var _error_message:String
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack(){
                    Text("Create account")
                        .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }.padding([.horizontal])
            VStack(alignment: .leading){
               
                if(!_error_message.isEmpty){
                    Message(_error_message: $_error_message)
                }else{
                Text("Please Enter your mobile number")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("cantora_one", size: 22))
                    .foregroundColor(.gray)
                }
                
            }.padding()
                HStack(spacing:20){
                VStack{
                    TextField("9876543210",text: $phone)
                        .keyboardType(.numberPad)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        
                        .padding(15)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(UIColor.systemGray), lineWidth: 1))
                }
                VStack(){
                    Button(action: {
                        if(phone.isEmpty) {
                            _error_message = "Please Enter Your Phone Number"
                        }else {
                            _error_message = ""
                        withAnimation{_active = "BEPART-YEAR"}
                        }
                    }, label: {
                        HStack(){
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }.padding(18)
                       
                        .background(Colors.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                }
                }.padding()
        }
    }
}

struct PhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumber(phone:Binding.constant(""),_active: Binding.constant(""), _error_message: Binding.constant(""))
}
}
