//
//  Bookmark.swift
//  Later
//
//  Created by Aliou Diallo on 22/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

struct Bookmark: TextPresentable {
  let date: NSDate
  let url: NSURL
  let title: String?
  let description: String?

  init(date: NSDate, url: String, title: String?, description: String?) {
    self.date = date
    self.url = NSURL(string: url)!
    self.title = title
    self.description = description
  }
}

// Mark: TextPresentable Conformance
extension Bookmark {
  var text: String { return self.title ?? self.url.absoluteString }
}