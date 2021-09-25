//
//  MyPagePresentMoaResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/15.
//

import Foundation

// MARK: - Empty
struct MyPagePresentMoaResponse: Codable {
    let status: Int
    let message: String
    let data: Keepins2?
}

// MARK: - DataClass
struct Keepins2: Codable {
    let keepins: [KeepinList]
}

// MARK: - Keepin
struct KeepinList: Codable {
    let id, title: String
    let photo: String
    let date: String
    let taken: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, photo, date, taken
    }
}


