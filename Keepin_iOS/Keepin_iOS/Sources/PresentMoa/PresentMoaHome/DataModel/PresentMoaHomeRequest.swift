//
//  PresentMoaHomeRequest.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/12.
//

import Foundation

struct PresentMoaHomeRequest: Encodable{
    var email : String
    var password : String
    var name : String
    var birth : String
    var phoneTaken : String
    var phone : String
}
