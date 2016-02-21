//
//  AppDelegate.swift
//  No Storyboard
//
//  Created by Aliou Diallo on 21/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

  lazy var window: UIWindow? = {
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.rootViewController = ViewController()
    window.backgroundColor = .whiteColor()

    return window
  }()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window!.makeKeyAndVisible()
    return true
  }
}