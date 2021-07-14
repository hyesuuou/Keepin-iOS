//
//  MyPageDetailDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/14.
//

import Foundation
import Alamofire

class MyPageDetailDataManager{
    
    func getFriendInfo(_ viewController: MyPageDetailVC){
        
        AF.request("\(Constant.BASE_URL)/friend/:friendId"
                   ,method: .get, parameters: nil, headers: Constant.HEADER )
            .validate()
            .responseDecodable(of: MyPageDetailResponse.self){ response in
                switch response.result {
                case .success(let response):
                    viewController.friendName = response.data.name
                    viewController.allNum = response.data.total
                    viewController.giveNum = response.data.given
                    viewController.gotNum = response.data.taken
                    viewController.didSuccessGetFriendInfo(messsage: response.message)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
