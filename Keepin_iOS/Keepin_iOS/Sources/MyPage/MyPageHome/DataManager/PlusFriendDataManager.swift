//
//  PlusFriendDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/24.
//
import Alamofire
import Foundation
import AVFoundation

class PlusFriendDataManager{
    
    func plusFriend(_ parameters: PlusFriendRequest, viewController: KeepinPlusFriendVC){
        AF.request("\(Constant.BASE_URL)/friend", method: .post , parameters: parameters,
                   encoder: JSONParameterEncoder(),headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: PlusFriendResponse.self){ response in
                switch response.result{
                case .success(let response):
                    viewController.didPlusFriend(message: response.message, code: response.status)
        
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
