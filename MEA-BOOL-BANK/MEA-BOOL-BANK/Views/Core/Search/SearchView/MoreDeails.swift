//
//  MoreDeails.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 24/04/21.
//

import SwiftUI

struct MoreDeails: View {
    @State var name:String
    @State var gp:String
    @State var _class:String
    @State var _phone:String
    @State var _date:String!
    
    var body: some View {
     
        
        VStack{
            ZStack{
                GeometryReader { g in
                    VStack{
                        ZStack{
                            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                            ){
                            Image("image")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(name.uppercased())
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .foregroundColor(.white)
                                
                            }
                        }.frame(width: g.size.width, height: g.size.height/3, alignment: .center)
                        .background(Colors.primary)
                        VStack{
                            Text("BLOOD GROUP")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text(gp.uppercased())
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Colors.primary)
                                .padding()
                        }.padding()
                        VStack {
                            HStack(spacing: 40) {
                                Image("location")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text(_class.uppercased())
                                    .font(.title3)
                                Spacer()
                            }
                            HStack(spacing: 40) {
                                Image("phone")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text(_phone)
                                    .font(.title3)
                                Spacer()
                            }
                            HStack(spacing: 40) {
                                Image("date")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text(_date)
                                    .font(.title3)
                                
                                Spacer()
                            }
                        }.padding([.horizontal])
                        VStack {
                            Button(action: {
                                withAnimation{
                                    guard let number = URL(string: "tel://" + _phone) else { return }
                                    UIApplication.shared.open(number)
                                }
                            }, label: {
                                HStack(){
                                    Text("CALL NOW").foregroundColor(Color.white)
                                }.padding(15)
                                .frame(minWidth:150)
                                .background(Colors.primary)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            })
                        }.padding()
                       
                    }
                }
                
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MoreDeails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoreDeails(name: "", gp: "", _class: "", _phone: "", _date: "")
        
        }
    }
}
