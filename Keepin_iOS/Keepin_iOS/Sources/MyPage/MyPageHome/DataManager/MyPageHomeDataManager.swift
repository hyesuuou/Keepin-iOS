//
//  MyPageHomeDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/13.
//

import Alamofire
import Foundation

class MyPageHomeDataManager{
    
    static var friendList : [Friend] = []
    
    func getNumberKeepin(_ viewController: MyPageHomeVC){
        AF.request("\(Constant.BASE_URL)/my", method: .get , parameters: nil, headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: MyPageHomeResponse.self){ response in
                switch response.result {
                case .success(let response):
                    viewController.member = response.data.name
                    viewController.count1 = response.data.total
                    viewController.count2 = response.data.taken
                    viewController.count3 = response.data.given
                    viewController.didSuccessGetUser(message: response.message)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getNumberFriend(_ viewController: MyPageHomeVC){
        AF.request("\(Constant.BASE_URL)/friend",method: .get, parameters: nil,
                   headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: MyPageFriendResponse.self){ response in
                switch response.result {
                case .success(let response):
                    //viewController.friendServerData = response.data
                    
                    MyPageHomeDataManager.friendList = response.data.friends
                    viewController.didSuccessGetFriend(friendList: response.data.friends)
                    print(MyPageHomeDataManager.friendList)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    print("나오지마라")
                }
            }
    }
}

