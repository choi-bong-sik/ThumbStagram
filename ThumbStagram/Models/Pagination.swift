//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Pagination {
    public var nextMaxId : String
    public var nextUrl : String
    
    init(nextMaxId:String, nextUrl:String){
        self.nextMaxId = nextMaxId
        self.nextUrl = nextUrl
    }
}
