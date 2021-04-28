//
//  Blood.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 08/02/21.
//

import SwiftUI

struct Blood: View {
    @Binding var _blood:String
    let _bloodGroups = DataContants._blood_groups
    @State var selectedColor: Color?
    @Binding var _active:String
    @Binding var _error_message:String
    var body: some View {
        VStack{
            Spacer()
            
            VStack{
                HStack(){
                    Text("Choose Blood Type")
                        .scaledToFill()
                        .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                }
                if(!_error_message.isEmpty){
                    Message(_error_message: $_error_message)
                }
            }
                
            VStack(){
                HStack(spacing:30){
                    ForEach(0..<4){ i in
                        CheckBox(selectedData: self.$_blood, select: _bloodGroups[i])
                    }
                }.padding()
                HStack(spacing:30){
                    ForEach(4..<8){ i in
                        CheckBox(selectedData: self.$_blood, select: _bloodGroups[i])
                    }
                }
                
            }.padding([.bottom])
            
            HStack(spacing:20){
                Button(action: {
                    if(_blood.isEmpty) {
                        _error_message = "Please Select Your Blood Group"
                    }else {
                    withAnimation{
                        _active = "BEPART-SUBMIT"
                       
                    }
                    }
                }, label: {
                    HStack(){
                        Text("CONTINUE")
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                    }.padding(18)
                    .frame(maxWidth:.infinity)
                    .background(Colors.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                })
            }
        }.padding()
    }
}

struct Blood_Previews: PreviewProvider {
    static var previews: some View {
        Blood(_blood: Binding.constant(""), _active: Binding.constant(""), _error_message: Binding.constant(""))
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
