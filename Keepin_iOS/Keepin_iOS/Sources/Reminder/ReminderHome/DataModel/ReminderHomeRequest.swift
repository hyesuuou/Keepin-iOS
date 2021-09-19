//
//  ReminderHomeRequest.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Foundation

struct ReminderHomeRequest{
    var year : String
    var month: String
}

struct EraseRequest : Encodable{
    var reminderArray : [String]
}

struct ReminderAlarmRequest: Encodable{
    var isAlarm : Bool
}
