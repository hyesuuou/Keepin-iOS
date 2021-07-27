//
//  MyPageProfileDataManager.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/27.
//
import Alamofire
import Foundation

class MyPageProfileDataManager {
    
    func getProfileInfo(viewcontroller: MyPageProfileVC){
        var url = "\(Constant.BASE_URL)/my/profile"
        
        AF.request(url, method: .get, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: MyPageProfileInfoResponse.self){ response in
                switch response.result{
                case .success(let response):
                    viewcontroller.serverData = response.data
                    viewcontroller.didSuccessProfileInfo(message: response.message)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func fixProfileName(modified: MyPageProfileNameRequest,viewcontroller: MyPageEditNameVC){
        var url = "\(Constant.BASE_URL)/my/profile"
        
        AF.request(url, method: .put ,parameters: modified, encoder: JSONParameterEncoder(),headers:Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: MyPageProfileNameResponse.self){ response in
                switch response.result{
                case .success(let response):
                    viewcontroller.didSuccessFixName(message: response.message)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
    }
    
    
    func fixProfilePhone(modified: MyPageProfilePhoneRequest, viewcontroller: MyPageEditPhoneVC){
        var url = "\(Constant.BASE_URL)/my/phone"
        
        AF.request(url, method: .put, parameters: modified, encoder: JSONParameterEncoder(), headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of:MyPageProfilePhoneResponse.self){ response in
                switch response.result{
                case .success(let response):
                    viewcontroller.didSuccessFixPhone(messasge: response.message)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func fixProfilePassword(modified: MyPageProfilePWRequest, viewcontroller: MyPageEditPwVC){
        var url = "\(Constant.BASE_URL)/my/password"
        
        AF.request(url, method: .put,parameters: modified, encoder: JSONParameterEncoder(), headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: MyPageProfilePhoneResponse.self){ response in
                switch response.result{
                case .success(let response):
                    viewcontroller.didSuccessPw(message: response.message)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
    
    
}
