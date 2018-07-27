//
//  ViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 24..
//  Copyright © 2018년 jake. All rights reserved.
//

import Foundation


public struct ContentData {
    
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
    public var carouselMedia : [CarouselMedia]!
    
    init(dictionary:[String:Any]){
        if let attribution = dictionary["attribution"] {
            self.attribution = attribution as AnyObject
        }
        if let captionDic = dictionary["caption"] {
            self.caption = Caption(dictionary: captionDic as! [String : Any] )
        }
        if let commentsDic = dictionary["comments"] as? [String : Any] {
            self.comments = Comment(count: commentsDic["count"] as! Int)
        }
        if let createdTime = dictionary["created_time"] {
            self.createdTime = createdTime as! String
        }
        if let filter = dictionary["filter"] {
            self.filter = filter as! String
        }
        if let id = dictionary["id"]{
            self.id = id as! String
        }
        if let images = dictionary["images"]{
            self.images = Image(dictionary: images as! [String : Any])
        }
        if let likeDic = dictionary["likes"] as? [String:Any]{
            self.likes = Like(count: likeDic["count"] as! Int)
        }
        if let link = dictionary["link"] {
            self.link = link as! String
        }
        if let location = dictionary["location"]{
            self.location = location as AnyObject
        }
        if let tags = dictionary["tags"] {
            self.tags = tags as? [String]
        }
        if let type = dictionary["type"] {
            self.type = type as! String
        }
        if let userDic = dictionary["user"] as? [String:Any] {
            self.user = User(fullName: userDic["full_name"] as! String,
                             id: userDic["id"] as! String,
                             profilePicture: userDic["profile_picture"] as! String,
                             username: userDic["username"] as! String)
        }
        if let userHasLinked = dictionary["user_has_liked"] {
            self.userHasLiked = userHasLinked as! Bool
        }
        if let usersInPhoto = dictionary["users_in_photo"] {
            self.usersInPhoto = usersInPhoto as! [AnyObject]
        }
        if let videos = dictionary["videos"] {
            self.videos = Video(dictionary: videos as! [String : Any])
        }
        if let carousels:Array = dictionary["carousel_media"] as? Array<Dictionary<String,Any>> {
            self.carouselMedia = carousels.map { (dic) -> CarouselMedia in
                return CarouselMedia(dictionary: dic)
            }
        }
    }
}
