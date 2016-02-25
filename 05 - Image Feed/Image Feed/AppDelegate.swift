//
//  AppDelegate.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    if let window = window {
      window.rootViewController = NavigationController(rootViewController: ImageListViewController<Image>())
      window.makeKeyAndVisible()
    }

    return true
  }
}

