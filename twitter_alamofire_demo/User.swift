//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: String?
    var screenName: String?
    var followingCount: Int?
    var followerCount: Int?
    var verified: Int?
    var profileImageString: String?
    
    var dictionary: [String: Any]?
    
    init(dictionary: [String : Any]) {
        super.init()
        
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String ?? "No Name"
        screenName = dictionary["screen_name"] as? String ?? "No screen name"
        followingCount = dictionary["following"] as? Int ?? 0
        followerCount = dictionary["followers_count"] as? Int ?? 0
        profileImageString = dictionary["profile_image_url"] as? String ?? ""
    }
    
}
