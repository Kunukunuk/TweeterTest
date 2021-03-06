//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class User: NSObject {

//    var id : Int?
//    var idSTR: String?
    var name: String?
    var screenName: String?
    var followingCount: Int?
    var followerCount: Int?
    var verified: Int?
    var profileImageURL: URL?
    var profileImageURLHttps: URL?
    var followingRequestSent: Int?
    var favoriteCount: Int?
    var numberOfTweets: Int?
    var followingAcception: Double?
    
    private static var _current: User?
    var dictionary: [String: Any]?
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    init(dictionary: [String : Any]) {
        super.init()
        
        self.dictionary = dictionary
        
//        id = dictionary["id"] as? Int ?? 0
//        idSTR = dictionary["id_str"] as? String ?? "No id str"
        name = dictionary["name"] as? String ?? "No Name"
        screenName = "@" + (dictionary["screen_name"] as? String ?? "No screen name")
        followingCount = dictionary["following"] as? Int ?? 0
        followerCount = dictionary["followers_count"] as? Int ?? 0
        let profileString = dictionary["profile_image_url"] as? String ?? ""
        profileImageURL = URL(string: profileString)
        let profilStringHttps = dictionary["profile_image_url_https"] as? String ?? ""
        profileImageURLHttps = URL(string: profilStringHttps)
        
        followingRequestSent = dictionary["follow_request_sent"] as? Int ?? 0
        favoriteCount = dictionary["favourites_count"] as? Int ?? 0
        numberOfTweets = dictionary["statuses_count"] as? Int ?? 0
        
        if followingRequestSent == 0 {
            followingAcception = 0
        } else {
            followingAcception = Double(followingCount!) / Double(followingRequestSent!)
        }
    }
    
}
