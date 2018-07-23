//
//  OauthViewController.swift
//  ThumbStagram
//
//  Created by 최 봉식 on 2018. 7. 23..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import KeychainAccess

struct KEYCHAIN {
    static let INSTAGRAM_ACCESS_TOKEN = "INSTAGRAM_ACCESS_TOKEN"
}

class AuthViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let authURL = String(format: "%@%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True",
                             arguments: [API.INSTAGRAM_DOMAIN,API.INSTAGRAM_AUTHURI,API.INSTAGRAM_CLIENT_ID,API.INSTAGRAM_REDIRECT_URI, API.INSTAGRAM_SCOPE])
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        webView.loadRequest(urlRequest)
    }
    func checkRequestForCallbackURLString(strURL: String) -> Bool {
        if strURL.hasPrefix(API.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = strURL.range(of: "#access_token=")!
            handleAuth(authToken: String(strURL[range.upperBound...]))
            return false;
        }
        return true
    }
    func handleAuth(authToken: String) {
        print("Instagram authentication token ==", authToken)
        let keychain = Keychain(service: API.INSTAGRAM_DOMAIN)
        keychain[KEYCHAIN.INSTAGRAM_ACCESS_TOKEN] = authToken
        self.dismiss(animated: true) {
            
        }
    }
}

extension AuthViewController: UIWebViewDelegate{
    func webView(_ webView: UIWebView, shouldStartLoadWith request:URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        let requestURLString = (request.url?.absoluteString)! as String
        return checkRequestForCallbackURLString(strURL: requestURLString)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
