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
  var shadowColor: UIColor = UIColor.grayColor()
  var shadowOpacity: Float = 0.8
  var maxShadowOffset: CGSize = CGSize(width: 6.6, height: 6.6)
  var maxShadowRadius: CGFloat = 10.0

  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    shadowWithAmount(0.0)
  }

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)
    handleForceWithTouches(touches)
  }

  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesMoved(touches, withEvent: event)
    handleForceWithTouches(touches)
  }

  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesEnded(touches, withEvent: event)
    shadowWithAmount(0.0)
  }

  func handleForceWithTouches(touches: Set<UITouch>) {
    if touches.count != 1 { return  }

    guard let touch = touches.first else { return }

    shadowWithAmount(touch.force)

    self.setTitle("\(touch.force)", forState: .Normal)

    if touch.force >= maxForceValue {
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

    if touch.force == 0.0 {
      self.setTitle("TouchMe!", forState: .Normal)
    }
  }

  func shadowWithAmount(amount: CGFloat) {
    layer.shadowColor = shadowColor.CGColor
    layer.shadowOpacity = shadowOpacity
    let widthFactor = maxShadowOffset.width / maxForceValue
    let heightFactor = maxShadowOffset.height / maxForceValue
    layer.shadowOffset = CGSize(width: maxShadowOffset.width - amount * widthFactor,
      height: maxShadowOffset.height - amount * heightFactor)
    layer.shadowRadius = maxShadowRadius - amount
  }

}