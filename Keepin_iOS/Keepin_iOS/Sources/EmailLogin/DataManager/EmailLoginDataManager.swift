//
//  EmailLoginDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/13.
//

import Alamofire
import Foundation

class EmailLoginDataManager {
    
    func postSignIn(_ parameters: EmailLoginRequest, viewController: EmailLoginVC) {
        AF.request("\(Constant.BASE_URL)/user/signin",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: Constant.USER_HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: EmailLoginResponse.self) { response in
                print(response.result)
                switch response.result {
                case .success(let response):
                    print("로그인 통신 성공~!")
                    Token.name = response.data?.name ?? "기본값"
                    print(response.data?.name)
                    viewController.didSuccessLogin(message: response.message, code: response.status)
                case .failure(let error):
                    print("로그인 통신 실패 ㅠ_ㅠ")
                    print(error.errorDescription)
                
                }
            }
    }
    
}
