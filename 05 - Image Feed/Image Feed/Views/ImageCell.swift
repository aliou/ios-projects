//
//  ImageCell.swift
//  Image Feed
//
//  Created by Aliou Diallo on 25/02/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

let ImageCellReuseIdentifier = "ImageCellReuseIdentifier"

class ImageCell: UITableViewCell {

  var remoteImage: Image

  @IBOutlet weak var mainImageView: UIImageView!
  // MARK: - Init

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(remoteImage: Image) {
    self.remoteImage = remoteImage
    super.init(style: .Default, reuseIdentifier: ImageCellReuseIdentifier)

    self.remoteImage.downloadResource() {
      if let image = self.remoteImage.image {
        self.mainImageView.image = image
      }
    }
  }
}