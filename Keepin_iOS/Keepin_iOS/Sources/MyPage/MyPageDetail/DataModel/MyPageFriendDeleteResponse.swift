//
//  MyPageFriendDeleteResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/26.
//

import Foundation

struct MyPageFriendDeleteResponse: Codable {
    let status: Int
    let message: String
    
    enum CodingKeys: String,CodingKey{
        case status
        case message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }

}
