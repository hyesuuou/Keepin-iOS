//
//  PresentDetailDataManager.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/13.
//

import Alamofire

class PresentDetailDataManager {
    func details(_ parameter: String, viewController: PresentDetailVC) {
        var url = "\(Constant.BASE_URL)/keepin/detail/"
        url.append(parameter)
        
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: PresentDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    viewController.didSuccessDetail(message: response.message!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
