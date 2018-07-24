//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct LowBandwidth {
    public var height : Int!
    public var id : String!
    public var url : String!
    public var width : Int!

    init(dictionary:[String:Any]){
        self.height = dictionary["height"] as! Int
        self.id = dictionary["id"] as! String
        self.url = dictionary["url"] as! String
        self.width = dictionary["width"] as! Int
    }
}
