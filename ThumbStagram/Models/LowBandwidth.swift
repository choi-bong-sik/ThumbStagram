//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct LowBandwidth:ImageSpecProtocol {
    
    public var id : String
    public var height: Int
    public var url: String
    public var width: Int
    
    init(height:Int, url:String, width:Int, id:String) {
        self.height = height
        self.url = url
        self.width = width
        self.id = id
    }
}
