//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Comment {
    public var count : Int!
    init(dictionary:[String:Any]){
        self.count = dictionary["count"] as? Int
    }
}
