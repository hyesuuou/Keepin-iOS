//
//  KeepinPlusHomeRequest.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import Foundation

// MARK: - KeepinPlusHomeRequest
struct KeepinPlusHomeRequest: Codable {
    let title: String
    let taken: Bool
    let date: String
    let category: [String]
    let record: String
    let friendIdx: [String]
}
