//
//  AppDelegate.swift
//  FacebookFeedDemo
//
//  Created by Abhinay on 03/08/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        //Initial appearance of the app
        ApplicationAppearance.initialAppearance()
        
        //window's root object
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let fbFeedVC = FacebookFeedVC(collectionViewLayout: UICollectionViewFlowLayout())
        let navVC = UINavigationController(rootViewController:fbFeedVC)
        window?.rootViewController = navVC
        
        return true
    }

   
}

