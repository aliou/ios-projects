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
      let rvc = ImageListViewController<Image>()
      rvc.items = [
        Image(label: "Buildings", imageURL: "https://source.unsplash.com/category/buildings"),
        Image(label: "Food", imageURL: "https://source.unsplash.com/category/food"),
        Image(label: "Nature", imageURL: "https://source.unsplash.com/category/nature"),
        Image(label: "People", imageURL: "https://source.unsplash.com/category/people"),
        Image(label: "Technology", imageURL: "https://source.unsplash.com/category/technology"),
        Image(label: "Objects", imageURL: "https://source.unsplash.com/category/objects"),
      ]
      window.rootViewController = NavigationController(rootViewController: rvc)
      window.makeKeyAndVisible()
    }

    return true
  }
}

