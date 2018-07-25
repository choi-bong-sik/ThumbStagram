//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct From {
    public var fullName : String
    public var id : String
    public var profilePicture : String
    public var username : String
    init(fullName:String, id:String, profilePicture:String,username:String){
        self.fullName = fullName
        self.id = id
        self.profilePicture = profilePicture
        self.username = username
    }
}
