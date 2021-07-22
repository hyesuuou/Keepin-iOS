//
//  MyPageDetailResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/14.
//


import Foundation


struct MyPageDetailResponse: Codable {
    let status: Int
    let message: String
    let data: DetailDataClass
}

struct DetailDataClass: Codable {
    let name: String
    let total, taken, given: Int
    let memo: String
}

