//
//  MyPageDetailDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/14.
//

import Alamofire
import Foundation


class MyPageDetailDataManager{
    
    func getFriendInfo(_ parameter: String, viewController: MyPageDetailVC){
        var url = "\(Constant.BASE_URL)/friend/"
        url.append(parameter)
        
        AF.request(url ,method: .get, parameters: nil, headers: Constant.HEADER )
            .validate()
            .responseDecodable(of: MyPageDetailResponse.self){ response in
                switch response.result {
                case .success(let response):
                    viewController.name = response.data.name
                    viewController.num1 = response.data.total
                    viewController.num2 = response.data.given
                    viewController.num3 = response.data.taken
                    viewController.memoText = response.data.memo
                    viewController.didSuccessGetFriendInfo(message: response.message)
            
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}



