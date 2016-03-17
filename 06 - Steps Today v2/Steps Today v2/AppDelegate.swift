//
//  AppDelegate.swift
//  Steps Today v2
//
//  Created by Aliou Diallo on 16/03/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window!.rootViewController = StepsViewController()
    window!.makeKeyAndVisible()
    return true
  }
}
