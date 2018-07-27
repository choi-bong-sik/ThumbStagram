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

class RootViewController: UIViewController, RootViewProtocol, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentTableView: UITableView!
    
    var pagination: Pagination?
    var datas: [Data]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = Keychain(service: API.INSTAGRAM_DOMAIN)
        
        if let authToken = keychain[KEYCHAIN.INSTAGRAM_ACCESS_TOKEN] {
            print(authToken)
            callMediaRecentApi(authToken: authToken)
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
            "\(API.INSTAGRAM_DOMAIN)\(API.INSTAGRAM_MEDIA_RECENT_URI)?access_token=\(authToken)&count=10")
        {
            [weak self] (result, responseData, error) in
            guard let `self` = self else { return }
            if result {
                // 성공
                if let paginationDic = responseData!["pagination"] as? [String : Any] {
                    if let nextMaxId = paginationDic["next_max_id"], let nextUrl = paginationDic["next_url"] {
                        self.pagination = Pagination(nextMaxId: nextMaxId as! String, nextUrl: nextUrl as! String)
                    }
                }
                if let data:Array = responseData!["data"] as? Array<Dictionary<String,Any>> {
                    self.datas = data.map{
                        (dic) -> Data in
                        return Data(dictionary: dic)
                    }
                    self.contentTableView.reloadData()
                }else{
                    // no Datas
                }
            }else{
                // 실패
            }
        }
    }
    
    // MARK: - table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataCount = datas?.count {
            return dataCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierContent", for: indexPath) as! ContentTableViewCell
        let data = datas![indexPath.row]
        cell.lblUserName.text = data.user.username
        cell.lblCaptionText.text = data.caption.text
        cell.imgThumbNail.loadImageUsingCache(withUrl: data.user.profilePicture)
        cell.imgContnet.loadImageUsingCache(withUrl: data.images.thumbnail.url)
        return cell
    }
    
}

