//
//  OauthViewController.swift
//  ThumbStagram
//
//  Created by 최 봉식 on 2018. 7. 23..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import KeychainAccess
import Toast_Swift

struct KEYCHAIN {
    static let INSTAGRAM_ACCESS_TOKEN = "INSTAGRAM_ACCESS_TOKEN"
}

class AuthViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var delegate: RootViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let authURL = "\(API.INSTAGRAM_DOMAIN)\(API.INSTAGRAM_AUTH_URI)?client_id=\(PARAM.CLIENT_ID)&redirect_uri=\(PARAM.REDIRECT_URI)&response_type=token&scope=\(PARAM.SCOPE)&DEBUG=True"
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        webView.loadRequest(urlRequest)
    }
    func checkRequestForCallbackURLString(strURL: String) -> Bool {
        if strURL.hasPrefix(PARAM.REDIRECT_URI) {
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
        if let delegate = delegate {
            NetworkManager.sharedManager.authToken = authToken
            delegate.callMediaRecentApi(strUri: "",isLoadMore: false)
        }
        self.dismiss(animated: true)
    }
}

extension AuthViewController: UIWebViewDelegate{
    func webView(_ webView: UIWebView, shouldStartLoadWith request:URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        let requestURLString = (request.url?.absoluteString)! as String
        return checkRequestForCallbackURLString(strURL: requestURLString)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.view.makeToastActivity(ToastPosition.center)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.view.hideToastActivity()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.view.hideToastActivity()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
