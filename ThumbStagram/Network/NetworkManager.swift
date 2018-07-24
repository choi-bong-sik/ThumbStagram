//
//  NetworkManager.swift
//  ThumbStagram
//
//  Created by 최 봉식 on 2018. 7. 23..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct API{
    static let INSTAGRAM_DOMAIN = "https://api.instagram.com"
    static let INSTAGRAM_AUTH_URI = "/oauth/authorize/"
    static let INSTAGRAM_MEDIA_RECENT_URI = "/v1/users/self/media/recent/"
    static let INSTAGRAM_CLIENT_ID = "be7de216a2aa4fa79d61e181643beaad"
    static let INSTAGRAM_CLIENTSERCRET = "2a096a4b800944e89a1eae6348e487e1"
    static let INSTAGRAM_REDIRECT_URI = "https://devjake.blogspot.com/"
    static let INSTAGRAM_SCOPE = "public_content"
}

class NetworkManager: NSObject {
    static let sharedManager: NetworkManager = {
        return NetworkManager()
    }()
    
    func requestGet(uri: String,
                    completion:@escaping (_ result: Bool, _ data: Dictionary<String, Any>?, _ error: Error?) -> Void)
    {
        print("request uri :: \(uri)")
        SessionManager.default.request(uri, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData {
            responseData in
            switch responseData.result {
            case .success(let data):
                do {
                    let resultDic = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    completion(true,resultDic,nil)
                } catch {
                    completion(false,nil,error)
                }
                break
            case .failure(let error):
                completion(false,nil,error)
                break
            }
        }
    }
}
