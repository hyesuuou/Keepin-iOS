//
//  MyPageHomeResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/13.
//

import Foundation

struct MyPageHomeResponse: Decodable{
    let status: Int
    let message: String
    let data: HomeDataClass
}

struct HomeDataClass: Decodable{
    let name: String
    let total,taken,given: Int
}
 

