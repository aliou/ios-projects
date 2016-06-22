//
//  AppDelegate.swift
//  Later
//
//  Created by Aliou Diallo on 19/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let bookmarks: [ListDisplayable] = [
      Bookmark(date: NSDate(), url: "http://aliou.me", title: nil, description: nil)
    ]
    let vc = ViewController(bookmarks: bookmarks, style: .Plain)
    window!.rootViewController = NavigationController(rootViewController: vc)
    window!.makeKeyAndVisible()
    return true
  }
}
