//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Caption {
    
    public var createdTime : String
    public var from : From?
    public var id : String
    public var text : String
    init(dictionary:[String:Any]){
        self.createdTime = dictionary["created_time"] as! String
        if let fromDic = dictionary["from"] as? [String:Any] {
            self.from = From(fullName: fromDic["full_name"] as! String,
                             id: fromDic["id"] as! String,
                             profilePicture: fromDic["profile_picture"] as! String,
                             username: fromDic["username"] as! String)
        }
        self.id = dictionary["id"] as! String
        self.text = dictionary["text"] as! String
    }
}
