//
//  ReminderDetailDataResponse.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Foundation
struct ReminderDetailResponse: Decodable{
    var status : Int?
    var message : String?
    var data : MonthReminder?
}

struct ReminderAddResponse: Decodable{
    var status : Int?
    var message : String?
    var data : AddResponse?
}

struct AddResponse: Decodable{
    var sendDate : String?
    var message : String?
    var _id : String?
    var title : String?
    var date : String?
    var userIdx : String?
    var year : String?
    var month : String?
    var daysAgo : String?
    var __v : Int?
}
