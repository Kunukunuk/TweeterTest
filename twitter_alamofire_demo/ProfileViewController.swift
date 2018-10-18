//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/18/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var numberOfTweetsLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    @IBOutlet weak var numberOfFavoritesLabel: UILabel!
    @IBOutlet weak var numberOfFollowingLabel: UILabel!
    @IBOutlet weak var followingAcceptionRate: UILabel!
    @IBOutlet weak var followingRejectionRate: UILabel!

    @IBOutlet weak var tableView: UITableView!
    var tweetsArray: [Tweet] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = User.current!
        if currentUser.profileImageURLHttps != nil {
            profileImageView.af_setImage(withURL: (User.current?.profileImageURLHttps)!)
        } else {
            profileImageView.image = UIImage(named: "account-icon")
        }
        nameLabel.text = currentUser.name
        screenNameLabel.text = currentUser.screenName
        
        numberOfTweetsLabel.text = String(currentUser.numberOfTweets!)
        numberOfFollowersLabel.text = String(currentUser.followerCount!)
        numberOfFollowingLabel.text = String(currentUser.followingCount!)
        numberOfFavoritesLabel.text = String(currentUser.favoriteCount!)
        
        followingAcceptionRate.text = String(currentUser.followingAcception!) + " %"
        followingRejectionRate.text = String(100 - currentUser.followingAcception!) + " %"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getTweets()
    }
    
    func getTweets() {
        
        APIManager.shared.getUserTimeline(with: (User.current?.screenName)!) { (tweets, error) in
            if error == nil {
                print("successful")
                for tweet in tweets! {
                    self.tweetsArray.append(tweet)
                    self.tableView.reloadData()
                }
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = tweetsArray.isEmpty ? 1 : tweetsArray.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        if !tweetsArray.isEmpty {
            cell.tweet = tweetsArray[indexPath.row]
        }
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
