//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 22..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import KeychainAccess
import Toast_Swift
protocol RootViewProtocol {
    func callMediaRecentApi(strUri:String)
}

class RootViewController: UIViewController, RootViewProtocol, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentTableView: UITableView!
    
    var pagination: Pagination?
    var contentDatas: [ContentData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = Keychain(service: API.INSTAGRAM_DOMAIN)
        contentDatas = Array()
        if let authToken = keychain[KEYCHAIN.INSTAGRAM_ACCESS_TOKEN] {
            NetworkManager.sharedManager.authToken = authToken
            callMediaRecentApi(strUri: "")
        }else{
            showAuthViewController()
        }
    }
    
    func showAuthViewController() {
        let vc: AuthViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Auth") as! AuthViewController
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    func callMediaRecentApi(strUri:String){
        self.view.makeToastActivity(ToastPosition.center)
        var uri = "\(API.INSTAGRAM_DOMAIN)\(API.INSTAGRAM_MEDIA_RECENT_URI)?access_token=\(NetworkManager.sharedManager.authToken)&count=\(PARAM.COUNT)"
        
        if strUri != "" {
            uri = strUri
        }
        
        NetworkManager.sharedManager.requestGet(uri: uri)
        {
            [weak self] (result, responseData, error) in
            guard let `self` = self else { return }
            self.view.hideToastActivity()
            if result {
                // 성공
                if let paginationDic = responseData!["pagination"] as? [String : Any] {
                    if let nextMaxId = paginationDic["next_max_id"], let nextUrl = paginationDic["next_url"] {
                        self.pagination = Pagination(nextMaxId: nextMaxId as! String, nextUrl: nextUrl as! String)
                    }else{
                        self.pagination = Pagination(nextMaxId: "", nextUrl: "")
                    }
                }
                if let data:Array = responseData!["data"] as? Array<Dictionary<String,Any>> {
                    for dic in data {
                        self.contentDatas!.append(ContentData(dictionary: dic))
                    }
                    self.contentTableView.reloadData()
                }else{
                    self.view.makeToast(ERROR_MESSAGE.NO_DATA)
                }
            }else{
                // 실패
            }
        }
    }
    
    // MARK: - table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataCount = contentDatas?.count {
            return dataCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierContent", for: indexPath) as! ContentTableViewCell
        let contentData = contentDatas![indexPath.row]
        cell.lblUserName.text = contentData.user.username
        cell.lblCaptionText.text = contentData.caption.text
        cell.imgThumbNail.loadImageUsingCache(withUrl: contentData.user.profilePicture)
        cell.imgContnet.loadImageUsingCache(withUrl: contentData.images.thumbnail.url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellContentData = contentDatas![indexPath.row]
        var vc = DetailViewController()

        if cellContentData.type == "carousel" {
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Carousel") as! CarouselViewController
        }else if cellContentData.type == "video" {
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Video") as! VideoViewController
        }else{
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        }
        vc.contentData = cellContentData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 10.0 {
            if self.pagination!.nextUrl == "" {
                self.view.makeToast(ERROR_MESSAGE.NOMORE_DATA)
            }else{
                callMediaRecentApi(strUri: self.pagination!.nextUrl)
            }
        }
    }
}

