//
//  ReminderDetailRequest.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Foundation
struct ReminderDetailRequest : Encodable{
    var title : String?
    var date : String?
    var isAlarm : Bool?
    var daysAgo : String?
    var isImportant : Bool?
}
