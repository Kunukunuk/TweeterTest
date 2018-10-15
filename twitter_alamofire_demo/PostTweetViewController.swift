//
//  PostTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class PostTweetViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var tweetText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetText.delegate = self
        
        tweetText.text = "What is your curren status"
        tweetText.textColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
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
