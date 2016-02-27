//
//  ImageListViewController.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

class ImageListViewController<Item: protocol<ListDisplayable, RemoteResourceable>>: UITableViewController {

  var items: [Item] = [] {
    didSet { tableView.reloadData() }
  }

  var configureCell: (ImageCell, Item) -> Void = {
    (cell, image) in cell.textLabel!.text = image.label
  }


////////////////////////////////////////////////////////////////////////////////
  // MARK: - Init

  init() {
    super.init(nibName: nil, bundle: nil)
  }

////////////////////////////////////////////////////////////////////////////////
  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

////////////////////////////////////////////////////////////////////////////////
  // MARK: - UITableViewDataSource

  override func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      return items.count
  }

  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = ImageCell()
      configureCell(cell, items[indexPath.row])

      return cell
  }
////////////////////////////////////////////////////////////////////////////////
}