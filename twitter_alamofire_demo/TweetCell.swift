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
                profileImageView.af_setImage(withURL: (tweet.user?.profileImageURL)!)
            }
            
            if tweet.user?.profileImageURLHttps != nil {
                profileImageView.af_setImage(withURL: (tweet.user?.profileImageURLHttps)!)
            }
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.user?.name
            screenNameLabel.text = tweet.user?.screenName
            dateLabel.text = tweet.createdAtString
            
            replyCountLabel.text = "0"
            
            if tweet.favorited! {
                favoriteCountLabel.text = "\(tweet.favoriteCount ?? 0)"
                favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
            } else {
                favoriteCountLabel.text = "0"
            }
            if tweet.retweeted! {
                retweetCountLabel.text = "\(tweet.retweetCount ?? 0)"
                retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            } else {
                retweetCountLabel.text = "0"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func replyButton(_ sender: UIButton) {
    }
    

    @IBAction func retweetButton(_ sender: UIButton) {
        
        if tweet.retweeted! {
            tweet.retweetCount! -= 1
        } else {
            tweet.retweetCount! += 1
        }
        tweet.retweeted = !tweet.retweeted!
        refreshData()
    }
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        
        if tweet.favorited! {
            tweet.favoriteCount! -= 1
        } else {
            tweet.favoriteCount! += 1
        }
        tweet.favorited = !tweet.favorited!
        refreshData()
        /*APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }*/
    }
    
    @IBAction func messageButton(_ sender: UIButton) {
    }
    
    func refreshData() {
        if tweet.favorited! {
            favoriteCountLabel.text = "\(tweet.favoriteCount ?? 0)"
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        } else {
            favoriteCountLabel.text = "\(tweet.favoriteCount!)"
            favoriteButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
        if tweet.retweeted! {
            retweetCountLabel.text = "\(tweet.retweetCount ?? 0)"
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
        } else {
            retweetCountLabel.text = "\(tweet.retweetCount!)"
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
