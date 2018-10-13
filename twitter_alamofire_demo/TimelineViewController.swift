//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    var tweetsArray: [Tweet] = []
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        getTweets()
        // Do any additional setup after loading the view.
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        tweetsArray.removeAll()
        getTweets()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTweets() {
        APIManager.shared.getHomeTimeLine { (tweets: [Tweet]?, error: Error?) in
            if error == nil {
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
        
        cell.tweet = tweetsArray[indexPath.row]
        return cell
    }
    
    
    @IBAction func tapLogout(_ sender: UIBarButtonItem) {
        
        APIManager.logout()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
