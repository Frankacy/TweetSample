//
//  AppDelegate.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: TweetListCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        rootCoordinator = TweetListCoordinator()
        window?.rootViewController = rootCoordinator?.navigationController
        window?.makeKeyAndVisible()

        UINavigationBarAppearance()
        
        return true
    }

    func UINavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .appBlue
        UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName : UIFont.montserrat(size: 18),
                                                             NSForegroundColorAttributeName : UIColor.white ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes([NSFontAttributeName : UIFont.montserrat(size: 14),
                                                                                                               NSForegroundColorAttributeName : UIColor.white],
                                                                                                              for: .normal)
    }
}

