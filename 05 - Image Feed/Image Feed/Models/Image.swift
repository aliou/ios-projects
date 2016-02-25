//
//  Image.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

struct Image {
  var name: String
  var url: String

  init(_ name: String, _ url: String) {
    self.name = name
    self.url = url
  }
}