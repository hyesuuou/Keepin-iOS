//
//  MyPagePresentMoaDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/15.
//

import Foundation
import Alamofire


class MyPagePresentMoaDataManager{
    
    //static var presentList : [KeepinList] = []
    
    func gotPresent(_ parameter: String, viewController: MyPageDetailVC){
        let url = "\(Constant.BASE_URL)/friend/keepin/\(parameter)?taken=true"
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: MyPagePresentMoaResponse.self){ response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
//                    MyPagePresentMoaDataManager.presentList = response.data.keepins
//                    print(response.data.keepins)
                   viewController.didSuccessGetPresentInfo(message: response.message)
                case .failure(let error):
                    print("getPresent")
                    print(error.localizedDescription)
                }
            }
    }
    
    func givePresent(_ parameter: String, viewController: MyPageDetailVC){
        let url = "\(Constant.BASE_URL)/friend/keepin/\(parameter)?taken=false"
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: MyPagePresentMoaResponse.self){ response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    print(response.data)
                    viewController.didSuccessGetPresentInfo(message: response.message)
                    
                case .failure(let error):
                    print("givePresent")
                    print(error.localizedDescription)
                }
            }
    }
    
}
