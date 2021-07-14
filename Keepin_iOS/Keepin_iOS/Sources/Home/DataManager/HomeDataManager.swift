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
            .validate()
            .responseDecodable(of: HomeResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let title = response.data.title
                    let imgURL = response.data.photo
                    viewController.message = title
                    //viewController.image = imgURL
                    viewController.didSuccessGetRandom(message: response.message, imgURL: imgURL)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getReminderHome(_ viewController: HomeVC){
        AF.request("\(Constant.BASE_URL)/reminder/oncoming",
                   method: .get,
                   parameters: nil,
                   headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: HomeReminderResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let reminderList = response.data.reminders
                    viewController.reminderList = reminderList
                    viewController.didSuccessGetHomeReminder(list: reminderList)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        
    }
    
}
