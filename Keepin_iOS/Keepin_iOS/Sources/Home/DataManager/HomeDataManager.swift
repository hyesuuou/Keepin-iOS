//
//  HomeDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/12.
//

import Alamofire
import Foundation

class HomeDataManager {
    func getRandom(_ viewController: HomeVC){
        AF.request("\(Constant.BASE_URL)/random", method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: HomeResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.status == 200 {
                        viewController.message = response.data!.title
                        viewController.image = response.data!.photo
//                        let title = response.data!.title
//                        let imgURL = response.data!.photo
                        //viewController.didSuccessGetRandom(message: title, imgURL: imgURL)
                        viewController.didSuccessGetRandom()
                    }
                    else {
                        print(response.status)
                        viewController.message = ""
                        viewController.image = ""
                        viewController.didSuccessGetRandom()
                       // viewController.didSuccessGetRandom(message: "", imgURL: "")
                    }
                    
                case .failure(let error):
                    print(error)
                    print(error.localizedDescription)
                }
            }
    }
    
    func getReminderHome(_ viewController: HomeVC){
        AF.request("\(Constant.BASE_URL)/reminder/oncoming",
                   method: .get,
                   parameters: nil,
                   headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: HomeReminderResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let reminderList = response.data.reminders
                    viewController.reminderList = reminderList
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
