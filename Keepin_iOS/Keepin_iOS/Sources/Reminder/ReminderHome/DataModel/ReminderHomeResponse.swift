//
//  ReminderHomeResponse.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Foundation
struct ReminderHomeResponse: Decodable{
    var status : Int?
    var message : String?
    var data : MonthReminders?
}

struct MonthReminders: Decodable{
    var reminders : [MonthReminder?]
}

struct MonthReminder: Decodable{
    var isAlarm : Bool?
    var isImportant : Bool?
    var _id : String?
    var title : String?
    var date : String?
}
