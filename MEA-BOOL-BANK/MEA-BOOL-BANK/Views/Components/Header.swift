//
//  Header.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 06/01/21.
//

import SwiftUI
import SafariServices
import Firebase
import GoogleSignIn


struct Header: View {
    @State private var showingAlert = false
    @State var user = Auth.auth().currentUser
    let url:String?
    init() {
        url = Auth.auth().currentUser?.photoURL?.absoluteString
     
    }
    var body: some View {
        HStack{
            Button(action: {
                self.showingAlert = true
                print(type(of:user?.photoURL?.path))
            }, label: {
                if (user?.photoURL == nil){
                Image("image")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else {
                    Image(uiImage : "\(url!)".load())
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .cornerRadius(10)
                }
            }).alert(isPresented: $showingAlert) {
                Alert(title: Text("Warning"), message: Text("Are you sure want to logout!"),primaryButton:Alert.Button.default(
                        Text("YES"),action: {
                            GIDSignIn.sharedInstance()?.signOut()
                            
                            try! Auth.auth().signOut()
                            NotificationCenter.default.post(name: NSNotification.Name("SIGNOUT"), object: nil)
                        }),
                        secondaryButton:.default(Text("NO")))}
            Spacer()
            Button(action: {
                guard let url = URL(string: "http://google.com/") else {
                    return
                }
                UIApplication.shared.open(url) 
                
            }, label: {
                Image("admin").resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
            })
            
        }.padding([.horizontal])
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

extension String {
    func load()-> UIImage {
        do {
            guard let url = URL(string:  self) else {
                return UIImage()
            }
            let data:Data = try Data(contentsOf: url)
        
            return UIImage(data: data) ?? UIImage()
         
        }catch {
     
        }
        return UIImage()
    }
}
