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
    @IBOutlet weak var countLabel: UILabel!
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
        
        tweetText.delegate = self

        tweetText.text = "What is your current status"
        tweetText.textColor = UIColor.lightGray
        countLabel.text = "0 / 280 limit"
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let characterLimit = 280
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        countLabel.text = "\(newText.count) / \(characterLimit) limit"
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
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
