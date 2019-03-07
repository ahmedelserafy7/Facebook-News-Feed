//
//  tabController.swift
//  Facebook_NewsFeed
//
//  Created by Ahmed.S.Elserafy on 8/10/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit

class tabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = UICollectionViewFlowLayout()
        let feedConrtoller = FeedController(collectionViewLayout: collectionView)
        let navigationController = UINavigationController(rootViewController: feedConrtoller)
        navigationController.title = "News Feed"
        navigationController.tabBarItem.image = UIImage(named:"news_feed_icon")
        
        let chatTabBar = UIViewController()
        chatTabBar.navigationItem.title = "My Chat"
        let messengerController = UINavigationController(rootViewController: chatTabBar)
        messengerController.title = "Messenger"
        messengerController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        
        let friendsRequestsController = UINavigationController(rootViewController: FriendRequestsController())
        friendsRequestsController.title = "Friends Requests"
        friendsRequestsController.tabBarItem.image = UIImage(named: "requests_icon")
        
        viewControllers = [navigationController,friendsRequestsController, messengerController,viewControllersWithtitleAndIcons(title: "More", icon: "more_icon")]
        tabBar.isTranslucent = false
        
        //CALayer is as describing what is happening underneath the hood of UIView
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rbg(red: 229, green: 231, blue: 235).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
    }
    
     func viewControllersWithtitleAndIcons(title:String, icon: String) -> UINavigationController{
        
        let viewController = UINavigationController(rootViewController: UIViewController())
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: icon)
        return viewController
    
    }
}
