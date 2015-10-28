//
//  Link.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 27/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import Foundation
import Alamofire

public struct Link {
  public var url: String
  public var title: String
  public var tags: [String]

  init(url: String, title: String, tags: [String]?) {
    self.url = url
    self.title = title
    
    if let tags = tags {
      self.tags = tags
    } else {
      self.tags = []
    }
  }

  public static func List(completionHandler: ([Link]?, NSError?) -> Void) {
    Alamofire.request(.GET, "\(linkEndpoint).json", parameters: nil, encoding: .JSON)
      .responseJSON { response in
        
        if let JSON = response.result.value as! [[String: String]]? {
          var links: [Link] = []

          for rawReminder in JSON {
            links.append(Link(url: rawReminder["url"]!, title: rawReminder["title"]!, tags: []))
          }

          completionHandler(links, nil)
        } else {
          completionHandler(nil, response.result.error)
        }
    }
  }

  public static func Create(url: String, completionHandler: (Link?, NSError?) -> Void) {
    let parameters = [
      "reminder": ["url": url]
    ]
    NSOperationQueue.mainQueue().addOperationWithBlock {
      Alamofire.request(.POST, linkEndpoint, parameters: parameters, encoding: .JSON)
        .responseJSON { response in
          if let JSON = response.result.value as! [String: String]? {
            let link = Link(url: JSON["url"]!, title: JSON["title"]!, tags: [])
            completionHandler(link, nil)
          } else {
            completionHandler(nil, response.result.error)
          }
      }
    }
  }

}