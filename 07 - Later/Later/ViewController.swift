//
//  ViewController.swift
//  Later
//
//  Created by Aliou Diallo on 19/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit
import SafariServices

final class ViewController: UITableViewController {

  var bookmarks: [TextPresentable] = []

  init(bookmarks: [TextPresentable], style: UITableViewStyle) {
    self.bookmarks = bookmarks
    super.init(style: style)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    BookmarkClient.sharedClient.getBookmarks() { (bookmarks) in
      var bks: [TextPresentable] = []
      for bk in bookmarks {
        bks.append(bk as TextPresentable)
      }

      self.bookmarks = bks
//      let bks: [TextPresentable] = bookmarks
//      self.bookmarks = bks
      dispatch_async(dispatch_get_main_queue()) {
        self.tableView.reloadData()
      }
    }

    // Retrieve the bookmarks from here.
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookmarks.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = BookmarkTableViewCell()
    let item = self.bookmarks[indexPath.row]
    cell.accessoryType = .DisclosureIndicator
    cell.configure(withPresenter: item)

    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let item = self.bookmarks[indexPath.row] as! Bookmark
    let svc = SFSafariViewController(URL: item.url)

    if let nvc = navigationController {
      nvc.presentViewController(svc, animated: true, completion: nil)
    }
  }
}
