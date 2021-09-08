//
//  KeepinPlusMainDataManager.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/09/05.
//

import Foundation
import Alamofire

struct KeepinAddService {
    
    static let shared = KeepinAddService()
    
    func postKeepin(title: String,
                    taken: Bool,
                    date: String,
                    category: [String],
                    record: String?,
                    friendIdx: [String],
                    imageData: UIImage,
                    completion: @escaping (NetworkResult<Any>) -> Void) {
        
//
//        var parameters: [String: Any] = [:]
//
//        switch friendIdx.count {
//        case 1:
//            parameters = [
//                "title": title,
//                "taken": taken,
//                "date": date,
//                "category": category,
//                "record": record ?? "",
//                "friendIdx": friendIdx[0]
//            ]
//
//            // ** 여기 수정 필요 -> friendIdx 두개라서 키 겹쳐서 오류남 **
//        case 2:
//            parameters = [
//                "title": title,
//                "taken": taken,
//                "date": date,
//                "category": category,
//                "record": record ?? "",
//                "friendIdx": friendIdx[0],
//                "friendIdx": friendIdx[1]
//            ]
//        case 3:
//            parameters = [
//                "title": title,
//                "taken": taken,
//                "date": date,
//                "category": category,
//                "record": record ?? "",
//                "friendIdx": friendIdx[0],
//                "friendIdx": friendIdx[1],
//                "friendIdx": friendIdx[2]
//            ]
//        default:
//            return
//        }
        
        let parameters: [String: Any] = [
            "title": title,
            "taken": taken,
            "date": date,
            "category": category,
            "record": record ?? "",
            "friendIdx": friendIdx
        ]
        
       // let jsondata: Parameters
        
       
        
        let url = "\(Constant.BASE_URL)/keepin/all"
        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Content-Type" : "application/json",
            "jwt" : "\(Token.jwt)" ]
        
        
        //multipart 업로드
        AF.upload(multipartFormData: { (multipart) in
            if let imageData = imageData.jpegData(compressionQuality: 1) {
                multipart.append(imageData, withName: "photo", fileName: "\(imageData).jpg", mimeType: "image/jpeg")
                //이미지 데이터를 POST할 데이터에 덧붙임
            }
//
//            let jsondata = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//            let jsonString = String(data: jsondata!, encoding: .utf8)
//            print(jsonString!)
//            multipart.append((jsonString?.data(using: String.Encoding.utf8)!)!, withName: "json")
    
            
            for (key, value) in parameters {
                
                if ((key == "category") || (key == "friendIdx")) {
                    
                    for idx in value as! [String] {
                        multipart.append("\(idx)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
                    }
                    
                }
                else {
                    multipart.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
                //이미지 데이터 외에 같이 전달할 데이터 (여기서는 user, emoji, date, content 등)
                }
            }
        }, to: url    //전달할 url
        ,method: .post        //전달 방식
        ,headers: header).responseJSON(completionHandler: { (response) in    //헤더와 응답 처리
            print(response)
            
            if let err = response.error{    //응답 에러
                print(err)
                return
            }
            print("success")        //응답 성공


        })
        

    }
    
}
