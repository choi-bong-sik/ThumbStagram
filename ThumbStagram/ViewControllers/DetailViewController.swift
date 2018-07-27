//
//  DetailViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 27..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgThumbNail: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgContnet: UIImageView!
    @IBOutlet weak var lblCaptionText: UILabel!
    
    var contentData:ContentData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentData != nil {
            self.setViews()
        }
    }
    
    func setViews() {
        self.imgThumbNail.loadImageUsingCache(withUrl: contentData!.user.profilePicture)
        self.imgContnet.loadImageUsingCache(withUrl: contentData!.images.thumbnail.url)
        self.imgContnet.loadImageUsingCache(withUrl: contentData!.images.standardResolution.url)
        self.lblUserName.text = contentData!.user.fullName
        self.lblCaptionText.text = contentData!.caption.text
    }
}
