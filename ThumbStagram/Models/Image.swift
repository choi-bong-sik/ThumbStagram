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
    }
}
