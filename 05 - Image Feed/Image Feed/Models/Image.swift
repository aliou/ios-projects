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

  init(label: String, imageURL: String) {
    self.label = label
    self.resourceURL = NSURL(string: imageURL)
  }
}