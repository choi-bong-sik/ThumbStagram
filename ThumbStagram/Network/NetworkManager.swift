//
//  NetworkManager.swift
//  ThumbStagram
//
//  Created by 최 봉식 on 2018. 7. 23..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import Alamofire

struct API{
    static let INSTAGRAM_DOMAIN = "https://api.instagram.com"
    static let INSTAGRAM_AUTHURI = "/oauth/authorize/"
    static let INSTAGRAM_MEDIA_RECENTURI = "/v1/users/self/media/recent/"
    static let INSTAGRAM_CLIENT_ID = "be7de216a2aa4fa79d61e181643beaad"
    static let INSTAGRAM_CLIENTSERCRET = "2a096a4b800944e89a1eae6348e487e1"
    static let INSTAGRAM_REDIRECT_URI = "https://devjake.blogspot.com/"
    static let INSTAGRAM_SCOPE = "public_content"
}

struct PARAM {
    static let
}

class NetworkManager: NSObject {
    static let sharedManager: NetworkManager = {
        return NetworkManager()
    }()
    func requestPOST(uri: String, parameter: Parameters, completion:@escaping (_ result: Bool, _ data: Dictionary<String, Any>?, _ error: Error?) -> Void){
        SessionManager.default.request(uri, method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: nil).responseData {
            [weak self] responseData in
            guard let `self` = self else { return }
            print(responseData)
            switch responseData.result {
            case .success(let data):
                print(data)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    func requestGet(uri: String, parameter: Parameters, completion:@escaping (_ result: Bool, _ data: Dictionary<String, Any>?, _ error: Error?) -> Void){
        print(parameter)
        
        SessionManager.default.request(uri, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseData {
            [weak self] responseData in
            guard let `self` = self else { return }
            print(responseData)
            switch responseData.result {
            case .success(let data):
                guard let responseDataStr: String = String(data:data , encoding: .utf8) else {
                    // 디코딩 실패
                    completion(false,["Result":"R310"],nil)
                    return
                }
                print(responseDataStr)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
