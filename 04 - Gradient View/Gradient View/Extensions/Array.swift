//
//  Array.swift
//  Gradient View
//
//  Created by Aliou Diallo on 22/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import Foundation

extension Array {
  func randomItem() -> Element? {
    if self.isEmpty { return nil }
    
    let index = Int(arc4random_uniform(UInt32(self.count)))
    return self[index]
  }
}