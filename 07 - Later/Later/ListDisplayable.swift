//
//  ListDisplayable.swift
//  Later
//
//  Created by Aliou Diallo on 22/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

protocol ListDisplayable {
  func label() -> String
  func configureCell(cell: UITableViewCell)
}