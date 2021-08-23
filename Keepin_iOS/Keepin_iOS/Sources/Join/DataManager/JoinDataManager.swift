//
//  JoinDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/13.
//

import Alamofire
import Foundation

// MARK:- 회원가입 데이터매니저
class JoinDataManager {
    
    func postSignup(_ parameters: JoinRequest, viewController: JoinSecondVC){
        AF.request("\(Constant.BASE_URL)/user/signup",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: Constant.USER_HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: JoinResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    viewController.didSuccessJoin(message: response.message,
                                                  code: response.status)
                case .failure(let error):
                    print(error.errorDescription)
                }
                
            }
    }
    
    func postEmailCheck(_ parameters: JoinEmailRequest, viewController: JoinFirstVC){
        AF.request("\(Constant.BASE_URL)/user/email/check",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: Constant.USER_HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: JoinResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response.message)
                    viewController.didSuccessJoinEmailCheck(message: response.message,
                                                            code: response.status)
                case .failure(let error):
                    print(error.errorDescription)
                }
                
            }
    }
    
}
