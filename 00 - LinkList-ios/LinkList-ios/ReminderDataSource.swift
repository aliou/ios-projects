//
//  ReminderDataSource.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import UIKit
import LinkListKit

class ReminderDataSource : NSObject, LinkListDataSourceProtocol {
  var items: [String] = []
  var tableViewController: UITableViewController? = nil
  var loadedOnce = false

  init(tableViewController: UITableViewController) {
    super.init()
    
    self.tableViewController = tableViewController
    Reminder.List { (results, error) in
      if let reminders = results {
        for reminder in reminders {
          self.items.append(reminder.url)
        }
        self.tableViewController?.tableView.reloadData()
      } else {
      }
    }
    // Fetch data, pass delegate updating the tableViewController unless it's already fetched.
  }

  @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let item: String

    if indexPath.row < self.items.count {
      item = items[indexPath.row]
    } else {
      item = "nope"
    }

    cell.textLabel?.text = item

    return cell
  }

  @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }

  @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}