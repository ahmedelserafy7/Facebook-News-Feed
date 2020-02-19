//
//  FeedCell.swift
//  Facebook_NewsFeed
//
//  Created by Ahmed.S.Elserafy on 8/4/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit

//var imageCache = NSCache<AnyObject, AnyObject>()

class FeedCell: UICollectionViewCell {
    
    var feedController = FeedController()
    
    @objc func animation() {
        
        feedController.animateWithImageView(imageView: postImageView)
    }
    
    var post: Post? {
        
        didSet {
            if ((post?.name) != nil) {
                setupLabelsWithName()
            }
            if let status = post?.statusText {
                statusPost.text = status
            }
            
            if let statusImageUrl = post?.statusImageUrl {
                URLSession.shared.dataTask(with: URL(string: statusImageUrl)!, completionHandler: { (data , response, error) in
                    
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    // load the image inside imageView
                    let image = UIImage(data: data!)
                    // every time we load the image, then we set it to be the image
                    //      imageCache.setObject(image!, forKey: statusImageUrl as AnyObject)
                    
                    DispatchQueue.main.async {
                        self.postImageView.image = image
                        
                        
                        
                        if let indicitor = self.viewWithTag(self.tag) as? UIActivityIndicatorView{
                            indicitor.startAnimating()
                        }
                    }
                    
                }).resume()
                
            }
            
            
            if let profileImageName = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName)
                
            }
            
            if let likesPost = post?.likes {
                if let commentsPost = post?.comments {
                    likesCommentsPost.text = "\(likesPost)M likes  \(commentsPost)K Comments"
                }
            }
            
        }
        
    }
    
    private func setupLabelsWithName() {
        
        let attributedText = NSMutableAttributedString(string: (post?.name)!, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "\nDecember 18 • San Francisco • ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rbg(red: 155, green: 161, blue: 171)]))
        
        
        let paragraghStyle = NSMutableParagraphStyle()
        paragraghStyle.lineSpacing = 4
        // attributedText.string.charcters.count means use the enitre attributed text(count the every little charcter)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraghStyle, range: NSMakeRange(0, attributedText.string.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        nameLabel.attributedText = attributedText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.rbg(red: 51, green: 90, blue: 149)
        label.numberOfLines = 2
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        // imageView.backgroundColor = .red
        imageView.image = UIImage(named: "zuckprofile")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let statusPost: UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile, Beast turned to the dark side."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        // imageView.image = UIImage(named: "zuckdog")
        // (aspect fit) to be the aspect ratio proporation is 1:1
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        //to cut off the extended pixels
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let likesCommentsPost: UILabel = {
        let label = UILabel()
        label.text = "1M Likes  15.2K Comments"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.rbg(red: 155, green: 161, blue: 171)
        return label
    }()
    let dividedLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rbg(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedCell.buttonsWithImages(title: "Like", image: "like")
    let commentButton = FeedCell.buttonsWithImages(title: "Comment", image: "comment")
    let shareButton = FeedCell.buttonsWithImages(title: "Share", image: "share")
    
    static func buttonsWithImages(title: String, image: String)-> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rbg(red: 143, green: 158, blue: 163), for: .normal)
        button.setImage(UIImage(named:image), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write a comment..."
        return textField
    }()
    
    let commentdividedLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rbg(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let profileCommentView: UIImageView = {
        let profileView = UIImageView()
        profileView.image = UIImage(named: "gandhi")
        profileView.layer.cornerRadius = 10
        profileView.layer.masksToBounds = true
        return profileView
    }()
    
    let commentView: UIView = {
        let view = UIView()
        return view
    }()
    
    func setupViews() {
        
        backgroundColor = .white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusPost)
        addSubview(postImageView)
        addSubview(likesCommentsPost)
        addSubview(dividedLine)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        commentView.addSubview(commentdividedLine)
        commentView.addSubview(commentTextField)
        commentView.addSubview(profileCommentView)
        addSubview(commentView)
        postImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FeedCell.animation)))
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-4-|", views: statusPost)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: postImageView)
        addConstraintsWithFormat(format: "H:|-18-[v0]", views: likesCommentsPost)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividedLine)
        
        // "v0(v2)" Specify v0 to be space of v2 ... Share the space equally based on v2
        //Sharing the horizantally space equally by the right edge to be the base "v2"
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton,commentButton,shareButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: commentView)
        commentView.addConstraintsWithFormat(format: "H:|-8-[v0(18)]-8-[v1]-8-|", views: profileCommentView,commentTextField)
        
        commentView.addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: commentdividedLine)
        
        addConstraintsWithFormat(format: "V:|-20-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-12-[v0(44)]-4-[v1]-1-[v2(200)]-8-[v3(20)]-8-[v4(0.4)]-8-[v5(24)]-42-|", views: profileImageView,statusPost,postImageView,likesCommentsPost,dividedLine,likeButton)
        addConstraintsWithFormat(format: "V:[v0(24)]-42-|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(24)]-42-|", views: shareButton)
        addConstraintsWithFormat(format: "V:[v0(40)]-2-|", views: commentView)
        
        commentView.addConstraintsWithFormat(format: "V:|-6-[v0(0.4)]-8-[v1(20)]", views: commentdividedLine, profileCommentView)
        commentView.addConstraintsWithFormat(format: "V:[v0]-6-|", views: commentTextField)
        
    }
    
}
