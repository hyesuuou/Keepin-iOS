//
//  HomeResponse.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/12.
//

import Foundation
//우리가 서버쪽에서 받는 데이터 model
//ex: 로그인 API
//주의점 : 변수이름은 서버쪽에서 받는 데이터 example과 반 드 시 동일하게 맞출것!!

// MARK: - HomeResponse
struct HomeResponse: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, title, photo: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, photo
    }
}

// MARK:- 홈 리마인더 2개 Get Datamodel
struct HomeReminderResponse: Codable {
    let status: Int
    let message: String
    let data: HomeReminderData
}

// MARK: - HomeReminderData
struct HomeReminderData: Codable {
    let reminders: [Reminder]
}

// MARK: - Reminder
struct Reminder: Codable {
    let isImportant: Bool
    let id, title, date: String

    enum CodingKeys: String, CodingKey {
        case isImportant
        case id = "_id"
        case title, date
    }
}

