//
//  Welcome.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 06/01/21.
//

import SwiftUI

struct Index: View {
    @State var _phone:String
    @State var _endyear:String
    @State var _class:String
    @State var _name:String
    @State var _blood:String
    @State var _text_Field_visibility:Bool
    @State var _active:String = "WELCOM"
    @State var _error_message:String
    var body: some View {
        
        VStack()
        {
            
            VStack{
                Header()
                Spacer()
                Logo()
                Spacer()
            }
            if _active == "WELCOM" {
               
                Welcome(_active:$_active).transition(.move(edge: .bottom))

            }
            else if _active == "BEPART-PH" {
          
                PhoneNumber(phone: $_phone,_active:$_active, _error_message: $_error_message).transition(.move(edge: .bottom))
            }
             if _active == "BEPART-YEAR"{
                
                YearofStudy(_endyear: $_endyear, textfield_visibily: $_text_Field_visibility, _error_message: $_error_message,_active:$_active)
                    .transition(.move(edge: .bottom))
            }
            else if _active == "BEPART-CLASS" {
                    Class(_class: $_class,_active:$_active,_error_message: $_error_message).transition(.move(edge: .bottom))
            }
            else if _active == "BEPART-NAME" {
                Name(_name: $_name,_active:$_active, _error_message: $_error_message).transition(.move(edge: .bottom)).transition(.move(edge: .bottom))
            }
            else if _active == "BEPART-BLOOD" {
             Blood(_blood:$_blood,_active:$_active,_error_message: $_error_message).transition(.move(edge: .bottom))
            }
            else if _active == "BEPART-SUBMIT" {
                    FinalSubmit(_phone: $_phone, _endyear:$_endyear, _class: $_class, _name: $_name, _blood: $_blood).transition(.move(edge: .bottom))
            }
            
//
//            PhoneNumber(phone: $_phone)
//            YearofStudy(_endyear: $_endyear, textfield_visibily: $_text_Field_visibility)
//            Class(_class: $_class)
//            Name(_name: $_name)
//            Blood(_blood: $_name)
            
        }
    }
}

struct Index_Previews: PreviewProvider {
    static var previews: some View {
        Index(_phone: "", _endyear: "", _class: "", _name: "", _blood: "", _text_Field_visibility: false, _error_message: "")
    }
}


