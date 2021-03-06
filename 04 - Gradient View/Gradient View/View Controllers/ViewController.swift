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
      UIColor(red: 0.33, green: 0.56, blue: 0.79, alpha: 1),
      UIColor(red: 0.26, green: 0.49, blue: 0.8, alpha: 1)
    ], [
      UIColor(red: 0.25, green: 0.26, blue: 0.27, alpha: 1),
      UIColor(red: 0.14, green: 0.15, blue: 0.15, alpha: 1)
    ], [
      UIColor(red: 0.21, green: 0.56, blue: 0.73, alpha: 1),
      UIColor(red: 1, green: 0.27, blue: 0.37, alpha: 1)
    ], [
      UIColor(red: 0.95, green: 0.63, blue: 0.67, alpha: 1),
      UIColor(red: 0.93, green: 0.53, blue: 0.65, alpha: 1)
    ]
  ]

  var gradientView: GradientView?
  var currentImageIndex = 0

  lazy var saveButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false

    button.setTitle("Save", for: UIControlState())
    button.setTitleColor(.white, for: UIControlState())
    button.backgroundColor = .clear

    button.layer.borderWidth = 1.0
    button.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
    button.layer.cornerRadius = 5.0

    button.addTarget(self, action: #selector(ViewController.saveImage(_:)), for: .touchUpInside)

    return button
  }()

////////////////////////////////////////////////////////////////////////////////

  override func viewDidLoad() {
    super.viewDidLoad()

    setupGradientView()
    setupSaveButton()
  }

  override var prefersStatusBarHidden : Bool {
    return true
  }

////////////////////////////////////////////////////////////////////////////////

  func setupGradientView() {
    gradientView = GradientView(frame: view.frame)
    let colors = gradientColors.randomItem()!
    gradientView!.colors = colors
    currentImageIndex = gradientColors.index(where: { $0 == colors })!

    let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.updateColor(_:)))
    gradientView?.addGestureRecognizer(tap)

    view.addSubview(gradientView!)
  }

  func setupSaveButton() {
    view.addSubview(saveButton)
    view.addConstraints([
      NSLayoutConstraint(item: saveButton, attribute: .centerX, relatedBy: .equal,
        toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: saveButton, attribute: .centerY, relatedBy: .equal,
        toItem: view, attribute: .bottomMargin, multiplier: 1, constant: -50),
      NSLayoutConstraint(item: saveButton, attribute: .left, relatedBy: .equal,
        toItem: view, attribute: .left, multiplier: 1, constant: 50),
    ])
  }

////////////////////////////////////////////////////////////////////////////////

  func saveImage(_ sender: UIButton) {
    UIGraphicsBeginImageContext(gradientView!.bounds.size)
    gradientView!.layer.render(in: UIGraphicsGetCurrentContext()!)
    let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    UIImageWriteToSavedPhotosAlbum(gradientImage!, self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
  }

  func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
    if error == nil {
      let ac = UIAlertController(title: "Saved!", message: "Your gradient has been saved.", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(ac, animated: true, completion: nil)
    } else {
      let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(ac, animated: true, completion: nil)
    }
  }

  func updateColor(_ sender: UIGestureRecognizer) {
    if let gradientView = gradientView {
      currentImageIndex = (currentImageIndex + 1) % gradientColors.count
      gradientView.colors = gradientColors[currentImageIndex]
    }
  }
}
