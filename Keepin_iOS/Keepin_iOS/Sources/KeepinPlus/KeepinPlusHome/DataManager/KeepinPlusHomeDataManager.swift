//
//  KeepinPlusHomeDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import Alamofire
import Foundation

class KeepinPlusHomeDataManager {
    
    func postKeepin(_ parameters: KeepinPlusHomeRequest, viewController: KeepinPlusVC) {
        AF.request("\(Constant.BASE_URL)/keepin",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: KeepinPlusHomeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.addId = response.data.keepinIdx
                    print(response.data.keepinIdx)
                    //self.postKeepin(<#T##parameters: KeepinPlusHomeRequest##KeepinPlusHomeRequest#>, viewController: <#T##KeepinPlusVC#>)
                case .failure(let error):
                    print(error.errorDescription)
                }
                
            }
    }
    
    //func postImageKeepin(
}
