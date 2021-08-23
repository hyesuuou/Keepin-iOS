//
//  JoinRequest.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/13.
//

import Foundation

// MARK: - JoinRequest
struct JoinRequest: Codable {
    let email, password, name, birth: String
    let phoneToken, phone: String
}

// MARK: - JoinEmailRequest
struct JoinEmailRequest: Codable {
    let email: String
}

