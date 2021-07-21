//
//  KeepinPlusHomeDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import Alamofire
import Foundation
import SwiftyJSON

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
                    //viewController.didSuccessPostKeepinHalf()
                    
                case .failure(let error):
                    print(error.errorDescription)
                }
                
            }
    }
    
}



struct MyPageProfileImageUploadService {
    static let shared = MyPageProfileImageUploadService()

    func uploadImage(image : UIImage, completion: @escaping (NetworkResult<Any>) -> Void) {
            
            //guard let userToken = UserDefaults.standard.string(forKey: "token") else {return}
            
            
            
            let header: HTTPHeaders = ["content-Type": "multipart/form-data",
                                       "token" : Token.jwt]
        
        
        AF.upload(multipartFormData: { multipartFormData in
         
            if let imageData = image.jpegData(compressionQuality: 1){
                multipartFormData.append(imageData, withName: "profileImage",fileName: ".jpeg",mimeType: "image/jpeg")
            }
            
            
        }, to: "http://keepin-alb-1248062252.ap-northeast-2.elb.amazonaws.com/keepin/photo/60f1b0c46b1f1128386d6193", usingThreshold:  UInt64.init(), method: .post,
        headers: header).response { response in
            
                
                
                    guard let statusCode = response.response?.statusCode else { return }
 
                    let networkResult = self.judge(by: statusCode)
                    completion(networkResult)
                

            }
        }
    
   
    
    


        private func judge(by statusCode: Int) -> NetworkResult<Any>  {
            switch statusCode {

            case 200...299: return .success("1")
            case 400...499: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }
        

    
    

}
