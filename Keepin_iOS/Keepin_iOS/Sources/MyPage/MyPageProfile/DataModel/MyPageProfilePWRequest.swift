//
//  MyPageProfilePWRequest.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/27.
//

import Foundation

struct MyPageProfilePWRequest: Codable {
    let currentPassword, newPassword: String
}
