//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 22..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import KeychainAccess

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = Keychain(service: API.INSTAGRAM_DOMAIN)
        
        if let authToken = keychain[KEYCHAIN.INSTAGRAM_ACCESS_TOKEN] {
            print(authToken)
            NetworkManager.sharedManager.requestGet(uri: API.INSTAGRAM_DOMAIN+API.INSTAGRAM_MEDIA_RECENTURI+"?access_token=\(authToken)",
                                                    parameter: ["":""])
            {
                (result, responseData, error) in
                print(result)
                print(responseData)
            }
        }else{
            showAuthViewController()
        }
    }
    
    func showAuthViewController() {
        let vc: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Auth") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
}
