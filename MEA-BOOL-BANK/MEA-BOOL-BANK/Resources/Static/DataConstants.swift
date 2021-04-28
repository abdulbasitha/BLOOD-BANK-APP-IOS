//
//  DataConstants.swift
//  MEA-BOOL-BANK
//
//  Created by ABDUL BASITH A on 04/02/21.
//

import Foundation
import SwiftUI

let API_URL = "https://m-blood-bank.herokuapp.com/mea-blood-bank/"

struct DataContants {
    static let end_years = endYearsRender()
    static let _blood_groups:[String] = ["A-","B-","AB-","O-","A+","B+","AB+","O+"]
    static let _blood_group_encoded:[String:String] =  ["A-":"A-","B-":"B-","AB-":"AB-","O-":"O-","A+":"A%2B","B+":"B%2B","AB+":"AB%2B","O+":"O%2B"]
    static let _departments:[String]  = ["CS", "IT", "ME", "CE", "EE", "EC"]
}

func endYearsRender()->Array<Any> {
    var years:Array<Any> = []
    let year = Calendar.current.component(.year, from: Date())
    for i in 0...4 {
        years.append(String(year+i))
    }
    return years
}

func EncodeBloodGroup (blood:String)->String {
    return DataContants._blood_group_encoded[blood]!
}

