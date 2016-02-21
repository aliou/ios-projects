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

  private lazy var stepsLabel: UILabel = {
    let label = UILabel()
    label.text = "Loading..."
    label.font = label.font.fontWithSize(20)
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  let pedometer = CMPedometer()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(stepsLabel)
    fetchSteps()
    setupConstraints()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

  private func setupConstraints() {
    view.addConstraints([
      NSLayoutConstraint(item: stepsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view,
        attribute: .CenterX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: stepsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view,
        attribute: .CenterY, multiplier: 1, constant: 0)
      ])
  }

  private func fetchSteps() {
    if !CMPedometer.isStepCountingAvailable() {
      stepsLabel.text = "Steps data is not available."
      return
    }

    let today = NSDate().beginningOfDay()
    let now = NSDate()

    pedometer.queryPedometerDataFromDate(today, toDate: now) {
      (data: CMPedometerData?, error: NSError?) -> Void in
      var labelText: String
      // Implicit unwrapping of the `data` object.
      if let stepsData = data {
        labelText = "\(stepsData.numberOfSteps) steps so far today."
      } else {
        labelText = "Error retrieving the steps data."
      }

      // Since we update something related to the UI, we need to do it in the
      // main queue / thread or Xcode throws warnings everywhere.
      dispatch_async(dispatch_get_main_queue()) {
        self.stepsLabel.text = labelText
      }
    }
  }
}
