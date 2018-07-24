//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Video {
    
    public var lowBandwidth : LowBandwidth!
    public var lowResolution : LowResolution!
    public var standardResolution : StandardResolution!
    init(dictionary:[String:Any]){
        self.lowBandwidth = LowBandwidth(dictionary: dictionary["low_bandwidth"] as! [String : Any])
        self.lowResolution = LowResolution(dictionary: dictionary["low_resolution"] as! [String:Any])
        self.standardResolution = StandardResolution(dictionary: dictionary["standard_resolution"] as! [String:Any])
    }
}
