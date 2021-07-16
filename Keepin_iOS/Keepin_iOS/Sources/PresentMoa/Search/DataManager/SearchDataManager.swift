//
//  SearchDataManager.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/12.
//

import Alamofire

class SearchDataManager {
    func getPresents(_ viewController: SearchVC) {
        AF.request("\(Constant.BASE_URL)/keepin/all?title=", method: .get, parameters: nil, headers: Constant.HEADER)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: PresentMoaHomeResponse.self) { response in 
                switch response.result {
                case .success(let response):
                    viewController.serverData = response.data
                    viewController.didSuccessSearch(message: response.message!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getCategory(_ parameter: String, viewController: AfterCatVC) {
        var urlString = "\(Constant.BASE_URL)/keepin/category?category="
        urlString.append(parameter)
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        
        AF.request(url, method: .get, parameters: nil, headers: Constant.HEADER)
            .validate()
            .responseDecodable(of: PresentMoaHomeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.status == 200{
                        viewController.serverData = response.data
                        viewController.getCategory(message: response.message!)
                    }
                    else{
                        viewController.failedToRequest(message: response.message!)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
