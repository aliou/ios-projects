//
//  Image.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

struct Image: ListDisplayable {
  var label: String
  var url: String

  init(_ label: String, _ url: String) {
    self.label = label
    self.url = url
  }
}