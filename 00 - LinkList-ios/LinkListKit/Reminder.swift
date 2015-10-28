//
//  Reminder.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 27/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import Foundation
import Alamofire

public struct Reminder {
  public var url: String

  init(url: String) {
    self.url = url
  }

  public static func List(completionHandler: ([Reminder]?, NSError?) -> Void) {
    Alamofire.request(.GET, reminderEndpoint, parameters: nil, encoding: .JSON)
      .responseJSON { response in
        if let JSON = response.result.value as! [[String: String]]? {
          var reminders: [Reminder] = []

          for rawReminder in JSON {
            reminders.append(Reminder(url: rawReminder["url"]!))
          }

          completionHandler(reminders, nil)
        } else {
          completionHandler(nil, response.result.error)
        }
    }
  }

  public static func Create(url: String, completionHandler: (Reminder?, NSError?) -> Void) {
    let parameters = [
      "reminder": ["url": url]
    ]
    NSOperationQueue.mainQueue().addOperationWithBlock {
      Alamofire.request(.POST, reminderEndpoint, parameters: parameters, encoding: .JSON)
        .responseJSON { response in
          if let JSON = response.result.value as! [String: String]? {
            let reminder = Reminder(url: JSON["url"]!)
            completionHandler(reminder, nil)
          } else {
            completionHandler(nil, response.result.error)
          }
      }
    }
  }
}