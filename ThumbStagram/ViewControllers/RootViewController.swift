//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 22..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import KeychainAccess

protocol RootViewProtocol {
    func callMediaRecentApi(authToken:String)
}

class RootViewController: UIViewController, RootViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = Keychain(service: API.INSTAGRAM_DOMAIN)
        
        if let authToken = keychain[KEYCHAIN.INSTAGRAM_ACCESS_TOKEN] {
            print(authToken)
            
        }else{
            showAuthViewController()
        }
    }
    
    func showAuthViewController() {
        let vc: AuthViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Auth") as! AuthViewController
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    func callMediaRecentApi(authToken:String){
        NetworkManager.sharedManager.requestGet(uri:
            "\(API.INSTAGRAM_DOMAIN)\(API.INSTAGRAM_MEDIA_RECENT_URI)?access_token=\(authToken)")
        {
            (result, responseData, error) in
            print(result)
            print(responseData)
        }
    }
}

