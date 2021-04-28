//
//  WebServices.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 14/04/21.
//

import Foundation

struct DonordataType: Identifiable, Codable {
    var id :String
    var name:String
    var phno:String
    var gp:String
    var place:String
    var expiry:String?
}
struct statusDataType: Codable{
    var status:String
}
class API {
    func searchData(data:String, completion: @escaping ([DonordataType],String)-> ()){
        let StatusCode = Status()
        guard let url = URL(string: API_URL + data) else {
            return
        }
     
        URLSession.shared.dataTask(with: url) {(response, _ , _) in
            do {
                let data =  try JSONDecoder().decode([DonordataType].self, from: response!)
                DispatchQueue.main.async {
                    completion(data, StatusCode.SUCCESS)
                }
            }catch let error{
                completion([], StatusCode.ERROR)
            }
          
          
        }.resume()
    
    }
    func beAPart(data:String, completion: @escaping (String) -> ()){
        let data = data
        guard let url = URL(string: API_URL + data) else { return }
        URLSession.shared.dataTask(with: url) { (response, _, _) in
            let data = try! JSONDecoder().decode([String].self, from: response!)
           
            DispatchQueue.main.async {
                completion(data[0])
            }
        }
        .resume()
    }
    
}

// be-a-part.php?name=test&phno=9544752155&year=2017&gp=A%2B&place=cs1
// https://m-blood-bank.herokuapp.com/mea-blood-bank/fetch.php?gp=A%2B&place=
