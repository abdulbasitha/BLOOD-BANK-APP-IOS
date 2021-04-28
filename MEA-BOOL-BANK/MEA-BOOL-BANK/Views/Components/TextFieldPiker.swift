//
//  TextFieldPiker.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 23/01/21.
//

import SwiftUI

struct TextFieldPiker: View {
    @State var data:Array<Any>
    @Binding var visiblity:Bool
    @Binding var _return:String
    @State private var _return_index = 0
    
    @State private var selectedColor = 0
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    visiblity.toggle()
                }, label: {
                    Text("Done")
                })
            }.padding(.horizontal)
            VStack(){
          
                Picker(selection:$_return_index.onChange(dataChange), label: Text("Select One")) {
                    
                    Text(verbatim: "Select a Item").tag(0)
                        .foregroundColor(Color.black)
                    ForEach(0 ..< data.count){
                        Text(verbatim: data[$0] as! String).tag($0+1)
                            .foregroundColor(Color.black)
                    }
                
                }.background(Colors.gray)
                
                .pickerStyle(WheelPickerStyle())
                        .labelsHidden()
            
            }
        }.onAppear(perform: {
            self.hideKeyboard()
        })
    }
    func dataChange(_ tag: Int) {
        self._return = self.data[tag] as! String
    }
    struct TextFieldPiker_Previews: PreviewProvider {
        static var previews: some View {
            TextFieldPiker(data: (["2017","2018","2020","2021"]), visiblity: Binding.constant(true), _return: Binding.constant("22"))
        }
    }
}
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
            })
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
