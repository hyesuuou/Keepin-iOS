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
