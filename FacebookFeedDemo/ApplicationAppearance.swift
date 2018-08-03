//
//  ApplicationAppearance.swift
//  FacebookFeedDemo
//
//  Created by Abhinay on 03/08/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class ApplicationAppearance
{
    static func initialAppearance()
    {
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().barTintColor = AppConstant.Color.blueColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 24.0)]
    }
}

struct AppConstant
{
    struct Color {
       static let blueColor = UIColor(red: 87/255.0, green: 114/255.0, blue: 156/255.0, alpha: 1.0)
    }
}
