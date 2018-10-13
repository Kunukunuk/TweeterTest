//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            if tweet.user?.profileImageURL != nil {
                print("*** \(tweet.user?.profileImageURL)")
                profileImageView.af_setImage(withURL: (tweet.user?.profileImageURL)!)
            }
            
            if tweet.user?.profileImageURLHttps != nil {
                print("*** \(tweet.user?.profileImageURLHttps)")
                profileImageView.af_setImage(withURL: (tweet.user?.profileImageURLHttps)!)
            }
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.user?.name
            screenNameLabel.text = tweet.user?.screenName
            dateLabel.text = tweet.createdAtString
            
            if tweet.favorited! {
                favoriteCountLabel.text = "\(tweet.favoriteCount ?? 0)"
                favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
            }
            if tweet.retweeted! {
                retweetCountLabel.text = "\(tweet.retweetCount ?? 0)"
                retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
