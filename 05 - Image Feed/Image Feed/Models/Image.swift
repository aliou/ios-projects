//
//  Image.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

struct Image: ListDisplayable, RemoteResourceable {
  var label: String
  var resourceURL: NSURL?

  var image: UIImage?

  init(label: String, imageURL: String) {
    self.label = label
    self.resourceURL = NSURL(string: imageURL)

    downloadResource()
  }

  mutating func downloadResource() {
    let queue = NSOperationQueue()

    queue.addOperationWithBlock() {
      if let _ = self.image { return }

      if let resource = self.resourceURL {
        let imageData = NSData(contentsOfURL: resource)
        if let imageData = imageData {
          self.image = UIImage(data: imageData)
        }
      }
    }
  }
}
