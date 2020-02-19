//
//  ViewController.swift
//  Facebook_NewsFeed
//
//  Created by Ahmed.S.Elserafy on 7/27/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

// Cache meaning some hidding place eases/faciliate from the process of quick delivery
// Cache if your data showed before, then no problem we can call this data back again, coz it is stored at somewhere ours instaed of loading megabytes every time.

import UIKit

var posts = [Post]()

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "CellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Post.setupPostsAsItShouldBe()
        
         let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "diskPath")
        URLCache.shared = urlCache

        navigationItem.title = "News Feed"
        
        collectionView?.backgroundColor = UIColor(white:0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        cell.post = posts[indexPath.row]
        cell.feedController = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusPost = posts[indexPath.item].statusText {
            let rect = NSString(string: statusPost).boundingRect(with: CGSize(width: view.frame.size.width - 8 - 4, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownValues: CGFloat = 12 + 44 + 4 + 1 + 200 + 8 + 20 + 8 + 0.4 + 8 + 24 + 8 + 0.4 + 4 + 24 + 22
            return CGSize(width: view.frame.size.width, height: rect.height + knownValues)
        }
        
        return CGSize(width: view.frame.width, height:500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // When u change the size of the device, just invalidate layout and redraw yourself completely
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    let navBarCoverView = UIView()
    let tabBarCoverView = UIView()
    let blackBackgroundView = UIView()
    let zoomInView = UIImageView()
    var imageView : UIImageView?

    func animateWithImageView(imageView: UIImageView) {

        self.imageView = imageView
        
        blackBackgroundView.frame = self.view.frame
        blackBackgroundView.backgroundColor = .black
        // blackBackgroundView.alpha = 0
        view.addSubview(blackBackgroundView)
        
        if let keyWindow = UIApplication.shared.keyWindow {
        // navBar
        navBarCoverView.backgroundColor = .black
        navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 20 + 44 + 24)
        // to remove the navBar
        navBarCoverView.alpha = 0
         keyWindow.addSubview(navBarCoverView)
            
            //tabBar
            tabBarCoverView.backgroundColor = .black
            tabBarCoverView.frame = CGRect(x: 0, y: keyWindow.frame.height - 49 - 40, width: 1000, height: 49 + 40)
            tabBarCoverView.alpha = 0
            keyWindow.addSubview(tabBarCoverView)
        }
        
        // to give me absolute coordinate that I want
        if let startingView = imageView.superview?.convert(imageView.frame, to: nil) {
            
            imageView.alpha = 0
            zoomInView.frame = startingView
            zoomInView.backgroundColor = .red
            zoomInView.image = imageView.image
            zoomInView.isUserInteractionEnabled = true
            zoomInView.contentMode = .scaleAspectFill
            // a good aspect ratio
            zoomInView.clipsToBounds = true
            zoomInView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FeedController.zoomOut)))
            view.addSubview(zoomInView)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                let height = (self.zoomInView.frame.height * self.view.frame.width) / self.zoomInView.frame.width
                let y = self.view.frame.width - height / 2
                self.zoomInView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                // to animate blackBackgroundView
                self.blackBackgroundView.alpha = 1
                // to animate  navBar
                self.navBarCoverView.alpha = 1
                self.tabBarCoverView.alpha = 1
            }, completion: nil)
            UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        }
        
    }
    
    @objc func zoomOut() {
        
        if let startingView = imageView!.superview?.convert(imageView!.frame, to: nil) {
            UIView.animate(withDuration: 0.5, delay: 0 , usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                
                self.zoomInView.frame = startingView
                self.blackBackgroundView.alpha = 0
                // this will fade out the black nav, when u click the image
                self.navBarCoverView.alpha = 0
                self.tabBarCoverView.alpha = 0
                
                UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.normal
                
            }, completion: { (completed) in
                // to remove the zoomInView on the original one
                self.zoomInView.removeFromSuperview()
                //self.blackBackgroundView.removeFromSuperview()
                self.navBarCoverView.removeFromSuperview()
                self.tabBarCoverView.removeFromSuperview()
                self.imageView?.alpha = 1
            })
          
        
        }
    }
    
}



