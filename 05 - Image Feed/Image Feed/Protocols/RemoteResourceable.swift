//
//  RemoteResourceable.swift
//  Image Feed
//
//  Created by Aliou Diallo on 28/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//


import UIKit

// TODO: Find a better way for this protocol.
protocol RemoteResourceable {
  var resourceURL: NSURL? { get set }
}