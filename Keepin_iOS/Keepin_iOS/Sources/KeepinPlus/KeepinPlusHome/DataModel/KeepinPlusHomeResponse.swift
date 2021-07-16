//
//  KeepinPlusHomeResponse.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import Foundation

// MARK: - KeepinPlusHomeResponse
struct KeepinPlusHomeResponse: Codable {
    let status: Int
    let message: String
    let data: KeepinPlusHomeData
}

// MARK: - KeepinPlusHomeData
struct KeepinPlusHomeData: Codable {
    let keepinIdx: String
}
