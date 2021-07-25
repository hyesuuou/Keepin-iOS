//
//  PlusFriendResponse.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/24.
//

import Foundation

struct PlusFriendResponse: Decodable {
    let status: Int
    let message, name: String
    
    enum CodingKeys: String,CodingKey{
        case status
        case message
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
    }

}
