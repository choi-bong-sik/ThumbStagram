//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Image {
    
    public var lowResolution : LowResolution!
    public var standardResolution : StandardResolution!
    public var thumbnail : Thumbnail!
    init(dictionary:[String:Any]){
        if let thumbnailDic = dictionary["low_resolution"] as? [String:Any] {
            self.thumbnail = Thumbnail(height: thumbnailDic["height"] as! Int,
                                       url: thumbnailDic["url"] as! String,
                                       width: thumbnailDic["width"] as! Int)
        }
        
        if let lowResolutionDic = dictionary["low_resolution"] as? [String:Any] {
            self.lowResolution = LowResolution(height: lowResolutionDic["height"] as! Int,
                                               url: lowResolutionDic["url"] as! String,
                                               width: lowResolutionDic["width"] as! Int)
        }
        
        if let standardResolutionDic = dictionary["standard_resolution"] as? [String:Any] {
            self.standardResolution = StandardResolution(height: standardResolutionDic["height"] as! Int,
                                                         url: standardResolutionDic["url"] as! String,
                                                         width: standardResolutionDic["width"] as! Int)
        }
    }
}
