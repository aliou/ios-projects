//
//  ViewController.swift
//  Later
//
//  Created by Aliou Diallo on 19/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {

  let bookmarks: [ListDisplayable]

  init(bookmarks: [ListDisplayable], style: UITableViewStyle) {
    self.bookmarks = bookmarks
    super.init(style: style)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookmarks.count
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}