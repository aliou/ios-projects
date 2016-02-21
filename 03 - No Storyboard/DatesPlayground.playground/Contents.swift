//: Playground - noun: a place where people can play

import UIKit

extension NSDate {

  func beginningOfDay() -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components([.Year, .Month, .Day], fromDate: self)
    return calendar.dateFromComponents(components)!
  }

  func endOfDay() -> NSDate {
    let components = NSDateComponents()
    components.day = 1
    var date = NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self.beginningOfDay(), options: [])!
    date = date.dateByAddingTimeInterval(-1)
    return date
  }
}

NSDate().beginningOfDay()
NSDate().endOfDay()