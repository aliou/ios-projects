//
//  BookmarkTableViewCell.swift
//  Later
//
//  Created by Aliou Diallo on 22/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {

  func configure(withPresenter presenter: TextPresentable) {
    textLabel!.text = presenter.text
  }
}
