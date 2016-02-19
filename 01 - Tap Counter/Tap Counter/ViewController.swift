//
//  ViewController.swift
//  Tap Counter
//
//  Created by Aliou Diallo on 19/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var value = 0
  @IBOutlet weak var valueLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let leftButton =  UIBarButtonItem(title: "Reset", style: .Plain, target: self, action: "reset")

    navigationItem.leftBarButtonItem = leftButton
    navigationItem.title = "Counter"

    reset()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func updateLabel(sender: AnyObject) {
    self.value += 1
    updateLabel()
  }

  func reset() {
    self.value = 0
    updateLabel()
  }

  func updateLabel() {
    valueLabel.text = String(value)
  }
}

