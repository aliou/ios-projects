//
//  ViewController.swift
//  No Storyboard
//
//  Created by Aliou Diallo on 21/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

  private lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.text = "Loading..."
    label.font = label.font.fontWithSize(20)
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  private lazy var stepsLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.fontWithSize(40)
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  private lazy var stepsDescriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "steps so far today"
    label.font = label.font.fontWithSize(20)
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  private lazy var previousDayStepsLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.fontWithSize(15)
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  let pedometer = CMPedometer()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(messageLabel)
    fetchSteps()
    setupConstraints()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

  private func setupConstraints() {
    view.addConstraints([
      NSLayoutConstraint(item: messageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view,
        attribute: .CenterX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: messageLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view,
        attribute: .CenterY, multiplier: 1, constant: 0)
      ])
  }

  private func fetchSteps() {
    if !CMPedometer.isStepCountingAvailable() {
      messageLabel.text = "Steps data is not available."
      return
    }

    let today = NSDate().beginningOfDay()
    let yesterday = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: today, options: [])!
    let now = NSDate()

    pedometer.queryPedometerDataFromDate(today, toDate: now) {
      (data: CMPedometerData?, error: NSError?) -> Void in

      // Since we update something related to the UI, we need to do it in the
      // main queue / thread or Xcode throws warnings everywhere.
      dispatch_async(dispatch_get_main_queue()) {
        // Implicit unwrapping of the `data` object.
        if let stepsData = data {
          self.setupStepsViews(stepsData.numberOfSteps)
        } else {
          self.messageLabel.text = "Error retrieving the steps data."
        }
      }
    }

    pedometer.queryPedometerDataFromDate(yesterday, toDate: today) {
       (data: CMPedometerData?, error: NSError?) -> Void in

      dispatch_async(dispatch_get_main_queue()) {
        if let stepsData = data {
          self.previousDayStepsLabel.text = "\(stepsData.numberOfSteps) steps walked the yesterday"
          self.view.addSubview(self.previousDayStepsLabel)

          self.view.addConstraints([
            NSLayoutConstraint(item: self.previousDayStepsLabel, attribute: .CenterX,
              relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.previousDayStepsLabel, attribute: .CenterY,
              relatedBy: .Equal, toItem: self.view, attribute: .BottomMargin, multiplier: 1, constant: -15)
          ])
        }
      }
    }
  }

  private func setupStepsViews(stepCount: NSNumber) {
    stepsLabel.text = String(stepCount)

    messageLabel.removeFromSuperview()
    view.addSubview(stepsLabel)
    view.addSubview(stepsDescriptionLabel)

    view.addConstraints([
      NSLayoutConstraint(item: stepsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view,
        attribute: .CenterX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: stepsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view,
        attribute: .CenterY, multiplier: 1, constant: -15),

      NSLayoutConstraint(item: stepsDescriptionLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view,
        attribute: .CenterX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: stepsDescriptionLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view,
        attribute: .CenterY, multiplier: 1, constant: 20),
    ])
  }
}
