//
//  Posts.swift
//  Facebook_NewsFeed
//
//  Created by Ahmed.S.Elserafy on 8/9/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit

class Post {
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImage: String?
    var statusImageUrl: String?
    var likes: Float?
    var comments: Float?
    
    
    static func setupPostsAsItShouldBe() {
        let markPost = Post()
        markPost.name = "Mark zuckerberg"
        markPost.statusText = "By giving people the power to share, we ’re making the worldmore transparent."
        markPost.profileImageName = "zuckprofile"
        markPost.statusImage = "zuckdog"
        markPost.statusImageUrl = "http://www.tech-wd.com/wd/wp-content/uploads/2016/05/markzuckerberg2007-e1400081922221.jpeg"
        markPost.likes = 1.99
        markPost.comments = 43.894
        posts.append(markPost)
        
        let stevePost = Post()
        stevePost.name = "Steve Jobs"
        stevePost.statusText = "Most people make the mistake of thinking design is what it looks like.\n" + "\nPeople think it’s this veneer – that the designers are handed this box and told, “Make it look good!” That’s not what we think design is.\n" + "It’s not just what it looks like and feels like." + "\nDesign is how it works."
        stevePost.profileImageName = "steve_profile"
        stevePost.statusImage = "steve_status"
        stevePost.statusImageUrl = "https://fortunedotcom.files.wordpress.com/2015/09/steve-jobs.jpg"
        stevePost.likes = 3.4
        stevePost.comments = 105.965
        posts.append(stevePost)
        
        
        let gandhiPost = Post()
        gandhiPost.name = "Mahatma gandhi"
        gandhiPost.statusText = "Live as if you were to die tomorrow. Learn as if you were to live forever.\n" + "Your future depends on what you do today.\n" + "The best way to find yourself is to lose yourself in the service of others." + "\nIf you want to change the world, start with yourself."
        gandhiPost.profileImageName = "gandhi"
        gandhiPost.statusImage = "gandhi_status"
        gandhiPost.statusImageUrl = "http://www.thefamouspeople.com/profiles/images/og-gandhi.jpg"
        gandhiPost.likes = 2.6
        gandhiPost.comments = 65.742
        posts.append(gandhiPost)
        
        
        let timPost = Post()
        timPost.name = "Tim Cook"
        timPost.statusText = "I learned that focus is key.\n" + "\nNot just in your running a company, but in your personal life as well."
        timPost.profileImageName = "tim_profile"
        timPost.statusImage = "tim_post"
        timPost.statusImageUrl = "http://i2.cdn.turner.com/money/dam/assets/150908192226-tim-cook-apple-logo-thinking-780x439.jpg"
        timPost.likes = 1.79
        timPost.comments = 23.894
        posts.append(timPost)
        
        
        let hillaryPost = Post()
        hillaryPost.name = "Hillary Clinton"
        hillaryPost.statusText = "Women are the largest untapped reservoir of talent in the world."
        hillaryPost.profileImageName = "hillary"
        hillaryPost.statusImage = "hillary_post"
        hillaryPost.statusImageUrl = "http://static.politico.com/3a/a4/5ab5c48043ac8a57c4ced8975872/160208-hillary-clinton-1160-gty.jpg"
        hillaryPost.likes = 1.19
        hillaryPost.comments = 18.287
        posts.append(hillaryPost)
        
        
        let billPost = Post()
        billPost.name = "Bill Gates"
        billPost.statusText = "Life is not fair, get used to it.\n" + "\nFlipping burgers is not beneath your dignity.\n" + "your grandparents had a different word for your burger flipping: they called it \"OPPORTUNITY\"."
        billPost.profileImageName = "gates"
        billPost.statusImage = "gates_post"
        billPost.statusImageUrl = "https://addicted2success.com/wp-content/uploads/2014/11/Bill-Gates-Quotes.jpg"
        billPost.likes = 3.85
        billPost.comments = 35.117
        posts.append(billPost)
        
        
        
        let trumpPost = Post()
        trumpPost.name = "Donald Trump"
        trumpPost.statusText = "Money was never a big motivation for me, except as a way to keep score.\n" +  "The real excitement to play the game."
        trumpPost.profileImageName = "trump"
        trumpPost.statusImage = "trump_post"
        trumpPost.statusImageUrl = "http://c0.nrostatic.com/sites/default/files/uploaded/donald-trump-bankruptcy-lies.jpg"
        trumpPost.likes = 2.104
        trumpPost.comments = 32.510
        posts.append(trumpPost)
    }
}

