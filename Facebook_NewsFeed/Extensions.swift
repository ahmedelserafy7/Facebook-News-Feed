//
//  Extensions.swift
//  Facebook_NewsFeed
//
//  Created by Ahmed.S.Elserafy on 8/4/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewDictionary = [String: UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

extension UIColor {
    static func rbg(red: CGFloat, green: CGFloat, blue: CGFloat)->UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
