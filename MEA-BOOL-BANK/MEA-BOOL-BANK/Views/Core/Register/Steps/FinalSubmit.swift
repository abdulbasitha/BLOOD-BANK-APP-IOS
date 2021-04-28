//
//  Submit.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 14/04/21.
//

import SwiftUI

struct FinalSubmit: View {
    var StatusCode = Status()
    @State var message:String = ""
    
    @State var _loader:Bool = false
    @State private var showingAlert = false
    
    // data
//    @Binding var _active:String
    @Binding var _phone:String
    @Binding var _endyear:String
    @Binding var _class:String
    @Binding var _name:String
    @Binding var _blood:String
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("I here by declare that details furnished above are true i'am 18+ and willing to be a part of this charity").bold()
                    .frame(maxWidth:.infinity, alignment: .center)
                    .font(Font.custom("cantora_one", size: 22))
                    .foregroundColor(.gray)
            }.padding([.bottom])
            HStack{
                Button(action: {
                   
                    _loader.toggle()
                    let blood_group = EncodeBloodGroup(blood:_blood)
                    let data = "be-a-part.php?name=\(_name)&phno=\(_phone)&year=\(_endyear+"")&gp=\(blood_group )&place=\(_class)"
                    API().beAPart(data: data) { (status) in
                        print(status)
                        if (status == StatusCode.SUCCESS) {
                            message = "Registration Success"
                        }
                        else if (status == StatusCode.ALL_READY_REGISTER) {
                            message = "Already Registerted User"
                        }
                        else if (status == StatusCode.ERROR) {
                            message = "Sorry Something happend!!"
                        }
                        showingAlert.toggle()
                        _loader.toggle()
                    }
                }, label: {
                    HStack{
                        if (_loader){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        }
                        else {
                    Text("I AGREE")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                        }
                    }.padding(18)
                    .frame(maxWidth:.infinity)
                    .background(Colors.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                }).alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Message"), message: Text(message), dismissButton: .default(Text("Dismiss")){ print("df")})
                })
            }
        }.padding()
    }
}

struct FinalSubmit_Previews: PreviewProvider {
    static var previews: some View {
        FinalSubmit(
//            _active: Binding.constant(""),
               _phone:Binding.constant(""), _endyear:Binding.constant(""), _class:Binding.constant(""), _name:Binding.constant(""), _blood: Binding.constant("")
         )
    }
}
