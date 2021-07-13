//
//  MyPageHomeDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/13.
//

import Alamofire
import Foundation

class MyPageHomeDataManager{
    func getNumberKeepin(_ viewController: MyPageHomeVC){
        AF.request("\(Constant.BASE_URL)/my", method: .get , parameters: nil, headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: MyPageHomeResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let name = response.data.name
                    let total = response.data.total
                    let taken = response.data.taken
                    let given = response.data.given
                    
                    viewController.message = name
                    viewController.num1 = total
                    viewController.num2 = taken
                    viewController.num3 = given
                    viewController.didSuccessGetUser(message: response.message)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

