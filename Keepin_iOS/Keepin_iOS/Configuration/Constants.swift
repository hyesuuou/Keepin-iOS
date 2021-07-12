//
//  Constants.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/29.
//

import Alamofire

struct Constant {
    static let BASE_URL = "http://keepin-alb-1248062252.ap-northeast-2.elb.amazonaws.com"
    static var USER_HEADER : HTTPHeaders = ["Content-Type": "application/json"]
    static var HEADER : HTTPHeaders = ["Content-Type": "application/json", "Jwt" : Token.jwt] 
}
