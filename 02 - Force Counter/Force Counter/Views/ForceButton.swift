//
//  ForceButton.swift
//  Force Counter
//
//  Created by Aliou Diallo on 20/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit
import AudioToolbox

class ForceButton: UIButton {
  private let maxForceValue: CGFloat = 6.6
  var shadowColor: UIColor = UIColor.gray
  var shadowOpacity: Float = 0.8
  var maxShadowOffset: CGSize = CGSize(width: 10, height: 10)
  var maxShadowRadius: CGFloat = 10.0

  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    shadowWithAmount(0.0)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    handleForceWithTouches(touches)
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    handleForceWithTouches(touches)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    shadowWithAmount(0.0)
  }

  func handleForceWithTouches(_ touches: Set<UITouch>) {
    if touches.count != 1 { return  }

    guard let touch = touches.first else { return }

    shadowWithAmount(touch.force)

    // The maxForceValue is an approximation, slighty below the actual max value.
    var percentage = touch.force / maxForceValue * 100
    if percentage > 100 { percentage = 100 }
    let formattedPercentage = NSString(format: "%.2f", percentage)

    self.setTitle("\(formattedPercentage)%", for: UIControlState())

    if touch.force >= maxForceValue {
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

    if touch.force == 0.0 {
      self.setTitle("TouchMe!", for: UIControlState())
    }
  }

  func shadowWithAmount(_ amount: CGFloat) {
    layer.shadowColor = shadowColor.cgColor
    layer.shadowOpacity = shadowOpacity
    let widthFactor = maxShadowOffset.width / maxForceValue
    let heightFactor = maxShadowOffset.height / maxForceValue
    layer.shadowOffset = CGSize(width: maxShadowOffset.width - amount * widthFactor,
      height: maxShadowOffset.height - amount * heightFactor)
    layer.shadowRadius = maxShadowRadius - amount
  }
}
