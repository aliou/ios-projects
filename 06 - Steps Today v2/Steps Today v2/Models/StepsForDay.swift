//
//  StepsForDay.swift
//  Steps Today v2
//
//  Created by Aliou Diallo on 16/03/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

struct StepsForDay {
  let date: NSDate
  let steps: Int

  init(date: NSDate) {
    self.date = date
    // Get the date from the podometer.
    self.steps = 0
  }

  func currentDate() -> Bool {
    return false
  }
}