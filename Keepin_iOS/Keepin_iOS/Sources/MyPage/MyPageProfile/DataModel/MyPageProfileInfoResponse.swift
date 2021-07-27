//
//  MyPageProfileInfoResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/27.
//

import Foundation

struct MyPageProfileInfoResponse: Codable {
    let status: Int
    let message: String
    let data: ProfileData
}

struct ProfileData: Codable {
    let email, password, name, birth: String
    let phone: String
}
