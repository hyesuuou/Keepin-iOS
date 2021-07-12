//
//  PresentMoaHomeDataManager.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/12.
//

import Foundation
import Alamofire

class PresentMoaHomeDataManager {
    func got(_ viewController: PresentMoaVC) {
        AF.request("\(Constant.BASE_URL)/keepin?taken=true", method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: PresentMoaHomeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    viewController.didSuccessGot(message: response.message!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func gave(_ viewController: PresentMoaVC) {
        AF.request("\(Constant.BASE_URL)/keepin?taken=false", method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: PresentMoaHomeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    viewController.didSuccessGave(message: response.message!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
