//
//  ComposeTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kun Huang on 10/17/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}

class ComposeTweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetText: UITextView!
    weak var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetText.delegate = self

        tweetText.text = "What is your curren status"
        tweetText.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    @IBAction func tweetTheTweet(_ sender: UIButton) {
        
        APIManager.shared.composeTweet(statusText: tweetText.text!) { (tweet: Tweet?, error: Error?) in
            if let error = error {
                print("Error 123***: \(error.localizedDescription)")
            } else {
                print("Successful!!: \(tweet?.text)")
                self.delegate?.did(post: tweet!)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func cancelTweet(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
