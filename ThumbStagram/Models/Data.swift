//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation

public struct Data {
    
    public var attribution : AnyObject!
    public var caption : Caption!
    public var comments : Comment!
    public var createdTime : String!
    public var filter : String!
    public var id : String!
    public var images : Image!
    public var likes : Like!
    public var link : String!
    public var location : AnyObject!
    public var tags : [String]!
    public var type : String!
    public var user : User!
    public var userHasLiked : Bool!
    public var usersInPhoto : [AnyObject]!
    public var videos : Video!
    
    init(dictionary:[String:Any]){
        self.attribution = dictionary["attribution"] as AnyObject
        self.caption = Caption(dictionary: dictionary["caption"] as! [String : Any])
        self.comments = Comment(dictionary: dictionary["comments"] as! [String : Any])
        self.createdTime = dictionary["created_time"] as! String
        self.filter = dictionary["filter"] as! String
        self.id = dictionary["id"] as! String
        self.images = Image(dictionary: dictionary["images"] as! [String : Any])
        self.likes = Like(dictionary: dictionary["likes"] as! [String:Any])
        self.link = dictionary["link"] as! String
        self.location = dictionary["location"] as AnyObject
        self.tags = dictionary["tags"] as! [String]
        self.type = dictionary["type"] as! String
        self.user = User(dictionary: dictionary["user"] as! [String : Any])
        self.userHasLiked = dictionary["user_has_liked"] as! Bool
        self.usersInPhoto = dictionary["users_in_photo"] as! [AnyObject]
        self.videos = Video(dictionary: dictionary["videos"] as! [String : Any])
    }
}
