//
//  ReminderDetailDataManager.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/16.
//

import Alamofire

class ReminderDetailDataManager {
    func reminders(_ parameter: String, viewController: ReminderAddVC) {
        var url = "\(Constant.BASE_URL)/reminder/detail/"
        url.append(parameter)
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: ReminderDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data!
                    viewController.didSuccessReminderDetail(message: response.message!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func reminderEdit(_ parameter: String, modified: ReminderDetailRequest, viewController: ReminderAddVC) {
        var url = "\(Constant.BASE_URL)/reminder/modify/"
        url.append(parameter)
        AF.request(url, method: .put, parameters: modified, encoder: JSONParameterEncoder(), headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: ReminderDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response.message!)
                    viewController.presentAlert(title: "", message: "수정이 완료되었습니다", isCancelActionIncluded: true) { action in
                        viewController.dismiss(animated: true, completion: nil)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.presentAlert(title: "", message: "수정에 실패했습니다", isCancelActionIncluded: true) { action in
                        viewController.dismiss(animated: true, completion: nil)
                    }
                }
            }
    }
    
    func reminderAdd(_ parameter: ReminderDetailRequest, viewController: ReminderAddVC) {
        AF.request("\(Constant.BASE_URL)/reminder", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: ReminderAddResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response.message!)
                    viewController.presentAlert(title: "", message: "이벤트가 등록되었습니다", isCancelActionIncluded: false) { action in
                        viewController.dismiss(animated: true, completion: nil)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.presentAlert(title: "", message: "이벤트 등록에 실패했습니다", isCancelActionIncluded: false) { action in
                        viewController.dismiss(animated: true, completion: nil)
                    }
                }
            }
    }
}
