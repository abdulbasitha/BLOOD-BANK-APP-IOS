//
//  Class.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 05/02/21.
//

import SwiftUI

struct Class: View {
    @Binding var _class:String
    @Binding var _active:String
    @Binding var _error_message:String
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack(){
                    Text("Your Class")
                        .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.padding([.horizontal])
            VStack(alignment: .leading){
                if(!_error_message.isEmpty){
                    Message(_error_message: $_error_message)
                }else{
                Text("Enter Your class below (eg. CS1)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("cantora_one", size: 22))
                    .foregroundColor(.gray)
                }
                
            }.padding()
                HStack(spacing:20){
                VStack{
                    TextField("Enter Class",text: $_class)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        .padding(15)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(UIColor.systemGray), lineWidth: 1))
                }
                VStack(){
                    Button(action: {
                        if(_class.isEmpty) {
                            _error_message = "Please Enter Your End Class"
                        }else {
                            _error_message = ""
                        withAnimation{
                       _active = "BEPART-NAME"
                        }
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

struct Class_Previews: PreviewProvider {
    static var previews: some View {
        Class(_class: Binding.constant(""),_active: Binding.constant(""), _error_message: Binding.constant(""))
    }
}
