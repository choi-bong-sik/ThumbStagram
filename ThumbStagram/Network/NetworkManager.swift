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
    static let INSTAGRAM_AUTHURL = "https://api.instagram.com/oauth/authorize/"
    static let INSTAGRAM_CLIENT_ID = "be7de216a2aa4fa79d61e181643beaad"
    static let INSTAGRAM_CLIENTSERCRET = "2a096a4b800944e89a1eae6348e487e1"
    static let INSTAGRAM_REDIRECT_URI = "https://devjake.blogspot.com/"
    static let INSTAGRAM_ACCESS_TOKEN = ""
//    static let INSTAGRAM_SCOPE = “follower_list+public_content” /* add whatever scope you need https://www.instagram.com/developer/authorization/ */
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
        SessionManager.default.request(uri, method: .get, parameters: parameter, encoding: URLEncoding.httpBody, headers: nil).responseData {
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
}
