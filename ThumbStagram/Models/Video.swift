//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Video {
    
    public var lowBandwidth : LowBandwidth?
    public var lowResolution : LowResolution?
    public var standardResolution : StandardResolution?
    
    init(dictionary:[String:Any]){
        if let lowBandwidthDic = dictionary["low_bandwidth"] as? [String:Any] {
            self.lowBandwidth = LowBandwidth(height: lowBandwidthDic["height"] as! Int,
                                             url: lowBandwidthDic["url"] as! String,
                                             width: lowBandwidthDic["width"] as! Int,
                                             id: lowBandwidthDic["id"] as! String)
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
