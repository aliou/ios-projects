//
//  ReminderViewController.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import UIKit

class ReminderViewController: UITableViewController {

  lazy var segmentedControl: UISegmentedControl = {
    let items = ["Reminders", "Links"]
    let segmentedControl = UISegmentedControl(items: items)
    segmentedControl.selectedSegmentIndex = 0
    return segmentedControl
  }()

  lazy var listDataSource: UITableViewDataSource = {
    return ListDataSource(tableViewController: self)
  }()

  lazy var reminderDataSource: UITableViewDataSource = {
    return ReminderDataSource(tableViewController: self)
  }()

  // MARK: Initializers

  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = reminderDataSource
    // Add load indicator

    segmentedControl.addTarget(self, action: "updateDataSource:", forControlEvents: .ValueChanged)
//    self.navigationItem.titleView = segmentedControl
    let settingsButton = UIBarButtonItem(title: "⚙", style: .Plain, target: self, action: "pushSettings:")
    self.navigationItem.leftBarButtonItem = settingsButton

    let searchButton = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "pushSearch:")
    self.navigationItem.rightBarButtonItem = searchButton
  }

  // MARK: Actions

  func pushSettings(sender: UIBarButtonItem) {
    print("settings")
  }

  func pushSearch(sender: UIBarButtonItem) {
    print("search")
  }

  func updateDataSource(sender: UISegmentedControl) {
    // Update datasource.
    if sender.selectedSegmentIndex == 0 {
      self.tableView.dataSource = reminderDataSource
    } else if sender.selectedSegmentIndex == 1 {
      self.tableView.dataSource = listDataSource
    }

    self.tableView.reloadData()
    // Add load indicator unless data has been already fetched.
  }
}
