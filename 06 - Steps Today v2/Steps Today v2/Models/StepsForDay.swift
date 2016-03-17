//
//  StepsForDay.swift
//  Steps Today v2
//
//  Created by Aliou Diallo on 16/03/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit
import CoreMotion

struct StepsForDay {
  static let pedometer = CMPedometer()

  let date: NSDate
  var steps: Int?

  init(date: NSDate) {
    self.date = date.beginningOfDay()
    // Get the date from the podometer.
    StepsForDay.pedometer.queryPedometerDataFromDate(self.date, toDate: self.date.endOfDay()) {
      (data: CMPedometerData?, error: NSError?) -> Void in
      if let data = data {
        self.steps = Int(data.numberOfSteps)
      } else {
        self.steps = nil
      }
    }
  }

  func isCurrentDate() -> Bool {
    return self.date.beginningOfDay() == NSDate().beginningOfDay()
  }
}