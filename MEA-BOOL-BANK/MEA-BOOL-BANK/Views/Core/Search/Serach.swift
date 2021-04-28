//
//  Serach.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 18/04/21.
//

import SwiftUI

struct Serach: View {
    var StatusCode = Status()
    @State var _blood:String
    @State var _department:String
    @State var blood_textfield_visibily:Bool
    @State var department_textfield_visibily:Bool
    @State var action: Bool = false
    @State var _loader:Bool
    @State var showingAlert:Bool
    @State var response:[DonordataType] = []
  
    
@State var _error_message:String
    
     var blood_groups = DataContants._blood_groups
    var departments = DataContants._departments
        
        var body: some View {
            
            VStack{
                VStack{
//                    Header()
                    Spacer()
                    Logo()
                    Spacer()
                    HStack(){
                        Text("Search")
                            .scaledToFill()
                            .font(Font.custom(fontName.primary, size: CGFloat(fontSize.h1)))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                VStack{
                    if(!_error_message.isEmpty){
                        Message(_error_message: $_error_message)
                    }
                    TextField("*Blood Group",text: $_blood)
                        .keyboardType(.numberPad)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        .padding(15)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(UIColor.systemGray), lineWidth: 1))
                        .onTapGesture {
                            withAnimation{
                                department_textfield_visibily = false
                                blood_textfield_visibily.toggle()
                             
                            }
                        }
                    TextField("Department",text: $_department)
                       
                     
                        .disableAutocorrection(false)
                        .padding(15)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(UIColor.systemGray), lineWidth: 1))
                        .onTapGesture {
                            withAnimation{
                                blood_textfield_visibily = false
                                department_textfield_visibily.toggle()
                               
                            }
                        }
                }
                
                HStack(spacing:20){
                  
                    Button(action: {
                        if(_blood.isEmpty) {
                            _error_message = "Please Select Your Blood Group"
                            showingAlert = true
                        }else {
                         
                            let data = "fetch.php?gp=\(EncodeBloodGroup(blood: _blood))&place=\(_department)"
                            API().searchData(data: data){ (response,status) in
                                if(status == StatusCode.SUCCESS) {
                                    self.response = response
                                  action = true
//                                    print(response)
                                   
                                }
                                else if (status == StatusCode.ERROR){
                                    _error_message = "No Data Found!!"
                                    showingAlert = true
                                }
                                                      }
                        }
                    }, label: {
                        VStack{
                           
                        HStack(){
                            Text("Search")
                                .font(.body)
                                .bold()
                                .foregroundColor(.white)
                        }.padding(18)
                        .frame(maxWidth:.infinity)
                        .background(Colors.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    }).alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("Message"), message: Text(_error_message), dismissButton: .default(Text("Dismiss")){
                            _error_message = ""
                            showingAlert = false
                        })
                    })
                }
            }.padding()
            blood_textfield_visibily ?
                TextFieldPiker(data: blood_groups, visiblity: $blood_textfield_visibily, _return: $_blood)
                : nil
            department_textfield_visibily ?
                TextFieldPiker(data: departments, visiblity: $department_textfield_visibily, _return: $_department)
                : nil
            NavigationLink(destination: SearchResult(data: response).navigationTitle("Results")
                           , isActive: $action) {
             Text("")
            }
        }
      
    
}

struct Serach_Previews: PreviewProvider {
    static var previews: some View {
        Serach(_blood: "", _department: "", blood_textfield_visibily: true, department_textfield_visibily: true, _loader: false, showingAlert: false, _error_message: "")
    }
}
