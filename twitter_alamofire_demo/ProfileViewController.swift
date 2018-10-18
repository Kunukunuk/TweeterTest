//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/18/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if User.current?.profileImageURLHttps != nil {
            profileImageView.af_setImage(withURL: (User.current?.profileImageURLHttps)!)
        } else {
            profileImageView.image = UIImage(named: "account-icon")
        }
        nameLabel.text = User.current?.name
        screenNameLabel.text = User.current?.screenName
        // Do any additional setup after loading the view.
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
