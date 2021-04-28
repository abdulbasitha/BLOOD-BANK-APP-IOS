//
//  YearofStudy.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 22/01/21.
//

import SwiftUI

struct YearofStudy: View {
    @Binding var _endyear:String
    @Binding var textfield_visibily:Bool
    @Binding var _error_message:String
    @State var data = DataContants.end_years
    @Binding var _active:String
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack(){
                   
                    Text("End Year of Study")
                        .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }.padding([.horizontal])
            VStack(alignment: .leading){
                if(!_error_message.isEmpty){
                    Message(_error_message: $_error_message)
                }else{
                Text("Please Enter your end yesr of study")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("cantora_one", size: 22))
                    .foregroundColor(.gray)
                }
            }.padding()
            HStack(spacing:20){
                VStack{
                    TextField("*End Year",text: $_endyear)
                        .keyboardType(.numberPad)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        .padding(15)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(UIColor.systemGray), lineWidth: 1))
                        .onTapGesture {
                            withAnimation{
                            textfield_visibily.toggle()
                            }
                        }
                }
                VStack(){
                    Button(action: {
                        if(_endyear.isEmpty) {
                            _error_message = "Please Enter Your End Year of Study"
                        }else {
                            _error_message = ""
                        withAnimation{
                       _active = "BEPART-CLASS"
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
           
            textfield_visibily ?
              
                TextFieldPiker(data: data, visiblity: $textfield_visibily, _return: $_endyear)
               
                : nil
            
        }
    }
}

struct YearofStudy_Previews: PreviewProvider {
    static var previews: some View {
        YearofStudy(_endyear:Binding.constant(""), textfield_visibily: Binding.constant(false), _error_message: Binding.constant(""),_active: Binding.constant(""))
        
    }
}

