//
//  LinkListDataSourceProtocol.swift
//  LinkList-ios
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import UIKit

protocol LinkListDataSourceProtocol: UITableViewDataSource {
  var loadedOnce: Bool { get set }
}