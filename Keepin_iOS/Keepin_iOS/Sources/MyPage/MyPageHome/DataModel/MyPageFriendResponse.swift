//
//  MyPageFriendResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/13.
//

import Foundation



// MARK: - FriendDataClass
struct MyPageFriendResponse: Codable {
    let status: Int
    let message: String
    let data: FriendList
}

// MARK: - FriendList
struct FriendList: Codable {
    let friends: [Friend]
}

// MARK: - Friend
struct Friend: Codable {
    let id, name: String
    let memo: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, memo
    }
}

