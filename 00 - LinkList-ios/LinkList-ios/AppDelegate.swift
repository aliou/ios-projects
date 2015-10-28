//
//  AppDelegate.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var window: UIWindow? = {
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.backgroundColor = UIColor.whiteColor()
    window.rootViewController = UINavigationController(rootViewController: ReminderViewController())
    return window
  }()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window!.makeKeyAndVisible()

    return true
  }
}

