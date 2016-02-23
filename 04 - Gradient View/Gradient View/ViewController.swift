//
//  ViewController.swift
//  Gradient View
//
//  Created by Aliou Diallo on 22/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit
import GradientView

class ViewController: UIViewController {

  let gradientColors = [[
      UIColor(red: 1, green: 0.72, blue: 0.53, alpha: 1),
      UIColor(red: 0.88, green: 0.38, blue: 0.37, alpha: 1)
    ],[
      UIColor(red: 0.15, green: 0.31, blue: 0.6, alpha: 1),
      UIColor(red: 0.11, green: 0.23, blue: 0.45, alpha: 1)
    ], [
      UIColor(red: 0.33, green: 0.56, blue: 0.79, alpha: 1),
      UIColor(red: 0.26, green: 0.49, blue: 0.8, alpha: 1)
    ], [
      UIColor(red: 0.25, green: 0.26, blue: 0.27, alpha: 1),
      UIColor(red: 0.14, green: 0.15, blue: 0.15, alpha: 1)
    ]
  ]

  var gradientView: GradientView?
  var currentImageIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    gradientView = GradientView(frame: view.frame)
    let colors = gradientColors.randomItem()!
    gradientView!.colors = colors
    currentImageIndex = gradientColors.indexOf({ $0 == colors })!

    let tap = UITapGestureRecognizer(target: self, action: "updateColor:")
    gradientView?.addGestureRecognizer(tap)

    view.addSubview(gradientView!)
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  func updateColor(sender: UIGestureRecognizer) {
    if let gradientView = gradientView {
      currentImageIndex = (currentImageIndex + 1) % gradientColors.count
      gradientView.colors = gradientColors[currentImageIndex]
    }
  }
}
