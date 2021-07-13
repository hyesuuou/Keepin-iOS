//
//  EmailLoginResponse.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/13.
//

import Foundation

// MARK: - EmailLoginResponse
struct EmailLoginResponse: Codable {
    let status: Int
    let message: String
    let data: EmailLoginData?
    
    init(from decoder : Decoder) throws
        {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = (try? values.decode(Int.self, forKey: .status)) ?? 404
            message = (try? values.decode(String.self, forKey: .message)) ?? ""
            data = (try? values.decode(EmailLoginData.self, forKey: .data)) ?? nil
        }
}

// MARK: - EmailLoginData
struct EmailLoginData: Codable {
    let jwt, refreshToken, name: String
}
