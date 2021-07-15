//
//  ReminderHomeDataManager.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Foundation
import Alamofire

class ReminderHomeDataManager {
    func reminders(_ parameter: ReminderHomeRequest, viewController: ReminderVC) {
        let url = "\(Constant.BASE_URL)/reminder/date?year=\(parameter.year)&month=\(parameter.month)"
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: ReminderHomeResponse.self) { response in 
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    viewController.didSuccessReminders(message: response.message!) 
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func reminders(_ parameter: String, viewController: ReminderAddVC) {
        var url = "\(Constant.BASE_URL)/reminder/detail/"
        url.append(parameter)
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: ReminderDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
//                    viewController.didSuccessReminders(message: response.message!)
                    print(response.data!)
                    viewController.didSuccessReminderDetail(message: response.message!) 
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
