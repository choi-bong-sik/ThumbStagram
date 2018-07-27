//
//  CarouselMedia.swift
//  ThumbStagram
//
//  Created by 최 봉식 on 2018. 7. 25..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct CarouselMedia {
    
    public var images : Image!
    public var type : String
    public var usersInPhoto : [AnyObject]
    
    init(dictionary:[String:Any]){
        self.type = dictionary["type"] as! String
        self.usersInPhoto = dictionary["users_in_photo"] as! [AnyObject]
        self.images = Image(dictionary: dictionary["images"] as! [String : Any])
    }
}
