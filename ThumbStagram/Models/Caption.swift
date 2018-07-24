//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Caption {
    
    public var createdTime : String!
    public var from : From!
    public var id : String!
    public var text : String!
    init(dictionary:[String:Any]){
        self.createdTime = dictionary["created_time"] as! String
        self.from = From(dictionary: dictionary["from"] as! [String : Any])
        self.id = dictionary["id"] as! String
        self.text = dictionary["text"] as! String
    }
}
