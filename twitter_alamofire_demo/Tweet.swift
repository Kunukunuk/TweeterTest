//
//  Tweet.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var id: Int? // For favoriting, retweeting & replying
    var text: String? // Text content of tweet
    var favoriteCount: Int? // Update favorite count label
    var favorited: Bool? // Configure favorite button
    var retweetCount: Int? // Update favorite count label
    var retweeted: Bool? // Configure retweet button
    var user: User? // Author of the Tweet
    var createdAtString: String? // String representation of date posted
    
    // For Retweets
    var retweetedByUser: User?  // user who retweeted if tweet is retweet
    
    init(dictionary: [String : Any]) {
        super.init()
    }
    
}
