//
//  TweetDetailsViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/23/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tweetInfo = tweet {
            if tweetInfo.user?.profileImageURLHttps != nil {
                profileImageView.af_setImage(withURL: (tweetInfo.user?.profileImageURLHttps)!)
            }
            nameLabel.text = tweetInfo.user?.name
            screenName.text = tweetInfo.user?.screenName
            tweetTextLabel.text = tweetInfo.text
            
            if tweetInfo.favorited! {
                favoriteLabel.text = "\(tweetInfo.favoriteCount ?? 0)"
                favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
            } else {
                favoriteLabel.text = "\(tweetInfo.favoriteCount!)"
                favoriteButton.setImage(UIImage(named: "favor-icon"), for: .normal)
            }
            if tweetInfo.retweeted! {
                retweetLabel.text = "\(tweetInfo.retweetCount ?? 0)"
                retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            } else {
                retweetLabel.text = "\(tweetInfo.retweetCount!)"
                retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
            }
            
        }
        // Do any additional setup after loading the view.
    }
    

}
