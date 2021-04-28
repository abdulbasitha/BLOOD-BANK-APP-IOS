import UIKit

func test(data:Int)->Int{
    return data
}

var data:[String: Int] = [
    "Bob":32,
    "sds":12
]
let input = "123"

let New:Int = Int(input) ?? 12

test(data: 1234)

print("\(123)")

let Name = ["1","2","4","5"]

for (index,value) in Name.enumerated() {
    print("item-\(index) - \(value)")
}

protocol PrivateInfo { // interface
    func into()
}


class Student:PrivateInfo { // class
    func into() {
        print("private info")
    }
    
    private var Name:String
    private var RollNo:Int
    init(Name:String, Rollno:Int){
        self.Name = Name
        self.RollNo = Rollno
    }
    public func getInformation() {
        print(self.Name)
        print(self.RollNo)
    }
    
}

var ob  = Student(Name: "ABDUL BASITH", Rollno: 1)
ob.getInformation()
ob.into()

let jsonString = """
 [
    {
        "name": "Taylor Swift",
        "age": 26
    },
    {
        "name": "Justin Bieber",
        "age": 25
    }
 ]
 """

//let json = Data(jsonString.utf8)
//
//
//struct Person:Codable {
//    var name:String
//    var age:Int
//}
//
//let decoder = JSONDecoder()
//
//do {
//    let people = try decoder.decode([Person].self, from: json)
//    for i in people {
//        print(i.name)
//    }
//}catch {
//    print("err")
//}

let a:String? = nil // nullble string 
let b = "a"
print(b)

func factorial(n:Int){
    if n == 0

