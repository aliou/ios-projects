//
//  ViewController.swift
//  Tap Counter
//
//  Created by Aliou Diallo on 19/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var counter = 0 {
    didSet {
      valueLabel.text = String(counter)
    }
  }

  @IBOutlet weak var valueLabel: UILabel! {
    didSet {
      valueLabel.text = "0"
    }
  }

  @IBOutlet weak var resetButton: UIBarButtonItem! {
    didSet {
      resetButton.title = "Reset"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Counter"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func resetCounter(sender: AnyObject) {
    self.counter = 0
  }

  @IBAction func increaseCounter(sender: AnyObject) {
    self.counter++
  }
}

