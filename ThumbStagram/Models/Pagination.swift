//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Pagination {
    public var nextMaxId : String!
    public var nextUrl : String!
    
    init(dictionary:[String:Any]){
        self.nextMaxId = dictionary["next_max_id"] as! String
        self.nextUrl = dictionary["next_url"] as! String
    }
}
