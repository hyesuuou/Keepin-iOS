//
//  PresentDetailResponse.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/13.
//

import Foundation
struct PresentDetailResponse: Decodable{
    var status : Int?
    var message : String?
    var data : Details?
}

struct Details: Decodable{
    var _id : String?
    var title : String?
    var photo : [String?]
    var friends : [FriendInfo?]
    var record : String?
    var category : [String?]
    var date : String?
    var taken : Bool?
}

struct FriendInfo: Decodable{
    var _id : String?
    var name : String?
}
